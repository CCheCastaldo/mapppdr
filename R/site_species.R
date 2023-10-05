#' Name and species breeding at APBP database penguin breeding sites
#'
#' A dataset containing the name of all known _Pygoscelis_ and emperor, king, and macaroni penguin breeding sites south of
#' 60 degrees S latitude contained within the APBP database and which of these species breed there.
#'
#' @format A data frame with `r dim(site_species)[1]` rows and 2 variables:
#' \describe{
#'   \item{site_id}{unique identifier for each site}
#'   \item{species_id}{unique identifier for each species}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"site_species"
