{
  rm(list=ls());                        # clear the Environment
  options(show.error.locations = TRUE); # show line numbers on error
  
  # get weather data from csv file and save to data frame weatherData
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  # Save the max and min temperatures to vectors
  highTemps = weatherData$maxTemp;
  lowTemps = weatherData$minTemp;
  
  # We can subset the values within a vector
  subset1 = highTemps[50];          # single value 
  subset2 = highTemps[c(3,56,198)]; # multiple values 
  subset3 = highTemps[4:13];        # sequence of values (4 through 13)

  # Get the highest-high and lowest-low temperatures
  maxHighTemp = max(highTemps);
  minLowTemp = min(lowTemps); 
  
  # Two different ways to find the mean high temperature
  meanHighTemp1 = sum(highTemps)/ length(highTemps);
  meanHighTemp2 = mean(highTemps);
  
  # Find the median high temperature
  medianHighTemp = median(highTemps);

  # get the standard deviation and variance of highTemps:
  sdHighTemps = sd(highTemps);
  varHighTemps = var(highTemps); 

  # save a single quantile value
  q67HighTemp = quantile(highTemps, probs=0.67);
  
  # make a copy of the weatherData data frame
  weatherData2 = weatherData;    
  
  # save the difference in temperatures to a new vector
  changeInTemp = highTemps - lowTemps;  

  # add the difference in temp column to the copied data frame
  weatherData2$changeTemp = changeInTemp; 
  
  # write the new data frame to a new CSV file
  write.csv(weatherData2, file="data/LansingNOAA2016-2.csv",
            row.names = FALSE);
}