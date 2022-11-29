#' Citation information for books chapters or conference papers referenced in MAPPPD
#'
#' A dataset containing citation information specific to book chapters or
#' conference papers whose data are included in MAPPPD.
#'
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{collection_id}{unique identifier for each book or conference proceeding (in collections data frame)
#'   containing book chapter or conference paper}
#'   \item{title}{book chapter or conference paper title}
#'   \item{start_page}{starting page of book chapter or conference paper}
#'   \item{end_page}{ending page of book chapter or conference paper}
#'   \item{url}{url link to book chapter or conference paper, if available}
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166,  \url{https://doi.org/10.1017/S0032247417000055}
#'
"incollections"
