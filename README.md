mapppdr
====

`mapppdr` is an R package used to manipulate and visualize Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD) data.

The package contains 10 data frames and 1 function:

- `penguin_ons` - 
- `citations` - 
- `sites` - 
- `species` - 
- `penmap` - 

Installation
------------

You can install the latest released version from Github with:
```{r}
install.packages('devtools')
devtools::install_github('cchecastaldo/mapppdr', build_vignettes = TRUE)
```

Vignette
--------

### Background

The Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD) is a web-based, open access, decision-support tool designed to assist scientists, non-governmental organizations and policy-makers working to meet the management objectives as set forth by the Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) and other components of the Antarctic Treaty System (ATS) (Humphries et al. , 2017). The database underlying MAPPPD includes all publicly available (published and unpublished) count data on emperor, gentoo, Adélie and chinstrap penguins in Antarctica. A front end web interface located at [www.penguinmap.com](http://www.penguinmap.com/) provides free and ready access to the most recent count data. The `mapppdr` package provides the MAPPPD database tables as data frames and simple features objects, where appropriate.

<br>

### R packages

Interacting with `mapppdr` is easily done using the following R packages / collections of packages. The first three (`tidyverse`, `RefManageR`, and `sf`) are for manipulating the MAPPPD data, while `htmlwidgets` is useful for exporting penguin map leaflets (described below).

```{r, eval = FALSE}
library(tidyverse)
library(RefManageR)
library(sf)
library(htmlwidgets)
```

<br>

### Penguin Count Data

All counts and presence/absence data can be found in the `penguin_obs` data frame. The `site_id` field references site information from the `sites` or `sites_sf` data frames (the latter being just a simple features version of the former). The `species_id` field references species information from the `species` data frame. The `citekey` field references bibliographic data that can be found in the `citations` data frame and several different additional bibliographic data frames (depending on the type of citation). The `citekey` also references the cite key in the `mapppd_bib` BibEntry object.

```{r }
data(penguin_obs)
head(penguin_obs)
```

It is easy to subset the data in various ways using the tidyverse. For example, the following code returns all the chinstrap nest counts in CCAMLR Sub area 48.2 from 1990 - 2000:

```{r }
chinstrap_counts <- penguin_obs %>%
  dplyr::filter(type == "nests" & year %in% c(2000:2010) & species_id == "CHPE") %>%
  left_join(sites, by = "site_id") %>%
  dplyr::filter(ccamlr_id == "48.2")
head(chinstrap_counts)
```

You can also use spatial information to subset count data. This is quite easy using the `sf` [package tools](https://github.com/rstudio/cheatsheets/blob/master/sf.pdf). For instance, the following code selects counts from the 22 sites within 100 km of ACUN (including ACUN itself):

```{r }
ACUN_area_counts <- sites_sf %>%
  mutate(ACUN_distance = as.numeric(sf::st_distance(sites_sf, sites_sf %>% dplyr::filter(site_id == "ACUN")))) %>%
  dplyr::filter(ACUN_distance <= 10000) %>%
  dplyr::select(site_id) %>%
  inner_join(penguin_obs, by = "site_id")
st_geometry(ACUN_area_counts) <- NULL
head(ACUN_area_counts)
```

<br>

### Bibliographic Data

A core MAPPPD project goal is to reliably report the observation metadata, and in this regard we work very hard to make sure all data in MAPPPD is properly cited and this bibliographic information is easily available to end-users. One challenge with the MAPPPD bibliography is that fact that many of citations contain special characters (accents, umlauts, etc.). <u>People who contribute data to MAPPPD deserve to have their names spelled correctly.</u> To accomplish this we allow the bibliographic data to retain accents through UTF-8 special. Bibliographic data in `mapppdr` is stored in a set of data frames that allow for easy subsetting of the actual observation data using the `citekey` field. For instance. the following code returns all journal articles containing penguin counts authored by Néstor R. Coria, before subsetting `penguin_obs` for the counts themselves.

```{r }
coria_citations <- persons %>%
  dplyr::filter(family == "Coria" & given == "Néstor R.") %>%
  inner_join(citation_persons, by = "person_id") %>%
  dplyr::select(citekey) %>%
  inner_join(articles, by = "citekey") %>%
  mutate(title_short = substr(title, 1, 80)) %>%
  dplyr::select(citekey, journal, doi, title_short)
head(coria_citations)

coria_counts <- penguin_obs %>%
  inner_join(coria_citations %>% dplyr::select(citekey), by = "citekey")
head(coria_counts)
```

We could also easily print the full bibliographic information for these particular counts, as well as export them as a `.bibTeX` file. This file could be used in LaTeX, Overleaf, or imported into other reference management software, such as Zotero.

```{r chunk1, results = 'hide'}
out <- mapppd_bib[mapppd_bib$key %in% coria_citations$citekey]
RefManageR::WriteBib(out, file = "~/Desktop/Coria_citations.bib")
print(out, .opts = list(bib.style = "authoryear", style = "markdown"))
```

```{r ref.label = 'chunk1', results = 'asis', echo = F}

```

<br>

### Penguin Map Leaflet

The function `penmap` allows for quick visualizations of the emperor, gentoo, Adélie and chinstrap penguins breeding sites in Antarctica using leaflet. The function takes a single argument, `species_map`, which is just the list of species (using their species_id codes) whose sites you wish to display on the map. These species are listed as a character vector, whose default is all four species. Colonies are clustered but as you zoom in (either by direct zooming or by clicking on colony clusters), individual sites appear as blue circles. Clicking on circles will reveal the site code, name, and what penguin species are breeding there. You can click on the globe button in the top left (directly below the zoom buttons) to zoom back and and recenter the map. Sometimes, sites are so close to another that resolving a cluster will set the zoom to maximum, potentially obscuring other colonies nearby. To prevent this you can lock and unlock the clusters by clicking on the button below the globe button. Locking clusters will cause sites to fan out in a circle around the cluster but at the current zoom level when clicked. You can disable this behavior by clicking on this button again. The map provides several helpful layers. These include the CCAMLR Statistical Areas and Divisions and Marine Protected Areas, the Antarctic Coastline (all exported from the `CCCAMLRGIS` R package) and the Landsat Image Mosaic Of Antarctica (LIMA) (Bindschadler et al. 2008) WMS tiles hosted by the [Polar Geospatial Center](https://www.pgc.umn.edu).

The following code will create an Adélie only leaflet, which you can then open in a browser by clicking on the Show in New Window Viewer button (located to the right of the broomstick icon).

```{r, eval = FALSE}
penmap("ADPE")
```

```{r, out.width = "100%"}
knitr::include_graphics("/vignettes/leaflet.png")
```

You can also export and share leaflets quite easily. For instance, the following code will save the Adélie only leaflet to your Desktop. You can then share this `html` file, which can be opened directly in a web browser.

```{r, eval = FALSE}
htmlwidgets::saveWidget(penmap("ADPE"), file = "~/Desktop/ADPE_map.html")
```

<br>

### Citations

Bindschadler, R., P. Vornberger, A. Fleming, A. Fox, J. Mullins, D. Binnie, S. J. Paulsen, B. Granneman, and . Gorodetzky. (2008). "The Landsat image mosaic of Antarctica". _Remote Sensing of Environment_ 112(12): 4214-4226, https://doi.org/10.1016/j.rse.2008.07.006.

Humphries, G. R. W., R. Naveen, M. Schwaller, C. Che-Castaldo, P. McDowall, M. Schrimpf and H. J. Lynch. (2017). "Mapping Application for Penguin Populations and Projected Dynamics (MAPPPD): Data and tools for dynamic management and decision support". _Polar Record_ 53(2): 160-166, https://doi.org/10.1017/S0032247417000055

McLean, M. W. (2017). “RefManageR: Import and Manage BibTeX and BibLaTeX References in R.” _The Journal of Open Source Software_,     https://doi.org/10.21105/joss.00338

Pebesma, E. (2018). Simple Features for R: Standardized Support for Spatial Vector Data. _The R Journal_ 10(1): 439-446, https://doi.org/10.32614/RJ-2018-009

Vaidyanathan, R., Y. Xie, J. J. Allaire, J. Cheng and K. Russell (2019). htmlwidgets: HTML Widgets for R. R package version 1.5.1. https://CRAN.R-project.org/package=htmlwidgets

Thanassekos, S., K. Reid and L. Robinson (2020). CCAMLRGIS: Antarctic Spatial Data Manipulation. R package version 3.0.6. https://CRAN.R-project.org/package=CCAMLRGIS

Wickham et al., (2019). Welcome to the tidyverse. _Journal of Open Source Software_ 4(43): 1686, https://doi.org/10.21105/joss.01686

