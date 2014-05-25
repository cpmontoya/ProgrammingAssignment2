## The functions below can be used to create a matrix and solve for its inverse
## the inverse matrix is cached for later retrieval. Caching the matrix makes
## use of R's Lexical Scoping

## The function makeCacheMatrix creates a list of functions for getting and
## and setting a matrix as well as getting and setting its inverse

makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(temp){
          x <<- temp
          inv <<- NULL
     }
     get <- function() x
     setinverse <- function(solve) inv <<- solve
     getinverse <- function() inv
     list(set = set, get = get, setinverse = setinverse, 
          getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
