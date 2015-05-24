## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  #data member storing inverse of the matrix, initialize to 0
  inv <- NULL
  
  ##setter method
  set <- function(matrix) {
    matr <<- matrix
    inv <<- NULL
  }
  ##getter method
  get <- function() matr
  
  ##setter and getter for the inverse of the matrix
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  
  ##return list of fucntions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  ##get inverse of the matrix passed in
  inv <- x$getInverse()
  
  ##if inverse is known, return it from the cache
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  ##otherwise, compute inverse
  data <- x$get()
  inv <- solve(data)
  
  ##and set inverse for later use
  x$setInverse(inv)
  ##finally return inverse of the matrix
  inv

}

##usage
# mm<-rbind(c(1.1, 3.3, 5.5), c(2.2, 6.6, 4.4), c(0.0, 7.7, 8.8))
# > mm
# [,1] [,2] [,3]
# [1,]  1.1  3.3  5.5
# [2,]  2.2  6.6  4.4
# [3,]  0.0  7.7  8.8
# > m1<-makeCacheMatrix(mm)
# > m1
# $set
# function (matrix) 
# {
#   matr <<- matrix
#   inv <<- NULL
# }
# <environment: 0x000000000ea5b240>
#   
#   $get
# function () 
#   matr
# <environment: 0x000000000ea5b240>
#   
#   $setInverse
# function (inverse) 
#   inv <<- inverse
# <environment: 0x000000000ea5b240>
#   
#   $getInverse
# function () 
#   inv
# <environment: 0x000000000ea5b240>
#   
#  
# > m1$get()
# [,1] [,2] [,3]
# [1,]  1.1  3.3  5.5
# [2,]  2.2  6.6  4.4
# [3,]  0.0  7.7  8.8
# > cacheSolve(m1)
# [,1]       [,2]       [,3]
# [1,]  0.4329004  0.2380952 -0.3896104
# [2,] -0.3463203  0.1731602  0.1298701
# [3,]  0.3030303 -0.1515152  0.0000000
# > 
#   > cacheSolve(m1)
# getting cached data
# [,1]       [,2]       [,3]
# [1,]  0.4329004  0.2380952 -0.3896104
# [2,] -0.3463203  0.1731602  0.1298701
# [3,]  0.3030303 -0.1515152  0.0000000
# > 

