\name{make_filename}
\alias{make_filname}
\alias{fars_read}
\alias{fars_read_years}
\title{FARS MAKE FILENAME}

\description{
This function takes a single value, vector or list representing a four integer year. The function prints a character string with the following format: "accident_[year].csv.bz2" for each value provided.
}

\usage{
make_filename(year)
}

\arguments{
  \item{year}{An numeric value of any length}
}

\examples{ \dontrun{
make_filename(2013)
}}
