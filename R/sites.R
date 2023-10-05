#' Name and location of APBP database seabird breeding sites
#'
#' A dataset containing the name and location of all known _Pygoscelis_, emperor,
#' king and macaroni penguin breeding sites south of 60 degrees S latitude
#' contained within the APBP database.
#'
#' @format A data frame with `r dim(sites)[1]` rows and 6 variables:
#' \describe{
#'   \item{site_id}{unique identifier for each site}
#'   \item{site_name}{site name and/or description}
#'   \item{region}{site region as reported in the 2015 ASI Antarctic Peninsula Compendium (Naveen and Lynch, 2015) }
#'   \item{ccamlr_id}{Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) subarea within which the site lies}
#'   \item{latitude}{site latitude (EPSG:4326), decimal degrees}
#'   \item{longitude}{site longitude (EPSG:4326), decimal degrees}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' Naveen, R. and H.J. Lynch. (2015). "Antarctic Peninsula Compendium" 3rd Edition, Chevy Chase, Maryland, USA.
#'
"sites"
