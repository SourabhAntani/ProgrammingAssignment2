## This file contains 2 functions that calculates and caches inverse of a matrix
## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##                If the inverse has already been calculated (and the matrix has not changed), 
##                then cacheSolve should retrieve the inverse from the cache.

## NOTE 1:  The statement "If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache." can be interpreted in multiple ways. The 'matrix has not change' may mean
## that the object created by makeCacheMatrix() itself is not different than the one supplied to cacheSolve() in previous 
## invocation or it may mean that the matrix supplied as argument to makeCacheMatrix() (which is stored in this special
## 'matrix' constructed) has not changed since last invocation of cacheSolve(). This implementation takes the second 
## interpretation and checks value of the matrix stored in this object.

## NOTE 2: The object created by makeCacheMatrix also stores a copy of the matrix in a member variable called 'cachedMatrix'
## when inverse is saved. This 'cachedMatrix' is later used by cacheSolve() to make sure that matrix has not changed. 
## This is a good safeguard (sufficient for the purpose of this assignment) since there is no method to set the value 
## 'cachedMatrix' from outside this object. However, the matrix and inverse can both be set from outside. Hence, a programmer
## can intentionally cause a malfunction by setting a different value of 'mat' or supplying a wrong inverse matrix.
## In order to make this check full proof, the inverse calculation has to be done inside this object and the setInverse() 
## method needs to be removed.


## This function creates a special "matrix" object that can cache its inverse. The "matrix" object returned by this function
## contains 4 functions as its members. 
## 1. setMatrix(matrix) - sets the supplied matix as the 'mat' variable which stores matrix.
## 2. getMatrix() - returns the value of 'mat' variable, which is the matrix stored by setMatrix(matrix) function.
## 3. getCachedMatrix() - returns the value of 'cachedMatrix' variable.
## 4. setInverse(inverse) - sets the value of 'cachedMatrix' variable as a copy of 'mat' and 'cachedInverse' variable as inverse.
##                          These variables cache the value of matrix and its inverse. 
##                          The matrix is stored separately so it can be used to confirm that the matrix has not changed since 
##                          the inverse was cached.
## 5. getInverse() - returns the value of 'cachedInverse', if available. otherwise returns null. Before returning the inverse,
##                      the function confirms that values of 'mat' and 'cachedMatrix' are identical. If values are not identical,
##                      it means that the matrix has changed since the inverse was cached and hence, this function will return null.

makeCacheMatrix <- function(mat = matrix()) {
  inv <- NULL
  cachedMatrix <-NULL
  setMatrix <- function(y) {
    mat <<- y
    inv <<- NULL
    cachedMatrix <<-NULL
  }
  getMatrix <- function() mat
  getCachedMatrix <- function() cachedMatrix
  setInverse <- function(inverse){
    inv <<- inverse
    cachedMatrix <<-mat
  }
  getInverse <- function() inv
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse,
       getCachedMatrix = getCachedMatrix)
}


## This function checks if the inverse of a matrix has been calculated and cached. If it finds a valid value of cached inverse,
## it returns the cached value. Otherwise inverse is calculated, cached and returned.

cacheSolve <- function(x, ...) {
  matrix = x$getMatrix()
  cachedMatrix <- x$getCachedMatrix()
  inverse <- x$getInverse()
  if(!is.null(cachedMatrix) && !is.null(inverse) && sum(cachedMatrix - matrix)==0) {
    message("getting cached data")
    return(inverse)
  }
  inv <- solve(matrix, ...)
  x$setInverse(inv)
  inv
}
