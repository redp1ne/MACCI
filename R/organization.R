# R/organization.R

#' Sort a Data Frame in Increasing Order
#'
#' Sorts a data frame in ascending order based on a specified column.
#'
#' @param data A data frame to sort.
#' @param sort_by_col The name of the column to sort by.
#' @return A data frame sorted in increasing order.
#' @export
#' @importFrom dplyr arrange
increasing <- function(data, sort_by_col) {
  if (!sort_by_col %in% names(data)) {
    stop("Sort column '", sort_by_col, "' not found in the data frame.")
  }

  sorted_data <- dplyr::arrange(data, .data[[sort_by_col]])
  return(sorted_data)
}

#' Sort a Data Frame in Decreasing Order
#'
#' Sorts a data frame in descending order based on a specified column.
#'
#' @param data A data frame to sort.
#' @param sort_by_col The name of the column to sort by.
#' @return A data frame sorted in decreasing order.
#' @export
#' @importFrom dplyr arrange desc
decreasing <- function(data, sort_by_col) {
  if (!sort_by_col %in% names(data)) {
    stop("Sort column '", sort_by_col, "' not found in the data frame.")
  }

  sorted_data <- dplyr::arrange(data, dplyr::desc(.data[[sort_by_col]]))
  return(sorted_data)
}

#' Save a Data Frame to an Excel File
#'
#' Writes a data frame to a new .xlsx file.
#'
#' @param data The data frame to save.
#' @param file_path The path and name for the new Excel file (e.g., "sorted_data.xlsx").
#' @return Invisibly returns the path to the new file.
#' @export
#' @importFrom writexl write_xlsx
save_to_excel <- function(data, file_path) {
  message("Saving data to new file: ", file_path)
  writexl::write_xlsx(data, path = file_path)
  invisible(file_path)
}
