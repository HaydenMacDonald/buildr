\name{fars_map_state}
\title{FARS MAP STATE}

\description{This function takes a state number and year to import and subset the corresponding csv file. Records with missing longitudinal and latitudinal data are assigned default values. A map graphic of the specified state is generated with points representing individual records mapped on top.}

\usage{fars_map_state(state.num, year)}

\item{state.num}{A numeric value corresponding to the state number}
\item{year}{A numeric value corresponding to the csv file to be imported}

\example{ \dontrun{
fars_map_state(1, 2013)
}}