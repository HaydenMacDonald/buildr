\name{fars_functions}
\alias{fars_functions}
\title{Hello, World!}
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
\examples{
fars_read("data.csv")

make_filename(2018)

years <- list(2013, 2014, 2015)
fars_read_years(years = years)

years <- list(2013, 2014, 2015)
fars_summarize_years(years = years)

fars_map_state(1, 2013)
}
