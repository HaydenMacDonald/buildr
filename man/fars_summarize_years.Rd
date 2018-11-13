\name{fars_summarize_years}
\alias{fars_read_summarize}
\alias{fars_read_years}
\title{FARS SUMMARIZE YEARS}

\description{This function summarizes the list of tibbles returned by \code{fars_read_years}. The function aggregates the list of tibbles into a single tibble, creates groups by year and MONTH, counts the number of observations into a new column "n", and returns the summary tibble in wide format.
}

\usage{
fars_summarize_years(years)
}

\arguments{
  \item{years}{A list of numeric values matching the corresponding csv files to import and summarize}
}

\example{ \dontrun{
years <- list(2013, 2014, 2015)
fars_summarize_years(years = years)
}}
