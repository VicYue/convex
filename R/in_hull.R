inhull <- function(input,testpts){
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
  input <- inputt
  pts <- jm(input)
  bingoo <- replicate(length(testpts),0)
  for (i in 1:length(testpts)){
    for (j in 1:(length(pts)-1)){
      if(testpts[[i]][1]==pts[[j]][1]){
        if(testpts[[i]][2]==pts[[j]][2]){
          bingoo[i] <- 1
        }
      }
    }
  }
  if (sum(bingoo)==length(testpts)){
    print('All the points are in the Convex Hull')
  }
  if(sum(bingoo)< length(testpts)){
    if (sum(bingoo)==0){
      print('None of the points are in the Convex Hull')
    }else{
      print('Some of the points are in the Convex Hull')
      }
  }
}
