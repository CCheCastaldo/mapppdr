#' Linking contributors to their citations referenced in the APBP database
#'
#' A dataset linking contributors to their citations in the APBP database.
#'
#' @format A data frame with ``r dim(citation_persons)[1]`` rows and 4 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{person_id}{unique identifier for each person}
#'   \item{role}{identifies whether person was an author or editor}
#'   \item{cite_order}{counter that identifies the author's (editor's) position in the author (editor) list}
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"citation_persons"
