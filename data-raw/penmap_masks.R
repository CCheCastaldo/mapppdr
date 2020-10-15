library(magrittr)

asd_mask <- sf::st_as_sf(CCAMLRGIS::load_ASDs()) %>%
  dplyr::select(ccamlr_id = GAR_Name) %>%
  sf::st_transform(4326)

mpa_mask <- sf::st_as_sf(CCAMLRGIS::load_MPAs()) %>%
  dplyr::select(mpa_id = GAR_Name) %>%
  sf::st_transform(4326)

land_mask <- sf::st_as_sf(CCAMLRGIS::load_Coastline()) %>%
  dplyr::select(layer) %>%
  dplyr::filter(layer == "coastline") %>%
  sf::st_transform(4326)

usethis::use_data(land_mask, asd_mask, mpa_mask, internal = TRUE, overwrite = TRUE)
