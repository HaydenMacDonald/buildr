#' Read in data file in csv format and convert to tibble
#'
#' This is a function that imports a comma-separated values file from the working directory
#' via \link{\code{read_csv}} from \code{readr}. After import, the data object is converted
#' to tibble format via \link{\code{tbl_df}} from \code{dplyr}.
#'
#' @param filename A character vector matching the name of the file to be imported
#'
#' @return This function returns a dataset in tibble format. As a side effect, this function
#'    also prints the tibble.
#'
#' @examples
#' \dontrun{fars_read("accident_2013.csv")}
#'
#' @note If the file does not exist in the working directory, the function will return an error.
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}

#' Create a filename given a provided year(s)
#'
#' This function takes a single value, vector or list representing a four integer year. The function prints
#' a character string with the following format: "accident_[year].csv.bz2" for each value provided.
#'
#' @param year An numeric value of any length
#'
#' @return This function produces a side effect by printing the generated filename as a character string
#'
#' @examples
#' \dontrun{make_filename(2018)}
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}

#' Return a list of tibbles from a list of specified years
#'
#' This function takes a list of numeric values and returns a list of tibbles
#' containing the MONTH and year columns only. The list of numeric values are
#' translated to filenames via \link{\code{make_filename}} and the filenames are used
#' to read in the corresponding csv files via \link{\code{fars_read}}. The tibbles
#' returned by \link{\code{fars_read}} are reduced to the MONTH and year columns only.
#'
#' @param years A list of numeric values matching the corresponding csv files to import
#'
#' @return This function has a side effect that returns a list of tibbles with two columns: year and MONTH
#'
#' @examples
#' \dontrun{years <- list(2013, 2014, 2015)
#' fars_read_years(years = years)}
#'
#' @note If the argument of the years is not a list or if the list of tibbles cannot be executed,
#'    the function will return an error, specifying which year could not be returned.
#'
#' @importFrom dplyr mutate select
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}

#' Summarize a list of tibbles by observation counts
#'
#' This function summarizes the list of tibbles returned by \link{\code{fars_read_years}}.
#' The function aggregates the list of tibbles into a single tibble, creates groups by year
#' and MONTH, counts the number of observations into a new column "n", and returns the summary
#' tibble in wide format.
#'
#' @param years A list of numeric values matching the corresponding csv files to import and summarize
#'
#' @return This function returns a summary data frame in wide format as a side effect.
#'
#' @examples
#' \dontrun{years <- list(2013, 2014, 2015)
#' fars_summarize_years(years = years)}
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}

#' Map all recorded accidents of a specified year on a map graphic of a specified state
#'
#' This function takes a state number and year to import and subset the corresponding csv
#' file. Records with missing longitudinal and latitudinal data are assigned default values.
#' A map graphic of the specified state is generated with points representing individual
#' records mapped on top.
#'
#' @param state.num A numeric value corresponding to the state number
#' @param year A numeric value corresponding to the csv file to be imported
#'
#' @return Returns a side effect map graphic of the state with all recorded
#'     accidents represented as points on the same map.
#'
#' @examples
#' \dontrun{fars_map_state(1, 2013)}
#'
#' @note If provided state number is not found in the data frame, an error is returned.
#'    If specified subset of data has no records associated with it, a message is returned.
#'
#' @importFrom graphics points
#' @importFrom maps map
#' @importFrom dplyr filter
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
