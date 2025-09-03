# R/visualization.R

#' Create a Bar Chart from a Data Frame
#'
#' Creates a bar chart from a given data frame.
#'
#' @param data A data frame containing the data to plot.
#' @param category_col The name of the column to use for the categories (x-axis).
#' @param value_col The name of the column to use for the values (y-axis).
#' @return A ggplot object representing the bar chart.
#' @export
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_minimal ggtitle
bar <- function(data, category_col, value_col) {
  # Ensure the specified columns exist
  if (!category_col %in% names(data) || !value_col %in% names(data)) {
    stop("One or both specified columns not found in the data frame.")
  }

  # Create the plot
  p <- ggplot2::ggplot(data, ggplot2::aes(x = .data[[category_col]], y = .data[[value_col]])) +
    ggplot2::geom_bar(stat = "identity", fill = "#4a90e2", color = "white") +
    ggplot2::ggtitle(paste("Bar Chart of", value_col, "by", category_col)) +
    ggplot2::labs(x = category_col, y = value_col) +
    ggplot2::theme_minimal()

  print(p)
  return(p)
}

#' Create a Pie Chart from a Data Frame
#'
#' Creates a pie chart from a given data frame.
#'
#' @param data A data frame containing the data to plot.
#' @param category_col The name of the column to use for the slices.
#' @param value_col The name of the column to use for the slice sizes.
#' @return A ggplot object representing the pie chart.
#' @export
#' @importFrom ggplot2 coord_polar theme_void element_text
pie <- function(data, category_col, value_col) {
  if (!category_col %in% names(data) || !value_col %in% names(data)) {
    stop("One or both specified columns not found in the data frame.")
  }

  p <- ggplot2::ggplot(data, ggplot2::aes(x = "", y = .data[[value_col]], fill = .data[[category_col]])) +
    ggplot2::geom_bar(stat = "identity", width = 1, color="white") +
    ggplot2::coord_polar("y", start = 0) +
    ggplot2::ggtitle(paste("Pie Chart of", value_col, "by", category_col)) +
    ggplot2::labs(fill = category_col, x = NULL, y = NULL) +
    ggplot2::theme_void() +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5))

  print(p)
  return(p)
}

#' Create a Scatter Plot from a Data Frame
#'
#' Creates a scatter plot from a given data frame.
#'
#' @param data A data frame containing the data to plot.
#' @param x_col The name of the column for the x-axis.
#' @param y_col The name of the column for the y-axis.
#' @return A ggplot object representing the scatter plot.
#' @export
scatter <- function(data, x_col, y_col) {
  if (!x_col %in% names(data) || !y_col %in% names(data)) {
    stop("One or both specified columns not found in the data frame.")
  }

  p <- ggplot2::ggplot(data, ggplot2::aes(x = .data[[x_col]], y = .data[[y_col]])) +
    ggplot2::geom_point(color = "#d0021b", size = 3, alpha = 0.6) +
    ggplot2::ggtitle(paste("Scatter Plot of", y_col, "vs.", x_col)) +
    ggplot2::labs(x = x_col, y = y_col) +
    ggplot2::theme_minimal()

  print(p)
  return(p)
}
