## Author: Swadesh Pal. ## Created on: 22-05-2016. ## Last edited: 22-05-2016.
# R Programming by Johns Hopkins University on Coursera. 
# Programming assignment 2.
#
# Caching the inverse of a matrix can reduce the computation cost while
# calculating the inverse of a matrix by preventing repeated calculation.
# Following pair of functions cache the inverse of a matrix:
# "makeCacheMatrix.R" and "cacheSolve.R".
# It is assumed that the matrix supplied is always invertible.

# Function "makeCacheMatrix" creates a special "matrix" object
# that can cache its inverse which is really a list containing a function to:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of matrix
# 4. get the value of the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  invMat <- NULL
  set <- function(y) {
    x <<- y
    invMat <<- NULL
  }
  get <- function() x
  setInverse <- function(calcInvMat) invMat <<- calcInvMat
  getInverse <- function() invMat
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


# Function "cacheSolve" computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. If the inverse has already been 
# calculated (and the matrix has not changed), then the cachesolve should 
# retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of 'x'
  invMat <- x$getInverse()
  if(!is.null(invMat)) {
    message("getting cached data")
    return(invMat)
  }
  data <- x$get()
  invMat <- solve(data, ...)
  x$setInverse(invMat)
  invMat
}
