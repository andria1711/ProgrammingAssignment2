## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Initialize an object to store the inverse
  
  set <- function(y) {
    x <<- y      # Assign new matrix to x
    inv <<- NULL # Reset the inverse to NULL whenever matrix changes
  }
  
  get <- function() x  # Return the matrix
  
  setInverse <- function(inverse) inv <<- inverse  # Cache the inverse
  
  getInverse <- function() inv  # Return the cached inverse
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Retrieve the cached inverse if available
  
  if (!is.null(inv)) {
    message("getting cached inverse")  # Notify user that cached data is used
    return(inv)
  }
  
  data <- x$get()  # Get the matrix
  
  inv <- solve(data, ...)  # Compute the inverse using `solve()`
  
  x$setInverse(inv)  # Cache the computed inverse
  
  inv  # Return the inverse
}
