## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## function returns list of named functions
## these functions allow you to get and set matrix value using lexical clojures
## and get and set (cache) inverse matrix
    inverseMatrix <- NULL
    set <- function(y) {
        x <<- y
        inverseMatrix <<- NULL
    }
    get <- function() x
    setInverseMatrix <- function(inverse) inverseMatrix <<- inverse
    getInverseMatrix <- function() inverseMatrix
    list(set = set,
         get = get,
         setInverseMatrix = setInverseMatrix,
         getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverseValue <- x$getInverseMatrix()
    ## get inverse matrix or null if it is not calculated yet
    if(!is.null(inverseValue)) {
        ## if inverse matrix is already calculated returns it
        message("getting cached data")
        return(inverseValue)
    }
    ## if inverse value is not calculated yet, calculate it and cache
    ## and returns calculated value
    data <- x$get()
    inverseValue <- solve(data)
    x$setInverseMatrix(inverseValue)
    inverseValue
}
