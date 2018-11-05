\name{fars_functions}
\alias{fars_functions}
\title{FARS Functions}
\usage{
fars_read(filename)

make_filename(year)

fars_read_years(years)

fars_summarize_years(years)

fars_map_state(state.num, year)
}
\description{
This set of functions imports, summarizes and visualizes traffic accident data from the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System. This data contains yearly nationwide records describing fatal injuries from motor vehicle accidents across the United States.
}
\examples{ \dontrun{
fars_read("accident_2013.csv")

make_filename(2013)

years <- list(2013, 2014, 2015)
fars_read_years(years = years)

years <- list(2013, 2014, 2015)
fars_summarize_years(years = years)

fars_map_state(1, 2013)
} }
