#include <iostream>
#include <list>
#include <vector>
#include <algorithm>
#include <cmath>
#include <Rcpp.h>
using namespace Rcpp;

float distt(std::vector<double> a, std::vector<double> b)
{
    return sqrt((a[0]-b[0])*(a[0]-b[0])+(a[1]-b[1])*(a[1]-b[1])); 
    // A function to return the Euclidean distance between the given two points
}
float ccw(std::vector<double> p, std::vector<double> q, std::vector<double> r)
{
    float val = (q[1]-p[1]) * (r[0]-q[0]) - (q[0]-p[0]) * (r[1]-q[1]);
    return val;
    // A function to calculate the cross product of pq and pr
}
bool equalpt (std::vector<double> a, std::vector<double> b){
return ((a[1] == b[1]) && (a[0] == b[0]));
// A boolean function to check if two points are the same
}
bool sortpt (std::vector<double> a, std::vector<double> b){
return a[1] < b[1];
// A boolean function to help sorting the points, this will be used when removing duplicates
}

//[[Rcpp::export]]

std::vector<std::vector<double> > jm(std::vector<std::vector<double> > points)
{
    // First we remove the duplicates from the input:
    std::sort(points.begin(),points.end(),sortpt);
    std::vector<std::vector<double> >::iterator new_end;
    new_end = std::unique(points.begin(),points.end(),equalpt);
    points.erase(new_end,points.end());
    
    // Create a vector of points hull to record the final output 
    std::vector<std::vector<double> > hull;
    int n = points.size();
    
    // If the number of the points in the input vector after removing duplicate is less than 3, we output an empty vector 
    // This depends on how we define the convex hull, if the minimum number of points to form a convex hull could be defined
    // less than 3, than the return in the following if condition can be changed to return the 'points' in stead of 'hull'
    if (n <= 2)
    {
    std::cout << "The number of the points are not enough to form a convex hull!" << std::endl;
    return hull;
    }
    
    // We then find the leftmost point with the highest y-coordinate.
    int l = 0;
    for (int i =1; i<n; i++){
        if (points[i][0] < points[l][0]){
        l=i;
        } else if (points[i][0] == points[l][0]){
            if (points[i][1] > points[l][1]){
            l=i;
            }
        }
    }
    int p =l;
    int q;
    float disa;
    float disb;
    float dd;
    
    
    while(true){
    hull.push_back(points[p]);
    
    // Initialize q as the next index (index+1) or 0 if p is the last point's index
    if (p == n-1){
            q = 0;
            } else {
            q = p + 1;
            }
    for (int r = 0; r<n; r++){
    disa = distt(points[r],points[p]);
    disb = distt(points[q],points[p]);
    dd = ccw(points[p], points[r], points[q]);
    if (dd < 0 or (dd == 0 and disa > disb)){
    q = r;
    // for all the points r in the points set, if r is counterclockwise, 
    // we update q as r, if there's collinearity, 
    // we consider the farthest point
    }
    }
    p = q;
    // Update our next p to be the current q
    if (p == l){ 
    // When the first p is detected again, we stop the algorithm
    hull.push_back(points[l]);
    // The first point is added to the hull list again for the convenience of checking the convex hull is closed.
    break;
    }
    }
    return hull;
}
