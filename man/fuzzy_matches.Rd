\name{fuzzy_matches}
\alias{fuzzy_matches}
\title{Find inexact matches in a clean list of strings.}
\usage{
fuzzy_matches(clean_vec,dirty_vec)
}
\description{
Replaces all strings in the dirty_list (usually handtyped) with close strings from the clean list (if those exist).
}
\arguments{
  \item{clean_vec}{
input vector; the vector which contains reference strings which are used as potential replacements.
}
\item{dirty_vec}{
input vector; the vector which contains handtyped strings for which you want to find inexact matches.
}
  \item{find_cutoff}{
Boolean value; if TRUE, the calculation will return a dataframe with possible `best_fit` suggestions. This allows users to choose a reasonable `cutoff_distance`. Default: FALSE.
}
  \item{cutoff_distance}{
Maximum similarity between two strings up to which one will be replaced by the other. Default 0.06.
}
}
\examples{
fuzzy_matches(c("bookstore","telephone"),c("Telefone","bookstroe"))
}
