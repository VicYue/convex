# Convex Hull R Package
This is the repository for STOR601 Coursework on linking C++ and R. The aim of the coursework is to make a R package using C++ script. The R package is called **'convex'**. By using the **'devtools'** package in R, one could download and use 'convex' from this repository using the following code:
```
install_github("VicYue/convex")

library(convex)
```

## General Instruction on Using the R Package: convex
Within the R package, there are in total 3 functions. The main function written through C++ scripts are jarvis_march(), the other two functions are R functions as an extension on the jarvis_march() function.

### [jarvis_march()](https://github.com/VicYue/convex/blob/main/R/jarvis_march.R)
This function takes a set of points in a plane as input and output the line segment connecting the convex hull of these set of points. The data structure of input could be a list of vector of length 2(represent x-coordinate and y-coordinate), it could be a dataframe with 2 columns, or it could be a matrix of 2 columns. The output of the function is in the structure of a list of vector of length 4 $(X1,Y1,X2,Y2)$, where $X1$ and $Y1$ are the coordinate of the starting point of the line segment, $X2$ and $Y2$ are the coordinate of the ending point of the line segment. One should find the $X2$ and $Y1$ in the first item of the output list should be the same as the $X2$ and $Y2$ in the last item of the output list. The function also detects some errors in the input and give corresponding error messages (i.e if the input data structure is not accepted in the algorithm or the number of input points is not enough)

### [plotconvex()](https://github.com/VicYue/convex/blob/main/R/plott.R)
This algorithm use the jarvis_march() which takes the same type of input (data points on one plate), and output a plot. The plot illustrate all the input points as black dot and the convex hull points are indicated in red dot with the line segment connecting them also in red. 


### [inhull()](https://github.com/VicYue/convex/blob/main/R/in_hull.R)
This algorithm takes two input, the first input is the same as jarvis_march() and plotconvex() being a set of points in a plane. The second input is the user-decided list of vectors (point(points)) that user what to identify whether the point(points) are in the convex hull. There are three possible output. If all the user-decided points are in the convex hull set, then it will give the message that the points are all in the convex hull; If some of the user-decided points are not in the convex hull set but some are, then it will give the message that some of the points are in the convex hull; If non of the user-decided points are in the convex hull, the function will output the message that none of the points are in the convex hull.

## General Guide on Checking Coursework
All the above R functions can be found in the **R** folder, the C++ scripts can be found [here](https://github.com/VicYue/convex/blob/main/src/jm.cpp) in the **src** folder. The illustration of examples and test cases are in [LinkingCplusplusRTest.ipynb](LinkingCplusplusRTest.ipynb). The previous two courseowrk's jupyter notebook could be found here: [python](PythonCoursework.ipynb) and [C++](CppCoursework.ipynb). There's also a seperate jupyter notebook on comparing the four different algorithms in terms of 5Rs: [5R](5R.ipynb).
