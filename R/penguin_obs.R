#' Count and presence/absence observations included in MAPPPD
#'
#' A dataset containing the all publicly available Pygoscelis and Emperor penguin
#' counts and presence-absence data at breeding sites south of 60 degrees S latitude.
#'
#' @format A data frame with 4052 rows and 14 variables:
#' \describe{
#'   \item{site_id}{unique identifier for each site}
#'   \item{species_id}{unique identifier for each species}
#'   \item{citekey}{unique identifier for each citation}
#'   \item{month}{month of observation, if available}
#'   \item{day}{day of observation, if available}
#'   \item{doy}{day of year of observation, if available}
#'   \item{date}{date of observation, if month and day are also known}
#'   \item{year}{year of observation}
#'   \item{season}{season of observation}
#'   \item{type}{type of observation, either adults, nests, or chicks}
#'   \item{presence}{equals if species type (adults, nests, or chicks) observed at the site and 0 otherwise}
#'   \item{count}{count of species type (adults, nests, or chicks) observed at the site, can be NA if record is presence/absence record only}
#'   \item{accuracy}{accuracy scores were assigned on a 5 point scale (usually by the observer) that penguin census counters traditionally use to represent
#'   count precision (see Croxall and Kirkwood, 1979)}
#'   \item{vantage}{vantage point of observation, can be aerial, aerial photo, ground, ground photo, landsat satellite, offshore vessel, sentinel satellite, uav, or vhr}
#' }
#' @source \url{http://www.penguinmap.com/}
#'
#' @section References:
#' Croxall, J. P. and E. D. Kirkwood. (1979). The distribution of penguins on the Antarctic Peninsula and islands of the Scotia Sea. British Antarctic Survey, Cambridge, United Kingdom
#'
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, https://doi.org/10.1017/S0032247417000055
#'
"penguin_obs"
