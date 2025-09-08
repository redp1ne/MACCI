#' Sort a Data Frame in Increasing Order
#'
#' Sorts a data frame based on a specified column in ascending order.
#'
#' @param data The data frame to sort.
#' @param sort_by_col A string specifying the name of the column to sort by.
#'
#' @return A new data frame, sorted in increasing order.
#' @export
#' @importFrom dplyr arrange
#'
#' @examples
#' # Create a sample data frame
#' df <- data.frame(
#'   Item = c("Flasks", "Tips", "Serum"),
#'   Quantity = c(50, 200, 12)
#' )
#'
#' # Sort the data frame by the 'Quantity' column
#' sorted_df <- increasing(df, sort_by_col = "Quantity")
#' print(sorted_df)
increasing <- function(data, sort_by_col) {
  if (!sort_by_col %in% names(data)) {
    stop("Sort column '", sort_by_col, "' not found in the data frame.")
  }
  # Using dplyr's arrange function to sort
  sorted_data <- dplyr::arrange(data, .data[[sort_by_col]])
  return(sorted_data)
}


#' Sort a Data Frame in Decreasing Order
#'
#' Sorts a data frame based on a specified column in descending order.
#'
#' @param data The data frame to sort.
#' @param sort_by_col A string specifying the name of the column to sort by.
#'
#' @return A new data frame, sorted in decreasing order.
#' @export
#' @importFrom dplyr arrange desc
#'
#' @examples
#' # Create a sample data frame
#' df <- data.frame(
#'   Item = c("Flasks", "Tips", "Serum"),
#'   Quantity = c(50, 200, 12)
#' )
#'
#' # Sort the data frame by 'Quantity' in descending order
#' sorted_df <- decreasing(df, sort_by_col = "Quantity")
#' print(sorted_df)
decreasing <- function(data, sort_by_col) {
  if (!sort_by_col %in% names(data)) {
    stop("Sort column '", sort_by_col, "' not found in the data frame.")
  }
  # Using dplyr's arrange and desc functions to sort
  sorted_data <- dplyr::arrange(data, dplyr::desc(.data[[sort_by_col]]))
  return(sorted_data)
}


#' Save a Data Frame to an Excel File
#'
#' Writes a data frame to a new .xlsx file.
#'
#' @param data_to_save The data frame that you want to save.
#' @param output_path A string specifying the full path and name for the output file
#'   (e.g., "/path/to/your/sorted_data.xlsx").
#'
#' @return This function does not return a value. It saves a file to your computer.
#' @export
#' @importFrom writexl write_xlsx
#'
#' @examples
#' \dontrun{
#' # Create a sample data frame
#' df <- data.frame(ID = 1:5, Value = letters[1:5])
#'
#' # Define an output path (this will save to your temporary directory)
#' file_location <- file.path(tempdir(), "my_data.xlsx")
#'
#' # Save the data
#' save_to_excel(df, file_location)
#' }
save_to_excel <- function(data_to_save, output_path) {
  message("Saving data to new file: ", output_path)
  writexl::write_xlsx(data_to_save, path = output_path)
}
