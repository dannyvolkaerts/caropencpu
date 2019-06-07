car <- function(input){
  library(mgcv)
  #input can either be csv file or data	
  newdata <- if(is.character(input) && file.exists(input)){
    read.csv(input)
  } else {
    as.data.frame(input)
  }
  stopifnot("speed" %in% names(newdata))
  
  newdata$speed <- as.numeric(newdata$speed)
  
  #tv_model is included with the package
  newdata$dist <- predict.gam(car_model, newdata = newdata)
  return(newdata)
}
