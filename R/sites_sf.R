#' Name and location of MAPPPD seabird breeding sites
#'
#' A dataset containing the name and location of all known Pygoscelis, emperor,
#' king, and macaroni penguin breeding sites south of 60 degrees S latitude
#' and all Antarctic Site Inventory (ASI) penguin/seabird census sites
#' contained within MAPPPD.
#'
#' @format An sf data frame with 719 rows, 4 attribute variables, and 1 simple features geometry column:
#' \describe{
#'   \item{site_id}{unique identifier for each site}
#'   \item{site_name}{site name and/or description}
#'   \item{region}{site region as reported in the 2015 ASI Antarctic Peninsula Compendium (Naveen and Lynch, 2015) }
#'   \item{ccamlr_id}{Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) subarea within which the site lies}
#'   \item{geometry}{simple features POINT geometries of all site location (EPSG:4326)}
#' }
#' @source \url{http://www.penguinmap.com/}
#' @source \url{https://oceanites.org/research-portal/antarctic-site-inventory/asi-census-sites/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166,  \url{https://doi.org/10.1017/S0032247417000055}
#'
#' Naveen, R. and Lynch H. J. (2015). "Antarctic Peninsula Compendium" 3rd Edition, Chevy Chase, Maryland, USA.
"sites_sf"
