#' Citation information for books chapters or conference papers referenced in the APBP database
#'
#' A dataset containing citation information specific to book chapters or
#' conference papers whose data are included in the APBP database.
#'
#' @format A data frame with `r dim(incollections)[1]` rows and 6 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{collection_id}{unique identifier for each book or conference proceeding (in collections data frame)
#'   containing book chapter or conference paper}
#'   \item{title}{book chapter or conference paper title}
#'   \item{start_page}{starting page of book chapter or conference paper}
#'   \item{end_page}{ending page of book chapter or conference paper}
#'   \item{url}{url link to book chapter or conference paper, if available}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"incollections"
