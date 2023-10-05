#' Citation information for technical reports referenced in Athe PBP database
#'
#' A dataset containing citation information specific to technical reports
#' whose data are included in the APBP database.
#'
#' @format A data frame with `r dim(reports)[1]` rows and 8 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{title}{report title (may be title for specific chapter in a report)}
#'   \item{institution}{institution that publishes report}
#'   \item{type}{report type or name of third party who prepared the report for the institution, if either is applicable}
#'   \item{number}{unique report identifier as designated by the institution}
#'   \item{city}{publisher city}
#'   \item{country}{publisher country}
#'   \item{url}{url link to report, if available}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"reports"
