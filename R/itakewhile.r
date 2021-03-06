#' Iterator that returns elements while a predicate function returns TRUE
#'
#' Constructs an iterator that returns elements from an iterable \code{object}
#' as long as the given \code{predicate} function returns \code{TRUE}.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param predicate a function that determines whether an element is \code{TRUE}
#' or \code{FALSE}. The function is assumed to take only one argument.
#' @param object an iterable object
#' @return iterator object
#' 
#' @examples
#' # Filters out numbers exceeding 5
#' not_too_large <- function(x) {
#'   x <= 5
#' }
#' it <- itakewhile(not_too_large, 1:100)
#' nextElem(it) # 1
#' nextElem(it) # 2
#' nextElem(it) # 3
#' nextElem(it) # 4
#' nextElem(it) # 5
#' nextElem(it) # BOOM! Error
#'
#' # Same approach but uses an anonymous function
#' it2 <- itakewhile(function(x) x <= 10, seq(2, 100, by=2))
#' nextElem(it2) # 2
#' nextElem(it2) # 4
#' nextElem(it2) # 6
#' nextElem(it2) # 8
#' nextElem(it2) # 10
#' nextElem(it2) # BOOM! Error
itakewhile <- function(predicate, object) {
  iter_obj <- iterators::iter(object)

  stop_iterating <- FALSE
  nextElem <- function() {
    if (stop_iterating) {
      stop("StopIteration", call.=FALSE)
    }
    next_elem <- iterators::nextElem(iter_obj)
    if (predicate(next_elem)) {
      return(next_elem)
    } else {
      stop("StopIteration", call.=FALSE)
      stop_iterating <<- TRUE
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
