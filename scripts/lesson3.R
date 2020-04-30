{
  rm(list=ls());  options(show.error.locations = TRUE);
  
  library(package="ggplot2");
  
  weatherData = read.csv(file="data/LansingNOAA2016-3.csv", 
                         header=TRUE,
                         stringsAsFactors = FALSE);
  
  #### Save four columns from the data frame to vectors
  precip = weatherData$precip;
  date = weatherData$date;
  humidity = weatherData$relHum;
  weatherCond = weatherData$weatherType;

  ### create a copy of precip2 
  precip2 = precip;
  
  # Finding the "T" values in precip2, the days the had a trace of rain 
  traceIndex = which(precip2 == "T"); 
  precip2[traceIndex] = 0.005;   # give a numeric value for "T"
  precip3 = as.numeric(precip2);  # change precip2 to a numeric vector 

  # indexing between vectors
  heavyRainIndex = which(precip3 > 1);
  heavyRainDates = date[heavyRainIndex];
  heavyRainHum = humidity[heavyRainIndex];

  #### Scatterplot of humidity vs. precipitation with regression line  
  plot1 = ggplot() +
    geom_point(mapping=aes(x=precip3, y=humidity)) +
    theme_bw() +
    labs(title = "Humidity vs. precipitation",
         x = "precipitation (in)",
         y = "Humidity (%)") +
    geom_smooth(mapping=aes(x=precip3, y=humidity), 
                method="lm");
  plot(plot1);
  
  #### Histogram of Humidity for the year
  plot2 = ggplot() +
    geom_histogram(mapping=aes(x=humidity) ) +
    theme_classic() +
    labs(title = "Humidity Histogram",
         x = "Humidity (%)",
         y = "Count");
  plot(plot2);

  #### Find days that have rain (two different methods)
  hasPrecip = (precip != 0);  # could have also used (precip > 0)

  #### Boxplot of humidity by rainy days
  plot3 = ggplot() +
    geom_boxplot(mapping=aes(x=hasPrecip, y=humidity) ) +
    theme_bw() +
    labs(title = "Humidity Boxplot by Precipitation",
         x = "Precipitaion (hasPrecip)",
         y = "Humidity (%)");
  plot(plot3);

  ##### Export plots 
  # You can export plots to a PDF or an image using RStudio
  # With the plot open in the Plot Window, click Export 
  #
}