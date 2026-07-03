# hard-links each .rda in the mapppd_db submodule into data/, since mapppd_db
# is excluded from the built package and data/ is what actually ships.
# run this whenever the mapppd_db submodule pointer has been updated to a new
# commit and you want the package data to reflect that (e.g. before a release).
data_files <- list.files("mapppd_db/library/mapppdr/")
for (i in 1:length(data_files)) {
  system(paste0("ln -f mapppd_db/library/mapppdr/", data_files[i], " data/", data_files[i]))
}

# record the MAPPPD_source commit the synced data came from (not the mapppd_db
# commit itself, since mapppd_db just relabels/repackages MAPPPD_source data
# without changing it, and unlike mapppd_db, MAPPPD_source is public). This is
# pulled from the most recent mapppd_db commit message matching the pattern
# written by the MAPPPD_source sync process, e.g. "... through mapppd_source
# commit 4041d36".
sync_commit_msg <- system(
  "git -C mapppd_db log -1 --grep='mapppd_source commit' --pretty=%s",
  intern = TRUE)
data_commit <- sub(".*mapppd_source commit ([0-9a-f]+).*", "\\1", sync_commit_msg)
desc::desc_set("Config/mapppdr/data_commit", data_commit)