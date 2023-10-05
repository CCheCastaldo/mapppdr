#' Citation information for journal articles referenced in the APBP database
#'
#' A dataset containing citation information specific to journal articles
#' whose data are included in the APBP database.
#'
#' @format A data frame with `r dim(articles)[1]` rows and 10 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{title}{article title}
#'   \item{journal}{journal name}
#'   \item{volume}{journal volume}
#'   \item{number}{journal number, if available}
#'   \item{start_page}{starting page of article}
#'   \item{end_page}{ending page of article}
#'   \item{doi}{article doi, if available}
#'   \item{url}{url link to article, if available}
#'   \item{early_access}{boolean indicator that is TRUE if the article is currently early access and FALSE otherwise}
#'
#' }
#' @source \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
#' @section References:
#' Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. _Biodiversity Data Journal_ 11: e101476, \url{https://doi.org/10.3897/BDJ.11.e101476}
#'
"articles"