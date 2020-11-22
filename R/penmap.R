#' Create leaflet of penguin breeding sites
#'
#' Creates leaflet of all known Pygoscelis and Emperor penguin breeding sites south of 60 degrees S latitude contained within MAPPPD.
#'
#' @param species_map character vector of penguin species to include on map. Species are referenced using the species_id codes found in the species table.
#'
#' Default \code{'c("ADPE", "GDPE", "CHPE", "EMPE")'} returns breeding sites for all penguin species in MAPPPD.
#'
#' @section Details:
#' \code{species_id} argument must be a character vector.
#'
#' @section Notes:
#' The map provides several helpful layers. These include the CCAMLR Statistical Areas and Divisions and Marine Protected Areas, the Antarctic Coastline (all exported from the `CCAMLRGIS` R package) and the Landsat Image Mosaic Of Antarctica (LIMA) (Bindschadler et al. 2008) WMS tiles hosted by the [Polar Geospatial Center](https://www.pgc.umn.edu).
#'
#' @section References:
#' Bindschadler, R., P. Vornberger, A. Fleming, A. Fox, J. Mullins, D. Binnie, S. J. Paulsen, B. Granneman, and . Gorodetzky. (2008). "The Landsat image mosaic of Antarctica". _Remote Sensing of Environment_ 112(12): 4214-4226,  \url{https://doi.org/10.1016/j.rse.2008.07.006}
#'
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166,  \url{https://doi.org/10.1017/S0032247417000055}
#'
#' Stephane T., K. Reid and L. Robinson (2020). CCAMLRGIS: Antarctic Spatial Data Manipulation. R package version 3.0.6.  \url{https://CRAN.R-project.org/package=CCAMLRGIS}
#'
#' @examples
#' # Make default map
#' # penmap()
#'
#' # Make map of just Adelie sites
#' # penmap("ADPE")
#'
#' # Save leaflet in working directory
#' # This html file can be easily shared and opens in any web browser
#' # htmlwidgets::saveWidget(penmap("ADPE"), file = "penmap.html")
#'
#' # Make map of adelie and chinstrap sites
#' # penmap(species_map = c("ADPE", "CHPE"))
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr filter inner_join mutate select
#' @importFrom tidyr unite pivot_wider
#' @importFrom grDevices topo.colors hcl.colors
#' @importFrom leaflet leaflet leafletCRS leafletOptions setView addPolygons addScaleBar
#' @importFrom leaflet colorFactor addCircleMarkers markerClusterOptions addLayersControl
#' @importFrom leaflet layersControlOptions hideGroup addEasyButton easyButton
#' @importFrom leaflet.esri addEsriTiledMapLayer
#' @importFrom htmlwidgets JS
#' @importFrom rlang .data
#' @import sf
#' @export
#'

penmap <- function(species_map = c("ADPE", "GEPE", "CHPE", "EMPE")) {

  # check that only valid species_id codes are used
  # if any invalid species_id code is used then stop function
  if (any(!(species_map %in% c("ADPE", "GEPE", "CHPE", "EMPE"))) == TRUE) {
    stop("unknown species_id code(s) specified")
  } else {

  temp <- mapppdr::site_species %>%
    dplyr::filter(.data$species_id %in% species_map) %>%
    tidyr::pivot_wider(names_from = .data$species_id, values_from = .data$species_id) %>%
    tidyr::unite('species_id', species_map, sep = ', ', na.rm = TRUE)
  if (base::length(species_map) == 1) {
    sites_to_map <- dplyr::inner_join(x = mapppdr::sites_sf, y = temp, by = "site_id") %>%
      dplyr::mutate(label_id = paste0("<b><center>", .data$site_id, "</b>", "<br/>",
        .data$site_name, "<br/></center>"))
  }
  if (base::length(species_map) > 1) {
    sites_to_map <- dplyr::inner_join(x = mapppdr::sites_sf, y = temp, by = "site_id") %>%
      dplyr::mutate(label_id = paste0("<b><center>", .data$site_id, "</b>", "<br/>",
        .data$site_name, "<br/>", .data$species_id, "</center>"))
  }

  # define map server for LIMA
  tile_url <- "https://overlord.pgc.umn.edu/arcgis/rest/services/imagery/ant_pgc_composite_mosaic/MapServer"

  # define 3031 leaflet CRS
  # resolution, origin, and bounds taken from LIMA metadata found at PGC WMS MapServer url (tile_url)
  crs_3031 <- leaflet::leafletCRS(
    crsClass = 'L.Proj.CRS',
    code = 'EPSG:3031',
    proj4def = '+proj=stere +lat_0=-90 +lat_ts=-71 +lon_0=0 +k=1 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs',
    resolutions = c(32000.000000000004, 16000.000000000002, 8000.000000000001, 4000.0000000000005, 2000.0000000000002,
      1000.0000000000001, 500.00000000000006, 250.00000000000003, 120.00000000000001, 60.00000000000001, 30.000000000000004,
      15.000000000000002, 8, 4, 2, 1, .5),
    origin = c(-30636100, 30636099.999999993),
    bounds =  list( c(-3000000, 4000005.0001000017), c(3000000.0001, -3000000)))

  # set color palettes for asd and mpa layers
  factpal_asd <- leaflet::colorFactor(grDevices::topo.colors(base::nrow(asd_mask)), as.factor(asd_mask$ccamlr_id))
  factpal_mpa <- leaflet::colorFactor(grDevices::hcl.colors(base::nrow(mpa_mask)), as.factor(mpa_mask$mpa_id))

  out <- leaflet::leaflet(
    options = leaflet::leafletOptions(
      crs = crs_3031,
      # min and max Zoom control the lowest (most zoomed out) and highest zoom level permitted
      # these values were set using the number of resolutions available for LIMA
      minZoom = 1,
      maxZoom = 16,
      # zoomSnap controls how small you can define the zoom level
      zoomSnap = 0.25,
      # zoomDelta controls how much the view zooms when clicking zoom control buttons
      zoomDelta = 0.5,
      # not sure if this matters but set to false it seemed to have weird behavior with sites
      # on islands outside of LIMA
      worldCopyJump = TRUE)) %>%
  # sets the long, lat, and starting zoom
  # zoom set to just show antarctica S of 60 S latitude on a 15 inch laptop screen
  leaflet::setView(0, -90, 2.25) %>%
  leaflet::addScaleBar(position = c("bottomleft")) %>%
  # add the land mask first
  leaflet::addPolygons(data = land_mask,
    color = "black",
    weight = 1,
    opacity = 1.0,
    fillOpacity = 0.5,
    fillColor = "lightgray",
    group = "CCAMLR Coastline") %>%
  # add ccamlr subareas
  leaflet::addPolygons(data = asd_mask,
    color = "black",
    weight = 1,
    opacity = 1.0,
    fillOpacity = 0.15,
    popup = asd_mask$ccamlr_id,
    fillColor = ~factpal_asd(ccamlr_id),
    group = "CCAMLR Statistical Areas and Divisions") %>%
  # add mpas
  leaflet::addPolygons(data = mpa_mask,
    color = "black",
    weight = 1,
    opacity = 1.0,
    fillOpacity = 0.15,
    popup = mpa_mask$mpa_id,
    fillColor = ~factpal_mpa(mpa_id),
    group = "CCAMLR Marine Protected Areas (MPA)") %>%
  # add Landsat Image Mosaic Of Antarctica (LIMA) WMS tile
  leaflet.esri::addEsriTiledMapLayer(tile_url, group = "Landsat Image Mosaic Of Antarctica (LIMA)") %>%
  # add penguin colonies
  leaflet::addCircleMarkers(
    data = sites_to_map,
    popup = sites_to_map$label_id,
    group = "MAPPPD Penguin Colonies",
    clusterOptions = leaflet::markerClusterOptions(
      removeOutsideVisibleBounds = FALSE,
      spiderfyOnMaxZoom = TRUE),
    clusterId = "ColonyClusters") %>%
  # specify groups and hide the CCAMLR ADD and MPA groups
  leaflet::addLayersControl(
    overlayGroups = c("CCAMLR Coastline", "CCAMLR Statistical Areas and Divisions", "CCAMLR Marine Protected Areas (MPA)",
      "Landsat Image Mosaic Of Antarctica (LIMA)", "MAPPPD Penguin Colonies"),
    options = leaflet::layersControlOptions(collapsed = FALSE)) %>%
  leaflet::hideGroup(c("CCAMLR Statistical Areas and Divisions", "CCAMLR Marine Protected Areas (MPA)")) %>%
  # add zoom out button
  leaflet::addEasyButton(
    leaflet::easyButton(
      icon = "fa-globe",
      title = "Zoom Out",
      onClick = htmlwidgets::JS("function(btn, map){ map.setView([-90, 0], 2.25); }")
    )
  ) %>%
  # this button freezes or unfreezes colony clustering
  # this is useful when the colonies are so close that splitting them apart occurs at a zoom level > the highest LIMA zoom
  leaflet::addEasyButton(
    leaflet::easyButton(
      states = list(
        leaflet::easyButtonState(
          stateName = "unfrozen-markers",
          icon = "ion-toggle",
          title = "Freeze Colony Clusters",
          onClick = htmlwidgets::JS("
            function(btn, map) {
              var clusterManager =
              map.layerManager.getLayer('cluster', 'ColonyClusters');
              clusterManager.freezeAtZoom();
              btn.state('frozen-markers');
            }"
          )
        ),
      leaflet::easyButtonState(
        stateName = "frozen-markers",
        icon = "ion-toggle-filled",
        title = "UnFreeze Colony Clusters",
        onClick = htmlwidgets::JS("
          function(btn, map) {
            var clusterManager =
              map.layerManager.getLayer('cluster', 'ColonyClusters');
              clusterManager.unfreeze();
              btn.state('unfrozen-markers');
            }"
          )
        )
      )
    )
  )

  return(out)

  }
}

