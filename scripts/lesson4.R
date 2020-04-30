{
  rm(list=ls());  options(show.error.locations = TRUE);

  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         header=TRUE,
                         stringsAsFactors = FALSE);
  
  source("scripts/temperatureFunctions.r");
  
  #put function is sepearate script
  
  F1 = 40;
  C1 = ((5/9)*(F1-32));
  
  F2 = 0;
  C2 = ((5/9)*(F2-32));
  
  F3 = -10;
  C3 = ((5/9)*(F3-32));
 
  
  C4 = convertFtoC(fTemp=40);
  C5 = convertFtoC(fTemp=0);
  C6 = convertFtoC(fTemp=-10);
  
  
  T1 = convertFandC(temp=40, toCelsius = FALSE);
  T2 = convertFandC(temp=0, toCelsius = TRUE);
  T3 = convertFandC(temp=-40, toCelsius = FALSE);

  
Z1 = convertFCK2(temp=00, convertFrom="kelvin", convertTo = "fahrenheit")
Z2 = convertFCK2(temp=-170, convertFrom="celsius", convertTo = "fahrenheit")
Z3 = convertFCK2(temp=-170, convertFrom="far", convertTo = "cel")

  
  

}