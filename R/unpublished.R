#' Citation information for persons referenced in the APBP database
#'
#' A dataset containing citation information specific to unpublished data included in the APBP database.
#'
#' @format A data frame with `r dim(unpublished)[1]` rows and 4 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{title}{description of data source}
#'   \item{type}{type of unpublished data. These include things such as datasets, monographs, reports, supplements, thesis, etc.}
#'   \item{note}{dadditional information, such as date downloaded, if available}
#'   \item{doi}{dataset doi, if available}
#'   \item{url}{url link to data source, if available}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"unpublished"
