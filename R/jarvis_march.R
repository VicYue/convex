jarvis_march <- function(input){
  inputt <- input 
  if (class(input) == "data.frame"){
    inputt <- list()
    for (i in 1:nrow(input)){
      inputt[[i]] <- c(input[i,1],input[i,2])
    }
  }
  if (class(input)[1] == "matrix"){
    inputt <- list()
    for (i in 1:(dim(input)[1])){
      inputt [[i]] <- c(input[i,1],input[i,2])
    }
  }
  if(class(input) != "data.frame"){
    if(class(input)[1] != "matrix"){
      if(class(input) != "list"){
        stop('This function only accepts input class being a list, a matrix or a dataframe')
      }
    }
  }
  input <- inputt
  if(length(input) <= 2){
    stop('The length of input points should be larger than 2!')
  }
  pts <- jm(input)
  lines <- list()
  for (i in 1:(length(pts)-1)){
    lines[[i]] <- c(pts[[i]],pts[[i+1]])
  }
  return(lines)
}
