## Put comments here that give an overall description of what your
## functions do

# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix = function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get = function() x
    setsolve = function(solve) m <<- solve
    getsolve =  function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.

cacheSolve = function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data = x$get()
    m = solve(data, ...)
    x$setsolve(m)
    m
}

A = matrix(c(1,0,0,1), 2, 2); A
B = matrix(c(2,3,4,5), 2, 2); B

v = makeCacheMatrix(A)
cacheSolve(v)

z = makeCacheMatrix(B)
cacheSolve(z)

