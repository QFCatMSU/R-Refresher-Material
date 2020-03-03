{
  lansingWeatherData = read.csv(file="data/LansingNOAA2016.csv", header=TRUE,
                                stringsAsFactors = FALSE);
  
  minTemp = lansingWeatherData$minTemp;
  maxTemp = lansingWeatherData$maxTemp;
  
  cat("The number of values in the vector minTemp is", length(minTemp));
  cat("\nThe mean of minTemp is", mean(minTemp));  
  cat("\nThe variance in minTemp is", var(minTemp));  
  cat("\nThe standard deviation of minTemp is", sd(minTemp));  
  cat("\nThe maximum value of minTemp is", max(minTemp));  
  
  
  differenceInTemp = maxTemp - minTemp;
  
  lansingWeatherData$diffTemp = differenceInTemp;
  
  write.csv(lansingWeatherData, file="data/LansingNOAA2016-2.csv");
  
  lansingWeather2 = read.csv(file="data/LansingNOAA2016-2.csv", header=TRUE,
                             stringsAsFactors = FALSE);
}