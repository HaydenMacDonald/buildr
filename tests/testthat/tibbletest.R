context("Data format")
library(farsr)

test_that("imported csv is correctly converted to tbl_df format", {
  source(file.path("R", "fars_functions.R"))
  acc_file <- file.path("inst", "extdata", "accident_2013.csv")
  acc13 <- fars_read(acc_file)
  expect_that(acc13, is_a("tbl_df"))
})
