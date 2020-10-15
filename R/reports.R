#' Citation information for technical reports referenced in MAPPPD
#'
#' A dataset containing citation information specific to technical reports
#' whose data are included in MAPPPD.
#'
#' @format A data frame with 40 rows and 8 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{title}{report title (may be title for specific chapter in a report)}
#'   \item{institution}{institution which publishes report}
#'   \item{type}{report type or name of third paper who prepared the report for the institution, if either is applicable}
#'   \item{number}{unqiue report identifier as designated by the institution}
#'   \item{city}{publisher city}
#'   \item{country}{publisher country}
#'   \item{url}{url link to report, if available}
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, https://doi.org/10.1017/S0032247417000055
#'
"reports"
