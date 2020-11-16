#' The 'mapppdr' package
#'
#' `mapppdr` is an R package used to access and visualize data from the Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD) database.
#'
#' @section Details:
#' The package contains 12 data frames, 1 `BibEntry` object, and 1 function:
#'
#' `penguin_obs` - data frame containing all publicly available *Pygoscelis* and Emperor penguin counts and presence-absence data included in MAPPPD at breeding sites south of 60 degrees S latitude
#'
#' `citations` - data frame containing bibliographic identifiers for all citations referenced in MAPPPD
#'
#' `sites` - data frame containing the name and location of all known *Pygoscelis* and Emperor penguin breeding sites south of 60 degrees S latitude and all Antarctic Site Inventory (ASI) penguin/seabird census sites included in MAPPPD
#'
#' `sites_sf` - `sites` data frame with locations stored as simple features POINT geometries
#'
#' `species` - data frame containing the names of all penguin species included in MAPPPD
#'
#' `site_species` - data frame linking *Pygoscelis* and Emperor penguin species to their breeding sites in MAPPPD
#'
#' `articles` - data frame containing citation information specific to journal articles whose data are included in MAPPPD
#'
#' `collections` - data frame containing citation information specific to books or conference proceedings containing data included in MAPPPD
#'
#' `incollections` - data frame containing citation information specific to book chapters or conference papers whose data are included in MAPPPD
#'
#' `unpublished` - data frame containing citation information specific to unpublished data included in MAPPPD
#'
#' `persons` - data frame containing bibliographic identifiers for all people who contributed data to MAPPPD
#'
#' `citation_persons` - data frame linking contributors to their citations in MAPPPD
#'
#' `mapppd_bib` - `BibEntry` object containing bibliographic information for all citations in MAPPPD
#'
#' `penmap` - function that creates a leaflet map of all known *Pygoscelis* and Emperor penguin breeding sites south of 60 degrees S latitude included in MAPPPD)
#'
#' The Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD) is a web-based, open access, decision-support tool designed to assist scientists, non-governmental organizations and policy-makers working to meet the management objectives as set forth by the Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) and other components of the Antarctic Treaty System (ATS). The MAPPPD database, described in Humphries et al. (2017), includes all publicly available published and unpublished count data on emperor, gentoo, Adélie and chinstrap penguins in Antarctica. A front end web interface located at [www.penguinmap.com](http://www.penguinmap.com) provides free and ready access to count data alongside population models that infer abundance in missing data and allow for straightforward aggregation across multiple populations (see Che-Castaldo et al. 2017). The `mapppdr` package will always be updated before changes are reflected on the web interface at [www.penguinmap.com](http://www.penguinmap.com) and should be considered the most up-to-date database available on the distribution and abundance of Antarctic penguins.
#'
#' The vignette can be run using \code{vignette('mapppdr')} if vignette is built when installing package.
#'
#' @section Author(s):
#' Christian Che-Castaldo <christian.che-castaldo@stonybrook.edu>, Heather J. Lynch <heather.lynch@stonybrook.edu>
#'
#' @section References:
#' Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166,  \url{https://doi.org/10.1017/S0032247417000055}
#'
#' @docType package
#' @name mapppdr

NULL
