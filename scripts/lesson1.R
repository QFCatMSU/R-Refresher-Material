{
  rm(list=ls());  options(show.error.locations = TRUE);
  library(package="ggplot2");

  # get data file -- everything after the # is treated as a comment
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         header=TRUE,
                         stringsAsFactors = FALSE);
  
  # grab columns from the data -- show in Environment Window
  minTemp = weatherData$minTemp;
  maxTemp = weatherData$maxTemp;
  avgHum = mean(weatherData$relHum);
  
  # outputting values to Console Window
  cat("The number of values in the vector minTemp is", length(minTemp));
  cat("\nThe mean of minTemp is", mean(minTemp));  
  cat("\nThe variance in minTemp is", var(minTemp));  
  cat("\nThe standard deviation of minTemp is", sd(minTemp));  
  cat("\nThe maximum value of minTemp is", max(minTemp));  
  cat("\nThe 10th value of minTemp is", minTemp[10]);  
  cat("\nThe 50th value of minTemp is", minTemp[50]);  

  # Histogram of Humidity for the year -- sent to Plot Window
  plot1 = ggplot(data=weatherData) +
    geom_histogram(mapping=aes(x=relHum) ) +
    theme_bw() +
    labs(title = "Humidity Histogram",
         x = "Humidity (%)",
         y = "Count");
  plot(plot1);
  
  # You can save this plot as an Image by clickinh on the Export tab (shown in lesson 3)
}