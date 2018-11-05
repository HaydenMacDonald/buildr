context("Data format")
library(farsr)

test_that("imported csv is correctly converted to tbl_df format", {
  acc_file <- system.file("extdata", "accident_2013.csv", package = "farsr")
  acc13 <- fars_read(acc_file)
  expect_that(acc13, is_a("tbl_df"))
})
