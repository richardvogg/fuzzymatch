\name{fuzzy_dedupes}
\alias{fuzzy_dedupes}
\title{
Find inexact duplicates in a vector of handtype strings.
}
\description{

}
\usage{
fuzzy_dedupes(vec)
fuzzy_dedupes(vec,cutoff_value = 0.1)
fuzzy_dedupes(vec,find_cutoff = TRUE)
}

\arguments{
  \item{vec}{
input vector
}
  \item{find_cutoff}{
Boolean value; if TRUE, the calculation will return a dataframe with possible `best_fit` suggestions. This allows users to choose a reasonable `cutoff_distance`. Default: FALSE.
}
  \item{cutoff_distance}{
Maximum similarity between two strings up to which one will be replaced by the other. Default 0.06.
}
}

\author{
Richard Vogg
}
\examples{
vec <- c("hello","hallo","hello","telephone","telefone","telephone")

fuzzy_dedupes(vec,find_cutoff=TRUE)
fuzzy_dedupes(vec,cutoff=0.15)
}
