\name{fars_read_years}
\alias{fars_read_years}
\alias{make_filename}
\alias{fars_read}
\title{FARS READ YEARS}

\description{This function takes a list of numeric values and returns a list of tibbles containing the MONTH and year columns only. The list of numeric values are translated to filenames via \code{make_filename} and the filenames are used to read in the corresponding csv files via \code{fars_read}. The tibbles returned by \code{fars_read} are reduced to the MONTH and year columns only.
}

\usage{
fars_read_years(years)
}

\arguments{
  \item{years}{A list of numeric values matching the corresponding csv files to import}
}

\example{
  \dontrun{
  years <- list(2013, 2014, 2015)
  fars_read_years(years = years)
}}


