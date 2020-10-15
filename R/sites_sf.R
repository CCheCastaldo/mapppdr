#' Name and location of MAPPPD seabird breeding sites
#'
#' A simple features dataset containing the name and location of all known Pygoscelis
#' and Emperor penguin breeding sites south of 60 degrees S latitude
#' and all Antarctic Site Inventory (ASI) penguin/seabird census sites.
#'
#' @format A simple features data frame with 748 rows and 5 variables:
#' \describe{
#'   \item{site_id}{unique identifier for each site}
#'   \item{site_name}{site name and/or description}
#'   \item{region}{site region as reported in the 2015 ASI Antarctic Peninsula Compendium (Naveen and Lynch, 2015) }
#'   \item{ccamlr_id}{Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) subarea site is adjacent to}
#'   \item{geometry}{POINT geometry of site location (EPSG:4326)}
#' }
#' @source \url{http://www.penguinmap.com/}
#' @source \url{https://oceanites.org/research-portal/antarctic-site-inventory/asi-census-sites/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, https://doi.org/10.1017/S0032247417000055
#'
#' Naveen, R. and Lynch H. J. (2015). "Antarctic Peninsula Compendium" 3rd Edition, Chevy Chase, Maryland, USA.
"sites_sf"
