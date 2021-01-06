\name{fuzzy_matches}
\alias{fuzzy_matches}
\title{Find inexact matches in a clean list of strings.}
\usage{
fuzzy_matches(clean_list,dirty_list)
}
\description{
Replaces all strings in the dirty_list (usually handtyped) with close strings from the clean list (if those exist).
}
\examples{
fuzzy_matches(c("bookstore","telephone"),c("Telefone","bookstroe"))
}
