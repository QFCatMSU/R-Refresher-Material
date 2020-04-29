{
  
  rm(list=ls());  options(show.error.locations = TRUE);
  
  lansingWeatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  # 1) Probability matrix: How much precipitation one day predicts precipitation the next day
  probMat = matrix(nrow=2, ncol=2, data =0);
  
  #### Iterate through all 366 precip values (for loop)
  
  ### 2) First: check how many days had rain
  daysWithRain = 0;
  for(i in 1:nrow(lansingWeatherData))
  {
    if(lansingWeatherData$precip[i] != 0)  # equivalent: !(lansin...)
    {
      daysWithRain = daysWithRain +1;
    }
  }
  
  # 3) Exclude days with trace of rain
  for(i in 1:nrow(lansingWeatherData))
  {
    # if(lansingWeatherData$precip[i] != 0  && lansingWeatherData$precip[i] != "T" )
    if(!(lansingWeatherData$precip[i] == 0  || lansingWeatherData$precip[i] == "T") )
    {
      daysWithRain = daysWithRain +1;
    }
  }
  
  # 4) IF there is rain then... 
  nextDayRain = 0;
  nextDayNoRain = 0;
  
  # What percentage of days with rain have days with rain the next day
  # -1: not checking the last day
  for(i in 1:(nrow(lansingWeatherData)))
  {
    if(lansingWeatherData$precip[i] != 0  && 
       lansingWeatherData$precip[i] != "T" )
    {
      if(lansingWeatherData$precip[i+1] != "0"  && 
         lansingWeatherData$precip[i+1] != "T" )
      {
        nextDayRain = nextDayRain + 1;
      }
      else
      {
        nextDayNoRain = nextDayNoRain + 1;
      }
    }
  } 
  
  ## Above would populate the bottom row of matrix
  # 5) Populate the whole matrix
  
  ### talk about prob matrix:
  #
  #             same day
  # 
  #
  #
  for(i in 1:(nrow(lansingWeatherData)-1))
  {
    if(lansingWeatherData$precip[i] != 0  && 
       lansingWeatherData$precip[i] != "T" )
    {
      if(lansingWeatherData$precip[i+1] != "0"  && 
         lansingWeatherData$precip[i+1] != "T" )
      {
        probMat[1,1] = probMat[1,1] +1;
      }
      else
      {
        probMat[1,2] = probMat[1,2] +1;
      }
    }
    else
    {
      if(lansingWeatherData$precip[i+1] != "0"  && 
         lansingWeatherData$precip[i+1] != "T" )
      {
        probMat[2,1] = probMat[2,1] +1;
      }
      else
      {
        probMat[2,2] = probMat[2,2] +1;
      }
    }
  }
  
  probMatPercent = probMat/sum(probMat);

}