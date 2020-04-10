{
  rm(list=ls());  options(show.error.locations = TRUE);

  # install R and RStudio
  # settings on RStudio
  # RStudio Projects (??)
  # the rm() lines
  # comments
  
  # get data file
  lansingWeatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  # grab columns from the data -- show in Environment
  minTemp = lansingWeatherData$minTemp;
  maxTemp = lansingWeatherData$maxTemp;
  
  # next lesson stuff...
  cat("The number of values in the vector minTemp is", length(minTemp));
  cat("\nThe mean of minTemp is", mean(minTemp));  
  cat("\nThe variance in minTemp is", var(minTemp));  
  cat("\nThe standard deviation of minTemp is", sd(minTemp));  
  cat("\nThe maximum value of minTemp is", max(minTemp));  
  cat("\nThe 10th value of minTemp is", minTemp[10]);  
  cat("\nThe 50th value of minTemp is", minTemp[50]);  

}