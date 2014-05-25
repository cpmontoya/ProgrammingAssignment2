## The functions below can be used to create a matrix and solve for its inverse
## the inverse matrix is cached for later retrieval. Caching the matrix makes
## use of R's Lexical Scoping

## The makeCacheMatrix function creates a list of functions for getting and
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


## The cacheSolve function computes the inverse of the CacheMatrix created with
## the makeCacheMatrix function, above. Before computing the inverse, however,
## cacheSolve checks to see if the matrix has been computed and cached in which
## case it pulls the cached inverse rather than solve again. 

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     inv <- x$getinverse()
     if(!is.null(inv)){
          message("getting cache data")
          return(inv)
     }
     data <- x$get()
     inv <- solve(data, ...)
     x$setinverse(inv)
     inv
}
