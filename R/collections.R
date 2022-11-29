#' Citation information for books or conference proceedings referenced in MAPPPD
#'
#' A dataset containing citation information specific to books or conference proceedings
#' containing data included in MAPPPD.
#'
#' @format A data frame with 12 rows and 11 variables:
#' \describe{
#'   \item{collection_id}{unique identifier for each book or conference proceeding}
#'   \item{citekey}{unique identifier for each citation}
#'   \item{bibtype}{citation type, can be book or conference proceeding}
#'   \item{title}{book or conference proceeding title}
#'   \item{series}{book series, if applicable}
#'   \item{volume}{series volume, if applicable}
#'   \item{publisher}{book or conference proceeding publisher}
#'   \item{city}{publisher city}
#'   \item{country}{publisher country}
#'   \item{isbn_issn}{ISBN or ISSN number, if available}
#'   \item{url}{url link to book or conference proceeding, if available}
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, \url{https://doi.org/10.1017/S0032247417000055}
#'
"collections"
