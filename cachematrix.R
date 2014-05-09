## Takes a matrix x and returns a list of functions that monitor, update, and return
## matrix x.

makeCacheMatrix <- function(x = matrix()) {
  inverse = NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) inverse <<- solve
  getInverse <- function() inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Takes a list x that contains functions for monitoring, updating, and returning
## a given matrix, checks whether the matrix's inverse is already cached,
## and returns the inverse of the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  if(ncol(data) == nrow(data)) {
    inverse <- solve(data, ...)
    x$setInverse(inverse)
    inverse
  }
  else {
    message("matrix does not have nxn dimensions")
  }
}
