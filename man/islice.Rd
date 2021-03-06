% Generated by roxygen2 (4.0.1): do not edit by hand
\name{islice}
\alias{islice}
\title{Iterator that returns selected elements from an iterable.}
\usage{
islice(object, start = 1, end = NULL, step = 1)
}
\arguments{
\item{object}{iterable object through which this function iterates}

\item{start}{the index of the first element to return from \code{object}}

\item{end}{the index of the last element to return from \code{object}}

\item{step}{the step size of the sequence}
}
\value{
iterator that returns \code{object} in sequence
}
\description{
Constructs an iterator that returns elements from an iterable following the
given sequence with starting value \code{start} and ending value \code{end}.
The sequence's step size is given by \code{step}.
}
\details{
The iterable given in \code{object} is traversed beginning with element
having index specified in \code{start}. If \code{start} is greater than 1,
then elements from the \code{object} are skipped until \code{start} is
reached. By default, elements are returned consecutively. However, if the
\code{step} size is greater than 1, elements in \code{object} are skipped.

If \code{stop} is \code{NULL} (default), the iteration continues until the
iterator is exhausted unless \code{end} is specified. In this case,
\code{end} specifies the sequence position to stop iteration.
}
\examples{
it <- islice(1:5, start=2)
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 4
nextElem(it) # 5

it2 <- islice(1:10, start=2, end=5)
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 4
nextElem(it) # 5

it3 <- islice(1:10, start=2, end=9, step=2)
nextElem(it) # 2
nextElem(it) # 4
nextElem(it) # 6
nextElem(it) # 8
}

