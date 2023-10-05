#' APBP database citation bibliographic identifiers
#'
#' A dataset containing bibliographic identifiers for all citations
#' referenced in the APBP database.
#'
#' @format A data frame with `r dim(citations)[1]` rows and 3 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{bibtype}{citation type, can be article (for journal articles), book, book chapter, conference paper, personal communication, report (for unpublished technical reports), or unpublished (for unpublished datasets, monographs, reports, supplements, theses, etc.). }
#'   \item{year}{citation year}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"citations"
