data_files <- list.files("mapppd_db/library/mapppdr/")
for (i in 1:length(data_files)) {
  system(paste0("ln -f mapppd_db/library/mapppdr/", data_files[i], " data/", data_files[i]))
}