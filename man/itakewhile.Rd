% Generated by roxygen2 (4.0.1): do not edit by hand
\name{itakewhile}
\alias{itakewhile}
\title{Iterator that returns elements while a predicate function returns TRUE}
\usage{
itakewhile(predicate, object)
}
\arguments{
\item{predicate}{a function that determines whether an element is \code{TRUE}
or \code{FALSE}. The function is assumed to take only one argument.}

\item{object}{an iterable object}
}
\value{
iterator object
}
\description{
Constructs an iterator that returns elements from an iterable \code{object}
as long as the given \code{predicate} function returns \code{TRUE}.
}
\examples{
# Filters out numbers exceeding 5
not_too_large <- function(x) {
  x <= 5
}
it <- itakewhile(not_too_large, 1:100)
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 4
nextElem(it) # 5
nextElem(it) # BOOM! Error

# Same approach but uses an anonymous function
it2 <- itakewhile(function(x) x <= 10, seq(2, 100, by=2))
nextElem(it2) # 2
nextElem(it2) # 4
nextElem(it2) # 6
nextElem(it2) # 8
nextElem(it2) # 10
nextElem(it2) # BOOM! Error
}

