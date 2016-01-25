## makeCacheMatrix stores and returns 4 functions: StoredMatrix, RetrieveMatrix, CacheInvMatrx, and GetInverse. They are briefly described below:
## StoredMatrix - retrieves new matrix, sets Cache to NULL
## RetrieveMatrix - returns the stored matrix
## ChacheInvMatrx - puts solved matrix into Cache
## GetInverse - retrieves Cache

makeCacheMatrix <- function(x = matrix()) {
  
  Cache <- NULL
  
  StoredMatrix <- function(NewMatrix) {
    x <<- NewMatrix
    Cache <<- NULL
  }
  
  RetrieveMatrix <- function() {
    x
  }
  
  CacheInvMatrx <- function(solve) {
    Cache <<- solve
  }
  
  GetInverse <- function() {
    Cache
  }
  list(StoredMatrix = StoredMatrix, RetrieveMatrix = RetrieveMatrix, CacheInvMatrx = CacheInvMatrx, GetInverse = GetInverse)
}


## This function checks if the Cache is null- if not null, then it gets the cached value, if null, then in calculates the inveserse 

cacheSolve <- function(x, ...) {
  Inverse <- x$GetInverse()
  if(!is.null(Inverse)) {
    message("Getting cached data")
    return(Inverse)
  }
  data <- x$RetrievetMatrix()
  Inverse <- solve(data)
  x$CacheInvMatrix(Inverse)
  Inverse
  ## Return a matrix that is the inverse of 'x'
