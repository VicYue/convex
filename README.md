# Convex Hull R Package
This is the repository for STOR601 Coursework on linking C++ and R. The aim of the coursework is to make a R package using C++ script. The R package is called **'convex'**. By using the **'devtools'** package in R, one could download and use 'convex' from this repository using the following code:
```
install_github("VicYue/convex")

library(convex)
```

## General Instruction on Using the R Package: convex
Within the R package, there are in total 3 functions. The main function written through C++ scripts are jarvis_march(), the other two functions are R functions as an extension on the jarvis_march() function.

### jarvis_march()
This function takes a set of points in a plane as input and output the line segment connecting the convex hull of these set of points. The data structure of input could be a list of vector of length 2(represent x-coordinate and y-coordinate), it could be a dataframe with 2 columns, or it could be a matrix of 2 columns. The output of the function is in the structure of a list of vector of length 4 $(X1,Y1,X2,Y2)$, where $X1$ and $Y1$ are the coordinate of the starting point of the line segment, $X2$ and $Y2$ are the coordinate of the ending point of the line segment. One should find the $X2$ and $Y1$ in the first item of the output list should be the same as the $X2$ and $Y2$ in the last item of the output list. The function also detects some errors in the input and give corresponding error messages (i.e if the input data structure is not accepted in the algorithm or the number of input points is not enough)

### plotconvex()
This algorithm use the jarvis_march() which takes the same type of input (data points on one plate), and output a plot. The plot illustrate all the input points as black dot and the convex hull points are indicated in red dot with the line segment connecting them also in red. 


### inhull()



## General Guide on Checking Coursework
[LinkingCplusplusRTest.ipynb](LinkingCplusplusRTest.ipynb)
