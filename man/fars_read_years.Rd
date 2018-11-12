\name{fars_read_years}
\title{FARS READ YEARS}

\description{This function takes a list of numeric values and returns a list of tibbles containing the MONTH and year columns only. The list of numeric values are translated to filenames via \link{\code{make_filename}} and the filenames are used to read in the corresponding csv files via \link{\code{fars_read}}. The tibbles returned by \link{\code{fars_read}} are reduced to the MONTH and year columns only.}

\usage{
fars_read_years(years)
}

\item{years}{A list of numeric values matching the corresponding csv files to import}

\example{ \dontrun{
years <- list(2013, 2014, 2015)
fars_read_years(years = years)
}}


