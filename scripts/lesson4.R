{
  rm(list=ls());  options(show.error.locations = TRUE);

  lansingWeatherData = read.csv(file="data/LansingNOAA2016.csv", 
                                header=TRUE,
                                stringsAsFactors = FALSE);
  
  tempConvert = function(temp, convertTo, convertFrom)
  {
    if(convertTo == "c" || convertTo == "Celsius" || convertTo == "celsius")
    {
     convertTo = "C" 
    }
    if(convertTo == "c" || convertTo == "Celsius" || convertTo == "celsius")
    {
      convertTo = "C" 
    }
    
    if(convertFrom == "C" && convertTo == "F")
    {
      
    }
    else if(convertFrom == "C" && convertTo == "K")
    {
      
    }
    else if(convertFrom == "F" && convertTo == "C")
    {
      
    }  
    else if(convertFrom == "F" && convertTo == "K")
    {
      
    }
    else if(convertFrom == "K" && convertTo == "C")
    {
      
    }
    else if(convertFrom == "K" && convertTo == "c")
    {
      
    }
    else
    {
      
    }
    return(convertedTemp);
  }
}