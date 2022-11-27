#' Spatial query for MAPPPD
#'
#' Accesses and searches through the sites_sf shape using a point and a buffer size
#'
#' @param Latitude Latitude in decimal degrees (WGS 1984)
#' @param Longitude Longitude in decimal degrees (WGS 1984)
#' @param distance Decimal distance in kilometers
#' 
#' @importFrom sf st_as_sf st_transform st_buffer st_crs st_intersection
#' @export
#' 
#' @examples
#' library(mapppdr)
#' land_mask <- sf::st_as_sf(CCAMLRGIS::load_Coastline()) %>%
#'   dplyr::select(layer) %>%
#'   dplyr::filter(layer == "coastline") %>%
#'   sf::st_transform(4326)
#' 
#' Latitude <- -60.7612
#' Longitude <- -44.637
#' Buffer <- 5
#' 
#' searched <- mapppdr::mapppd_searchr(Latitude,Longitude,Buffer)
#' 
#' land_mask_crop <- sf::st_crop(land_mask,sf::st_bbox(searched))
#' extentdat <- sf::st_bbox(tsearched)
#' 
#' ggplot() +
#'   geom_sf(data=land_mask)+
#'   geom_sf(data=searched)+
#'   coord_sf(xlim = c(extentdat[1]-0.25, extentdat[3]+0.25), 
#'            ylim = c(extentdat[2]-0.25, extentdat[4]+0.25), expand = FALSE)
#'            


mapppd_searchr <- function(Latitude=NULL,Longitude=NULL,distance=NULL){
  
  Buffer <- distance*1000
  DT <- data.frame(Latitude,Longitude)
  DT_sf <- sf::st_as_sf(DT, coords = c("Longitude", "Latitude"), 
                        crs = 4326)
  DT_sf <- sf::st_transform(DT_sf,sf::st_crs(sites_sf)) 
  Buff <- sf::st_buffer(DT_sf,dist = Buffer)
  Intersects <- sf::st_intersection(sites_sf,Buff)
  return(Intersects)
}