#' Citation information for journal articles referenced in MAPPPD
#'
#' A dataset containing citation information specific to journal articles
#' whose data are included in MAPPPD.
#'
#' @format A data frame with 104 rows and 10 variables:
#' \describe{
#'   \item{citekey}{unique identifier for each citation}
#'   \item{title}{article title}
#'   \item{journal}{journal name}
#'   \item{volume}{journal volume}
#'   \item{number}{journal number, if available}
#'   \item{start_page}{starting page of article}
#'   \item{end_page}{ending page of article}
#'   \item{doi}{article doi, if avilable}
#'   \item{url}{url link to article, if available}
#'   \item{early_access}{boolean indicator that is TRUE if the article is currently early access and FALSE otherwise}
#'
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, https://doi.org/10.1017/S0032247417000055
#'
"articles"
