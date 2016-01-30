## Programming Assignment 2
 The solution for the ProgrammingAssignment2 by A.Neverov
### Description

This set of fulction allows to invert a square matrix
and excludes the repeated calculations via the caching 
of the inverted matrix

#### To use this function:
* create the square matrix, for example m
* create the CacheMatrix-object cm <- makeCacheMatrix(m)
* calculate the inverted matrix im <- cacheSolve(cm)

#### To proof the function's
* call the function round(m %*% im)
* as the result you'll get an E-matrix

#### WARNING! It's impossible to invert non-square matrixes or matrixes containing NAs with these functions

### makeCacheMatrix - 
This function creates a special object that contains the matrix and its invert

Argument: 
* x - the base square matrix
Returns: 
* the list contains method to access the matrix and its invert
* If x is non-square matrix or contains any NAs the function returns NULL

### cacheSolve 
The fucntion for inverting the square matrix created via the objects created with the makeCacheMatrix function

Arguments 
* x - the makeCacheMatrix object
* ... - the set of arguments for solve() function

Returns 
* if x isn't null the inverted matrix is returning
* if x is null the function returns NULL