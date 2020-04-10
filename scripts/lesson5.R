{
  
  rm(list=ls());  options(show.error.locations = TRUE);
  
  lansingWeatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  dates = c();
  consecDays = 0;
  consecDaysHigh = 0;
  probMat = matrix(nrow=2, ncol=2, data =0);
  
  for(i in 1:(nrow(lansingWeatherData)-1))
  {
    if(lansingWeatherData$precip[i] != "0.00"  && 
       lansingWeatherData$precip[i] != "T" )
    {
      if(lansingWeatherData$precip[i+1] != "0.00"  && 
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
      if(lansingWeatherData$precip[i+1] != "0.00"  && 
         lansingWeatherData$precip[i+1] != "T" )
      {
        probMat[2,1] = probMat[2,1] +1;
      }
      else
      {
        probMat[2,2] = probMat[2,2] +1;
      }
    }
    # else 
    # {
    #   if(consecDays > consecDaysHigh)
    #   {
    #     consecDaysHigh = consecDays;
    #   }
    #   consecDays = 0;
    # }
    
    if(lansingWeatherData$precip[i] != "0.00"  && 
       lansingWeatherData$precip[i] != "T")
    {
       dates[length(dates)+1] = i;
       consecDays = consecDays +1;
    }
    else 
    {
      if(consecDays > consecDaysHigh)
      {
        consecDaysHigh = consecDays;
      }
      consecDays = 0;
    }
  }
  
  probMat = probMat/sum(probMat);
  ## for and powers
  # go through and find consecutive days with rain
  # find 
}