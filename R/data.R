#' Example Cell Culture Inventory Data
#'
#' A toy dataset containing a fictional inventory of cryopreserved cell vials,
#' useful for demonstrating the functionality of the MACCI package.
#'
#' @format A tibble with 7 rows and 6 variables:
#' \describe{
#'   \item{CellLine}{The name of the cell line (character)}
#'   \item{PassageNumber}{The passage number of the cells in the vial (numeric)}
#'   \item{VialCount}{The number of vials available for that batch (numeric)}
#'   \item{Viability}{The post-thaw cell viability percentage (numeric)}
#'   \item{FreezeDate}{The date the vials were frozen (Date)}
#'   \item{Researcher}{The name of the researcher who froze the cells (character)}
#' }
#' @source Fictional data created for the MACCI package.
"cell_inventory_data"
