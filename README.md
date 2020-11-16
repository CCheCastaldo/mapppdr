mapppdr
================

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/CCheCastaldo/mapppdr.svg?token=WLMqxGUJEqdpYmau7YqP&branch=main)](https://travis-ci.com/CCheCastaldo/mapppdr)
<!-- badges: end -->

### MAPPPD in R

<a href="http://www.penguinmap.com"><img align="right" src="vignettes/mapppd_logo.svg" width="240" style="border:solid #FFFFFF;"/></a>

The Mapping Application for Penguin Populations and Projected Dynamics
(MAPPPD) is a web-based, open access, decision-support tool designed to
assist scientists, non-governmental organizations and policy-makers
working to meet the management objectives as set forth by the Commission
for the Conservation of Antarctic Marine Living Resources (CCAMLR) and
other components of the Antarctic Treaty System (ATS). The MAPPPD
database, described in Humphries et al. (2017), includes all publicly
available published and unpublished count data on emperor, gentoo,
Adélie and chinstrap penguins in Antarctica. A front end web interface
located at [www.penguinmap.com](http://www.penguinmap.com) provides free
and ready access to count data alongside population models that infer
abundance in missing data and allow for straightforward aggregation
across multiple populations (see Che-Castaldo et al. 2017). The
`mapppdr` package makes the MAPPPD database tables available as data
frames (one with simple features), the MAPPPD BibTeX citation data, and
the function `penmap` for visualizing breeding colony locations using
`leaflet`. The `mapppdr` package will always be updated before changes
are reflected on the web interface at
[www.penguinmap.com](http://www.penguinmap.com) and should be considered
the most up-to-date database available on the distribution and abundance
of Antarctic penguins.

The package contains 12 data frames, 1 `BibEntry` object, and 1
function:

-   `penguin_obs` - data frame containing all publicly available
    *Pygoscelis* and Emperor penguin counts and presence-absence data
    included in MAPPPD at breeding sites south of 60 degrees S latitude
-   `citations` - data frame containing bibliographic identifiers for
    all citations referenced in MAPPPD
-   `sites` - data frame containing the name and location of all known
    *Pygoscelis* and Emperor penguin breeding sites south of 60 degrees
    S latitude and all Antarctic Site Inventory (ASI) penguin/seabird
    census sites included in MAPPPD
-   `sites_sf` - `sites` data frame with locations stored as simple
    features POINT geometries
-   `species` - data frame containing the names of all penguin species
    included in MAPPPD
-   `site_species` - data frame linking *Pygoscelis* and Emperor penguin
    species to their breeding sites in MAPPPD
-   `articles` - data frame containing citation information specific to
    journal articles whose data are included in MAPPPD
-   `collections` - data frame containing citation information specific
    to books or conference proceedings containing data included in
    MAPPPD
-   `incollections` - data frame containing citation information
    specific to book chapters or conference papers whose data are
    included in MAPPPD
-   `unpublished` - data frame containing citation information specific
    to unpublished data included in MAPPPD
-   `persons` - data frame containing bibliographic identifiers for all
    people who contributed data to MAPPPD
-   `citation_persons` - data frame linking contributors to their
    citations in MAPPPD
-   `mapppd_bib` - `BibEntry` object containing bibliographic
    information for all citations in MAPPPD
-   `penmap` - function that creates a leaflet map of all known
    *Pygoscelis* and Emperor penguin breeding sites south of 60 degrees
    S latitude included in MAPPPD

## Installation

You can install the latest version (0.1.1.3) from Github with:

    install.packages('devtools')
    devtools::install_github('CCheCastaldo/mapppdr', build_vignettes = TRUE)

### Vignette

Interacting with `mapppdr` is easily done using the following R packages
/ collections of packages. The first three (`tidyverse`, `RefManageR`,
and `sf`) are for manipulating the MAPPPD data, while `htmlwidgets` is
useful for exporting penguin map leaflets (described below).

    library(tidyverse)
    library(RefManageR)
    library(sf)
    library(htmlwidgets)

#### Penguin Count Data

All counts and presence/absence data can be found in the `penguin_obs`
data frame. The `site_id` field references site information from the
`sites` or `sites_sf` data frames (the latter being just a simple
features version of the former). The `species_id` field references
species information from the `species` data frame. The `citekey` field
references bibliographic data that can be found in the `citations` data
frame and several different additional bibliographic data frames
(depending on the type of citation). The `citekey` also references the
cite key in the `mapppd_bib` BibEntry object.

    data(penguin_obs)
    head(penguin_obs)

    ##   site_id species_id           citekey month day doy       date year season
    ## 1    ACUN       ADPE   coria2011laurie    NA  NA  NA       <NA> 1993   1993
    ## 2    ACUN       ADPE woehler1997status    NA  NA  NA       <NA> 1994   1994
    ## 3    ACUN       ADPE   coria2011laurie    NA  NA  NA       <NA> 2004   2004
    ## 4    ACUN       ADPE   lynch2014global     2  25  56 2011-02-25 2011   2010
    ## 5    ACUN       CHPE  poncet1985survey    12  28 362 1983-12-28 1983   1983
    ## 6    ACUN       CHPE   coria2011laurie    NA  NA  NA       <NA> 2004   2004
    ##    type presence count accuracy vantage
    ## 1 nests        1  2008        1  ground
    ## 2 nests        1  1920        1    <NA>
    ## 3 nests        1  1880        1  ground
    ## 4 nests        1  3079        5     vhr
    ## 5 nests        1  4000        4  ground
    ## 6 nests        1  7716        1  ground

It is easy to subset the data in various ways using the tidyverse. For
example, the following code returns all the chinstrap nest counts in
CCAMLR Sub area 48.2 from 1990 - 2000:

    chinstrap_counts <- penguin_obs %>%
      dplyr::filter(type == "nests" & year %in% c(2000:2010) & species_id == "CHPE") %>%
      left_join(sites, by = "site_id") %>%
      dplyr::filter(ccamlr_id == "48.2")
    head(chinstrap_counts)

    ##   site_id species_id         citekey month day doy date year season  type
    ## 1    ACUN       CHPE coria2011laurie    NA  NA  NA <NA> 2004   2004 nests
    ## 2    FERG       CHPE coria2011laurie    NA  NA  NA <NA> 2004   2004 nests
    ## 3    GEDD       CHPE coria2011laurie    NA  NA  NA <NA> 2004   2004 nests
    ## 4    LOLA       CHPE coria2011laurie    NA  NA  NA <NA> 2004   2004 nests
    ## 5    MILL       CHPE coria2011laurie    NA  NA  NA <NA> 2004   2004 nests
    ## 6    PAND       CHPE  morenopersonal    NA  NA  NA <NA> 2009   2009 nests
    ##   presence count accuracy vantage           site_name               region
    ## 1        1  7716        1  ground        Acuna Island South Orkney Islands
    ## 2        1  7268        2  ground Ferguslie Peninsula South Orkney Islands
    ## 3        1  7116        2  ground         Cape Geddes South Orkney Islands
    ## 4        1   855        1  ground          Lola Point South Orkney Islands
    ## 5        1   886        1  ground           Mill Cove South Orkney Islands
    ## 6        1  2385        1  ground   Pandemonium Point South Orkney Islands
    ##   ccamlr_id  latitude longitude
    ## 1      48.2 -60.76120 -44.63700
    ## 2      48.2 -60.69300 -44.56700
    ## 3      48.2 -60.68500 -44.59000
    ## 4      48.2 -60.72385 -44.74222
    ## 5      48.2 -60.75300 -44.61400
    ## 6      48.2 -60.73600 -45.64800

You can also use spatial information to subset count data. This is quite
easy using the `sf` [package
tools](https://github.com/rstudio/cheatsheets/blob/master/sf.pdf). For
instance, the following code selects counts from the 22 sites whose
great circle distances are within 10 km of ACUN (including ACUN itself):

    ACUN_area_counts <- sites_sf %>%
      mutate(ACUN_distance = as.numeric(sf::st_distance(sites_sf, sites_sf %>% 
        dplyr::filter(site_id == "ACUN")))) %>%
      dplyr::filter(ACUN_distance <= 10000) %>%
      dplyr::select(site_id) %>%
      inner_join(penguin_obs, by = "site_id")
    st_geometry(ACUN_area_counts) <- NULL
    glimpse(ACUN_area_counts)

    ## Rows: 55
    ## Columns: 14
    ## $ site_id    <chr> "ACUN", "ACUN", "ACUN", "ACUN", "ACUN", "ACUN", "AILS", "A…
    ## $ species_id <chr> "ADPE", "ADPE", "ADPE", "ADPE", "CHPE", "CHPE", "CHPE", "C…
    ## $ citekey    <chr> "coria2011laurie", "woehler1997status", "coria2011laurie",…
    ## $ month      <int> NA, NA, NA, 2, 12, NA, 12, 2, 12, 1, 12, 1, 12, NA, NA, NA…
    ## $ day        <int> NA, NA, NA, 25, 28, NA, 28, 10, 28, 22, 28, 22, 28, NA, NA…
    ## $ doy        <int> NA, NA, NA, 56, 362, NA, 362, 41, 362, 22, 362, 22, 362, N…
    ## $ date       <date> NA, NA, NA, 2011-02-25, 1983-12-28, NA, 1983-12-28, 2020-…
    ## $ year       <int> 1993, 1994, 2004, 2011, 1983, 2004, 1983, 2020, 1983, 2019…
    ## $ season     <int> 1993, 1994, 2004, 2010, 1983, 2004, 1983, 2019, 1983, 2018…
    ## $ type       <chr> "nests", "nests", "nests", "nests", "nests", "nests", "nes…
    ## $ presence   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1…
    ## $ count      <int> 2008, 1920, 1880, 3079, 4000, 7716, 6000, 3000, 3300, 3000…
    ## $ accuracy   <int> 1, 1, 1, 5, 4, 1, 4, 5, 4, 5, 3, 5, 4, 2, 5, 1, 1, 4, 1, 4…
    ## $ vantage    <chr> "ground", NA, "ground", "vhr", "ground", "ground", "ground…

#### Bibliographic Data

A core MAPPPD project goal is to reliably report the observation
metadata, and in this regard we work very hard to make sure all data in
MAPPPD is properly cited and this bibliographic information is easily
available to end-users. One challenge with the MAPPPD bibliography is
that fact that many of citations contain special characters (accents,
umlauts, etc.). <u>People who contribute data to MAPPPD deserve to have
their names spelled correctly.</u> To accomplish this we allow the
bibliographic data to retain accents through UTF-8 special.
Bibliographic data in `mapppdr` is stored in a set of data frames that
allow for easy subsetting of the actual observation data using the
`citekey` field. For instance. the following code returns all journal
articles containing penguin counts where Néstor R. Coria is an author,
before subsetting `penguin_obs` for the counts themselves.

    coria_citations <- persons %>%
      dplyr::filter(family == "Coria" & given == "Néstor R.") %>%
      inner_join(citation_persons, by = "person_id") %>%
      dplyr::select(citekey) %>%
      inner_join(articles, by = "citekey") %>%
      dplyr::select(citekey, journal, doi, title)
    glimpse(coria_citations)

    ## Rows: 11
    ## Columns: 4
    ## $ citekey <chr> "carlini2005effect", "carlini2009responses", "coria1995adelie…
    ## $ journal <chr> "Folia Zoologica", "Polar Biology", "Polar Biology", "Marine …
    ## $ doi     <chr> NA, "10.1007/s00300-009-0637-y", "10.1007/BF00239717", NA, NA…
    ## $ title   <chr> "The effect of Chinstrap penguins on the breeding performance…

    coria_counts <- penguin_obs %>%
      inner_join(coria_citations %>% dplyr::select(citekey), by = "citekey") 
    head(coria_counts)

    ##   site_id species_id                        citekey month day doy       date
    ## 1    ACUN       ADPE                coria2011laurie    NA  NA  NA       <NA>
    ## 2    ACUN       ADPE                coria2011laurie    NA  NA  NA       <NA>
    ## 3    ACUN       CHPE                coria2011laurie    NA  NA  NA       <NA>
    ## 4    ALCO       CHPE               favero2000status     1   5   5 1998-01-05
    ## 5    ALCO       CHPE gonzalez-zevallos2013abundance     2   9  40 2011-02-09
    ## 6    CHPT       CHPE               favero2000status     1   5   5 1998-01-05
    ##   year season  type presence count accuracy vantage
    ## 1 1993   1993 nests        1  2008        1  ground
    ## 2 2004   2004 nests        1  1880        1  ground
    ## 3 2004   2004 nests        1  7716        1  ground
    ## 4 1998   1997 nests        1   605        2  ground
    ## 5 2011   2010 nests        1  1100        1  ground
    ## 6 1998   1997 nests        1    13        2  ground

We could also easily print the full bibliographic information for these
particular counts, as well as export them as a `.bibTeX` file. This file
could be used in LaTeX, Overleaf, or imported into other reference
management software, such as Zotero.

    out <- mapppd_bib[mapppd_bib$key %in% coria_citations$citekey]
    RefManageR::WriteBib(out, file = "~/Desktop/Coria_citations.bib")

    ## Writing 11 Bibtex entries ... OK
    ## Results written to file '~/Desktop/Coria_citations.bib'

    print(out, .opts = list(bib.style = "authoryear", style = "markdown"))

    ## Writing 11 Bibtex entries ... OK
    ## Results written to file '~/Desktop/Coria_citations.bib'

Carlini, A. R, N. R. Coria, M. M. Santos, et al. (2005). “The effect of
Chinstrap penguins on the breeding performance of Adélie penguins”. In:
*Folia Zoologica* 54.1-2, pp. 147-148.

Carlini, A. R, N. R. Coria, M. M. Santos, et al. (2009). “Responses of
*Pygoscelis adeliae* and *P. papua* populations to environmental changes
at Isla 25 de Mayo (King George Island)”. In: *Polar Biology* 32.10,
pp. 1427-1433. DOI:
[10.1007/s00300-009-0637-y](https://doi.org/10.1007%2Fs00300-009-0637-y).

Coria, N. R, P. G. Blendinger, and D. Montalti (1996). “The breeding
birds of Cape Geddes, Laurie Island, South Orkney Islands, Antarctica”.
In: *Marine Ornithology* 24.1-2, pp. 43-44.

Coria, N. R, M. Favero, M. P. Silva, et al. (1995). “Breeding birds at
Duthoit Point, Nelson Island, South Shetland Islands, Antarctica”. In:
*Marine Ornithology* 23.1, pp. 61-64.

Coria, N. R, D. Montalti, E. F. Rombolá, et al. (2011). “Birds at Laurie
Island, South Orkney Islands, Antarctica: Breeding species and their
distribution”. In: *Marine Ornithology* 39.2, pp. 207-213.

Coria, N. R, H. Spairani, S. Vivequin, et al. (1995). “Diet of Adélie
penguins *Pygoscelis adeliae* during the post-hatching period at
Esperanza Bay, Antarctica, 1987/88”. In: *Polar Biology* 15.6, pp.
415-418. DOI:
[10.1007/BF00239717](https://doi.org/10.1007%2FBF00239717).

Esponda, C. G, N. R. Coria, and D. Montalti (2000). “Breeding birds at
Halfmoon Island, South Shetland Islands, Antarctica, 1995/96”. In:
*Marine Ornithology* 28.1, pp. 59-62.

Favero, M, N. R. Coria, and M. P. Beron (2000). “The status of breeding
birds at Cierva Point and surroundings, Danco Coast, Antarctic
Peninsula”. In: *Polish Polar Research* 21.3-4, pp. 181-187.

González-Zevallos, D, M. M. Santos, E. F. Rombolá, et al. (2013).
“Abundance and breeding distribution of seabirds in the northern part of
the Danco Coast, Antarctic Peninsula”. In: *Polar Research* 32.0,
pp. 1-7. DOI:
[10.3402/polar.v32i0.11133](https://doi.org/10.3402%2Fpolar.v32i0.11133).

Juáres, M. A, M. M. Santos, J. Negrete, et al. (2015). “Adélie penguin
population changes at Stranger Point: 19 years of monitoring”. In:
*Antarctic Science* 27.05, pp. 455-461. DOI:
[10.1017/S0954102015000152](https://doi.org/10.1017%2FS0954102015000152).

Santos, M. M, J. T. Hinke, N. R. Coria, et al. (2018). “Abundance
estimation of Adélie penguins at the Esperanza/Hope Bay mega colony”.
In: *Polar Biology* 41.11, pp. 2337-2342. DOI:
[10.1007/s00300-018-2373-7](https://doi.org/10.1007%2Fs00300-018-2373-7).

#### Penguin Map Leaflet

The function `penmap` allows for quick visualizations of the emperor,
gentoo, Adélie and chinstrap penguins breeding sites in Antarctica using
leaflet. The function takes a single argument, `species_map`, which is
just the list of species (using their species\_id codes) whose sites you
wish to display on the map. These species are listed as a character
vector, whose default is all four species. Colonies are clustered but as
you zoom in (either by direct zooming or by clicking on colony
clusters), individual sites appear as blue circles. Clicking on circles
will reveal the site code, name, and what penguin species are breeding
there. You can click on the globe button in the top left (directly below
the zoom buttons) to zoom back and and recenter the map. Sometimes,
sites are so close to another that resolving a cluster will set the zoom
to maximum, potentially obscuring other colonies nearby. To prevent this
you can lock and unlock the clusters by clicking on the button below the
globe button. Locking clusters will cause sites to fan out in a circle
around the cluster but at the current zoom level when clicked. You can
disable this behavior by clicking on this button again. The map provides
several helpful layers. These include the CCAMLR Statistical Areas and
Divisions and Marine Protected Areas, the Antarctic Coastline (all
exported from the `CCCAMLRGIS` R package) and the Landsat Image Mosaic
Of Antarctica (LIMA) (Bindschadler et al. 2008) WMS tiles hosted by the
[Polar Geospatial Center](https://www.pgc.umn.edu).

The following code will create an Adélie only leaflet, which you can
then open in a browser by clicking on the Show in New Window Viewer
button (located to the right of the broomstick icon).

    penmap("ADPE")

<p align="center">
<img src="vignettes/leaflet.png" width="50%" style="display: block; margin: auto;" />
</p>

<br>

You can also export and share leaflets quite easily. For instance, the
following code will save the Adélie only leaflet to your Desktop. You
can then share this `html` file, which can be opened directly in a web
browser.

    htmlwidgets::saveWidget(penmap("ADPE"), file = "~/Desktop/ADPE_map.html")

### Citations

Bindschadler, R., P. Vornberger, A. Fleming, A. Fox, J. Mullins, D.
Binnie, S. J. Paulsen, B. Granneman, and . Gorodetzky. (2008). “The
Landsat image mosaic of Antarctica”. *Remote Sensing of Environment*
112(12): 4214-4226,
<a href="https://doi.org/10.1016/j.rse.2008.07.006" class="uri">https://doi.org/10.1016/j.rse.2008.07.006</a>

Che-Castaldo, C., S. Jenouvrier, C. Youngflesh, K. Shoemaker, G.
Humphries, P. McDowall, L. Landrum, M. Holland, Y. Li, R. Ji, and H.J.
Lynch. (2017). “Pan-Antarctic analysis aggregating spatial estimates of
Adélie penguin abundance reveals robust dynamics despite stochastic
noise”. *Nature Communications* 8: 832,
<a href="https://doi.org/10.1038/s41467-017-00890-0" class="uri">https://doi.org/10.1038/s41467-017-00890-0</a>

Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P.
McDowall, M. Schrimpf and H. J. Lynch. (2017). “Mapping Application for
Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for
dynamic management and decision support”. *Polar Record* 53(2): 160-166,
<a href="https://doi.org/10.1017/S0032247417000055" class="uri">https://doi.org/10.1017/S0032247417000055</a>

McLean, M. W. (2017). “RefManageR: Import and Manage BibTeX and BibLaTeX
References in R.” *The Journal of Open Source Software*,
<a href="https://doi.org/10.21105/joss.00338" class="uri">https://doi.org/10.21105/joss.00338</a>

Pebesma, E. (2018). Simple Features for R: Standardized Support for
Spatial Vector Data. *The R Journal* 10(1): 439-446,
<a href="https://doi.org/10.32614/RJ-2018-009" class="uri">https://doi.org/10.32614/RJ-2018-009</a>

Thanassekos, S., K. Reid and L. Robinson (2020). CCAMLRGIS: Antarctic
Spatial Data Manipulation. R package version 3.0.6.
<a href="https://CRAN.R-project.org/package=CCAMLRGIS" class="uri">https://CRAN.R-project.org/package=CCAMLRGIS</a>

Vaidyanathan, R., Y. Xie, J. J. Allaire, J. Cheng and K. Russell (2019).
htmlwidgets: HTML Widgets for R. R package version 1.5.1.
<a href="https://CRAN.R-project.org/package=htmlwidgets" class="uri">https://CRAN.R-project.org/package=htmlwidgets</a>

Wickham et al., (2019). Welcome to the tidyverse. *Journal of Open
Source Software* 4(43): 1686,
<a href="https://doi.org/10.21105/joss.01686" class="uri">https://doi.org/10.21105/joss.01686</a>

<br>
