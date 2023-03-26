plotconvex <- function(input){
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
  xlabb <- c()
  ylabb <- c()
  for (i in 1:length(input)){
    xlabb <- c(xlabb, input[[i]][1])
    ylabb <- c(ylabb, input[[i]][2])
  }
  plot(xlabb,ylabb,xlab='x',ylab='y',main='Convex_Hull')
  lineseg <- jarvis_march(input)
  for (i in 1:length(lineseg)){
    segments(x0=lineseg[[i]][1],y0=lineseg[[i]][2],x1=lineseg[[i]][3],y1=lineseg[[i]][4],col='red')
  }
  jress <- jm(input)
  for (i in 1:length(jress)){
    points(jress[[i]][1],jress[[i]][2],col='red',pch=19)
  }
}


