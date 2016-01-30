## The solution for the ProgrammingAssignment2 by A.Neverov
## This set of fulction allows to invert a square matrix
## and excludes the repeated calculations via the caching 
## of the inverted matrix

### To use this function:
### 1) create the square matrix, for example m
### 2) create the CacheMatrix-object cm <- makeCacheMatrix(m)
### 3) calculate the inverted matrix im <- cacheSolve(cm)

### WARNING! It's impossible to invert non-square matrixes
### or matrixes containing NAs with these functions

## makeCacheMatrix - function creates a special object that
## contains the matrix and its invert
### Argument: x - the base square matrix
### Returns: the list contains method to access the matrix
### and its invert
### If x is non-square matrix or contains any NAs
### the function returns NULL

makeCacheMatrix <- function(x = matrix()) {
      d <- dim(x)
      if (d[1] == d[2] & !anyNA(x)) { #is it a square matrix without NAs
            imtx <- NULL
      
            set <- function(y) {
                  x <<- y
                  imtx <<- NULL
            }
            
            get <- function() x

            setinvert <- function(...) imtx <<- solve(x, ...)
            
            getinvert <- function() imtx
            
            list( set = set, get = get, setinvert = setinvert, getinvert = getinvert)
      } else { 
            message("The matrix must be square and must not have any NAs")
            return(NULL)
      }
}


## cacheSolve - the fucntion for inverting the square matrix
## created via the objects created with the makeCacheMatrix function
### Arguments: x - the makeCacheMatrix object
### ... - the set of arguments for solve() function
### Returns: if x isn't null the inverted matrix is returning
### if x is null the function returns NULL

cacheSolve <- function(x, ...) {
      if (!is.null(x)) { #is the CacheMatrix not null
            m <- x$getinvert()
            
            if (!is.null(m)) {
                  message("getting cached data")
                  return(m)
            } else {
                  x$set(m)
            }
            
            data <- x$get()
            
            m <- x$setinvert(...)
            
            m
      } else {
            message("The argument can not be NULL")
            return(NULL)
      }
}
