

## Creating a Program for Caching the Inverse of a Matrix
     
    ## Matrix inversion is normally a costly computation.
    ## There may be some benefit to caching the inverse of
    ## a matrix rather than compute it repeatedly.
     
     
    makeCacheMatrix <- function(x=matrix()) {
    ## Creating a list of functions that
    ## can cache the inverse of a matrix.
    m <- NULL
    set <- function(y) {
    x <<- y
    m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<-inverse
    getInverse <- function() m
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
     
    }




    cacheSolve <- function(x, ...) {
    ## Will compute the inverse of the matrix returned
    ## by makeCacheMatrix(), unless the inverse has
    ## been calculated already, in which case
    ## it will retrieve it from the cache.
    m <- x$getInverse()
    if ( ! is.null(m)) {
    print("obtaining the cached data")
    return(m)
    }
    m <- solve(x$get())
    x$setInverse(m)
    m
    }

