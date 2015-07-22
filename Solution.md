##R Programming - Programming Assignment 2

The cachematrix.R file contains following 2 functions:

1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.  

1. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
                If the inverse has already been calculated (and the matrix has not changed), 
                then cacheSolve should retrieve the inverse from the cache.

####NOTE 1 - interpreting '(and the matrix has not changed)'
 The statement "If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
 should retrieve the inverse from the cache." can be interpreted in multiple ways. The 'matrix has not change' may mean
 that the object created by makeCacheMatrix() itself is not different than the one supplied to cacheSolve() in previous 
 invocation or it may mean that the matrix supplied as argument to makeCacheMatrix() (which is stored in this special
 'matrix' constructed) has not changed since last invocation of cacheSolve(). This implementation takes the second 
 interpretation and checks value of the matrix stored in this object.

####NOTE 2 - how secure is matrix change check?
 The object created by makeCacheMatrix() also stores a copy of the matrix in a member variable called 'cachedMatrix'
 when inverse is saved. This 'cachedMatrix' is later used by cacheSolve() to make sure that matrix has not changed. 
 This is a good safeguard (sufficient for the purpose of this assignment) since there is no method to set the value 
 'cachedMatrix' from outside this object. However, the matrix and inverse can both be set from outside. Hence, a programmer
 can intentionally cause a malfunction by setting a different value of 'mat' or supplying a wrong inverse matrix.
 In order to make this check full proof, the inverse calculation has to be done inside this object and the setInverse() 
 method needs to be removed.