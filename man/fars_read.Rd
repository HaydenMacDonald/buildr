\name{fars_read}
\alias{fars_read}
\alias{fars_read_years}
\title{FARS READ}

\description{
This is a function that imports a comma-separated values file from the working directory via \code{read_csv} from \code{readr}. After import, the data object is converted to tibble format via \code{tbl_df} from \code{dplyr}.
}

\usage{
fars_read(filename)
}

\arguments{
  \item{filename}{A character vector matching the name of the file to be imported}
}

\note{If the file does not exist in the working directory, the function will return an error.}

\examples{ \dontrun{
fars_read("accident_2013.csv")
} }
