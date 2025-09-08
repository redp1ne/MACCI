test_that("Sorting functions order data correctly", {

  # SETUP
  unsorted_df <- data.frame(
    id = c("c", "a", "b"),
    value = c(3, 1, 2)
  )

  # EXPECTATIONS
  expected_increasing <- data.frame(
    id = c("a", "b", "c"),
    value = c(1, 2, 3)
  )
  expected_decreasing <- data.frame(
    id = c("c", "b", "a"),
    value = c(3, 2, 1)
  )

  # TEST
  expect_equal(increasing(unsorted_df, "value"), expected_increasing)
  expect_equal(decreasing(unsorted_df, "value"), expected_decreasing)
})


test_that("save_to_excel creates a file", {

  # SETUP
  test_df <- data.frame(x = 1, y = 2)
  temp_file_path <- file.path(tempdir(), "test_output.xlsx")

  # TEST
  save_to_excel(test_df, temp_file_path)

  # CHECK
  expect_true(file.exists(temp_file_path))

  # CLEANUP
  if (file.exists(temp_file_path)) {
    file.remove(temp_file_path)
  }
})

