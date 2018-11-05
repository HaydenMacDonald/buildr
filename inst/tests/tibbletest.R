acc_file <- system.file("inst", "extdata", "accident_2013.csv", package = "farsr")
acc13 <- fars_read("accident_2013.csv")

expect_that(acc13, is_a("tibble"))
