{
  rm(list=ls());  options(show.error.locations = TRUE);
  
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  # 1) Simple for loops
  cat("The first 10 powers of 2 are: ");
  for(i in 1:10)
  {
     cat(2^i, " ");  # output the power of 2 to the Console with a space
  }
  
  cat("\nThe first 10 values in the wind peak speed column:\n");
  for(i in 1:10)
  {
    cat(weatherData$windPeakSpeed[i], " ");  
  }  
  
  cat("\nThe max temp every tenth date from day 100 to day 200: \n");
  for(i in seq(from=100, to=200, by=10))
  {
    cat(weatherData$date[i], ": ", weatherData$maxTemp[i], "\n");  
  }  
  
  #### Iterate through the 365 precip values (for loop)
  
  ### 2) First: check how many days had rain and did not have rain
  daysWithRain = 0;
  daysWithoutRain = 0;
  for(i in 1:(nrow(weatherData)-1))   # check every day except the last day
  {
    if(weatherData$precip[i] != "0")  # precip not "0"
    {
      daysWithRain = daysWithRain +1;
    }
    else # precip is "0"
    {
      daysWithoutRain = daysWithoutRain +1;
    }
  }
  

  ### 2) First: check how many days had rain and did not have rain
  rain_rain = 0;     # rain followed by rain
  rain_noRain = 0;   # rain followed by no rain
  noRain_rain = 0;   # no rain followed by rain
  noRain_noRain = 0; # no rain followed by no rain
  
  # go through every day EXCEPT the last (because there is no day after the last)
  for(i in 1:(nrow(weatherData)-1))
  {
    if(weatherData$precip[i] != "0")     # days with rain
    {
      if(weatherData$precip[i+1] != "0") # rain next day 
      {
        rain_rain = rain_rain + 1;
      }
      else                               # no rain next day
      {
        rain_noRain = rain_noRain + 1;
      }
    }
    else                                 # days without rain
    {
      if(weatherData$precip[i+1] != "0") # rain next day 
      {
        noRain_rain = noRain_rain + 1;
      }
      else                               # no rain next day
      {
        noRain_noRain = noRain_noRain + 1;
      }
    }
  }

  # create a matrix with 2 rows and 2 columns
  countMatrix = matrix(nrow=2, ncol=2);

  # populate the four cells of the matrix with the rain count values
  countMatrix[1,1] = rain_rain;
  countMatrix[1,2] = rain_noRain;
  countMatrix[2,1] = noRain_rain;
  countMatrix[2,2] = noRain_noRain;
  
  # label each row and column
  rownames(countMatrix) = c("rain(i)", "no rain(i)");  
  colnames(countMatrix) = c("rain(i+1)", "no rain(i+1)");
  
  # create a probability matrix from the count matrix
  probMatrix = countMatrix/sum(countMatrix);
}