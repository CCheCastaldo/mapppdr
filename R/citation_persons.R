#' Linking contributors to their citations referenced in MAPPPD
#'
#' A dataset linking contributors to their citations in MAPPPD.
#'
#' @format A data frame with 505 rows and 4 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{person_id}{unique identifier for each person}
#'   \item{role}{identifies whether person was an author or editor}
#'   \item{cite_order}{counter that identifies the author's (editor's) position in the author (editor) list}
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, \url{https://doi.org/10.1017/S0032247417000055}
#'
"citation_persons"
