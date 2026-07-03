# mapppdr 3.0

This is the first update to the APBP database since that initial release. Please also cite this paper when using data from MAPPPD (<https://www.penguinmap.com>).

The APBP database is distributed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/) (CC BY 4.0). 

The code portion of the `mapppdr` package is distributed under a [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0) (GPL-3).

**Please cite the paper below when using the `mapppdr` package:**

> Che-Castaldo, C., G.R.W. Humphries, and H.J. Lynch. (2023). Antarctic Penguin Biogeography Project: Database of abundance and distribution for the Adélie, chinstrap, gentoo, emperor, macaroni and king penguin south of 60 S. *Biodiversity Data Journal* 11: e101476, <https://doi.org/10.3897/BDJ.11.e101476>

## Database changes

The following summarizes all substantive database changes since the initial commit (v2.3).

### Schema changes

- Renamed the `early_access` field in the `articles` data frame to `preprint` (indicates whether a citation is a preprint rather than early-access; code depending on the old column name will need to be updated).

### New sites and site restructuring

- Divided ASTR into four new sites: ASTE, DIAZ, ASTW, ASTS.
- Added Bills Island (BILL) as a new gentoo penguin site, later with an initial count.
- Added a new chinstrap site, STIC (South of Tumba Ice Cap), near CHSE, based on a photo showing a small nesting population.
- Added Middle Island (MIDD) as a new site (data from Fudala et al. 2023).
- Assigned a new location for SKET.
- Renamed Point Thomas to "Point Thomas (Rakusa Point)" to reflect that nesting penguins are actually at the geological point known as Rakusa Point (code PTHO unchanged).
- Merged WOOD and EDMO: renamed WOOD to "Wood Bay (Edmonson Point)," reassigned EDMO records to WOOD, and removed EDMO as a separate site.
- Relabeled YALO GEPE records as TXRX GEPE, having determined the two were synonymous locations (YALO ADPE records unaffected).
- Renamed UIEL to TELI (Telish Rock) and updated associated counts to the new site code.
- Updated the location for Northern Foothills based on high-resolution satellite imagery.
- Deleted HUMM (Two Hummock Island East) as a site.
- Added Nelly Island, based on the ASPA 160 management plan.

### New data added

- UAV/drone-based counts collected and annotated by Michael Wethington across multiple sites and seasons, including TAUN, YANK, SKET, YALO, ORNE, PCHA, and JOUG.
- New 2022/23 and 2023/24 field season data, including NEKO, MOOT, and counts from the Herman & Flynn cruise (with a KETL chinstrap record from Strycker et al. removed as unreliable — see Corrections).
- Ground and UAV counts from C. Flynn's Quixote trips (2024–25).
- Multiple seasons of Antarctic Site Inventory (ASI) data, through the 2025–2026 season.
- New Ardley Island data (Soutullo et al. 2023).
- New data for CHAR and GREI from ATCM documents.
- New data for AVIA and GALE/VERN.
- A historical count at TUXE recovered from an archival photograph (~2007).
- A data point for EDMO (Olmastroni et al. 2022).
- Data from Lynnes et al. (2004).
- Adelie counts for Cape Royd, Bird, and Crozier (2019, 2021).
- Adelie counts from Parmalee (1987, revised).
- Data from Perchivale et al. (2023).
- Data from Juares et al. (2024) at Stranger Point — later removed (see Corrections).
- New LOCK data from the UK Heritage Trust, plus a previously missing GEPE count at LOCK.
- A new datapoint at BERT.
- Emperor penguin counts from Wienecke et al. (2024) and from Cape Washington.
- Data for all three species at Lion's Rump (revised Management Plan for ASPA 151).
- Gentoo and chinstrap data from Pizarro et al. (2025) for TTOE and HARM.
- FRPT data from Hinke et al. (raw UAV count, with phenologically-corrected estimate included in notes).
- New data from the New Zealand program.
- New data and sites from Fretwell (2024).
- Data from the ASPA Management Plan.

### Corrections and removals

- Removed a 1986 SEAL MCPE count that lacked source and vantage information.
- Fixed an incorrect date on a 2023 DOBE gentoo count.
- Fixed citations for UAV-collected data attributed to H. Lynch and T. Hart.
- Corrected the locations (and region assignment) of WISH and BBAY.
- Removed a CHPE record at KETL (Strycker et al.) after determining the site is a gentoo/chinstrap mix, not pure chinstrap, making the original estimate unreliable.
- Corrected several errors in the Strycker et al. 2020 dataset after re-review of original images and spreadsheets.
- Fixed a transcription typo in a New Zealand-sourced count at CRZW (2019): corrected from 358,031 to 258,031.
- Removed Adelie counts at Stranger Point from Juares et al. (2024) after the authors confirmed the counts were not site-wide.
- Removed a Lynch & LaRue satellite-based estimate at LOVI, determined likely too low due to missed deep-shadow areas (per comparison with aerial photos).
- Fixed date-entry errors for RUGG and DANC introduced during manual data entry.
- Removed duplicate WOOD records created by the EDMO/WOOD merge.
- Cleaned up duplicate ASI records across multiple passes.
- Fixed citation/citekey errors across several tables (e.g., corrected citekey formatting for Parmalee 1987, fixed missing fields in Trivelpiece et al. 1979 and Manaakiwhenua 2021 data, corrected a citekey capitalization issue affecting downstream code).
- Fixed widespread Season/Year mismatches across all three pre-processed tables.
- Fixed a mask associated with GALE, and updated LLAN and PTHO data.

## Package changes

- Fixed a malformed `Authors@R` field in `DESCRIPTION` (a missing comma dropped Heather Lynch from the parsed author list).
- Replaced `leaflet.esri::addEsriTiledMapLayer` with `leaflet::addTiles`.
- Modernized package-level documentation in `R/mapppdr.R` to use the `"_PACKAGE"` sentinel instead of the deprecated `@docType package` tag.
- Added `Config/mapppdr/data_commit` to `DESCRIPTION`, recording the public MAPPPD_source commit the shipped data was built from (not the private mapppd_db submodule commit, which only relabels/repackages MAPPPD_source data without changing it).
- Added a `LICENSE.md` file with the full GPL-3 text, and updated `DESCRIPTION`'s `License` field to `GPL (>= 3)`.
- The site ID in each colony popup in `penmap()` is now a link that opens the site's coordinates in Google Earth in a new browser tab, with a pin dropped at the location.

