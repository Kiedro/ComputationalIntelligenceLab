# function setup:
cecF <- function(x1, x2){
  vec <- rep(0, 2)                    # create vector [0, 0]
  vec[1] = x1                         # assign x1 to the first coordinate of the vector
  vec[2] = x2                         # assign x2 to the second coordinate
  cec2013(cecNo, vec)                 # execute cec function indicated by cecNo with vec vector
}