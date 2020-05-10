{
  rm(list=ls());  options(show.error.locations = TRUE);

  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         header=TRUE,
                         stringsAsFactors = FALSE);
  
  # script that contains the conversion functions
  source("scripts/temperatureFunctions.r");

  # Fahrenheit to Celsius conversions
  fTemp1 = 20;
  fTemp2 = 70
  cTemp1 = (5/9)*(fTemp1-32); 
  cTemp2 = (5/9)*(fTemp2-32); 
  fTempVec = weatherData$avgTemp;
  cTempVec = (5/9)*(fTempVec-32); 
  
  # Fahrenheit to Celsius conversions using convert1()
  temp1_1 = convert1(fTemp=50);
  temp1_2 = convert1(fTemp=86);
  temp1_3 = convert1(fTemp=weatherData$avgTemp);
  
  
  # Fahrenheit to Celsius using convert2()
  temp2_1 = convert2(temp=86, toCelsius = TRUE);
  temp2_2 = convert2(temp=weatherData$avgTemp);  # toCelsius is assumed to be TRUE 
  temp2_3 = convert2(temp=c(14,32,50,68,86), toCelsius = TRUE);

  # Celsius to Fahrenheit using convert2()
  temp2_4 = convert2(temp=-15, toCelsius = FALSE);
  temp2_5 = convert2(temp=15, toCelsius = FALSE);  
  temp2_6 = convert2(temp=c(0, 10, 20, 30, 40), toCelsius = FALSE);
  
  # Celsius - Fahrenheit - Kelvin conversions using convert3()
  temp3_1 = convert3(temp=20, unitFrom = "C", unitTo = "F");
  temp3_2 = convert3(temp=20, unitFrom = "C", unitTo = "K");
  temp3_3 = convert3(temp=20, unitFrom = "K", unitTo = "F");
  temp3_4 = convert3(temp=20, unitFrom = "K", unitTo = "C");
  temp3_5 = convert3(temp=20, unitFrom = "F", unitTo = "C");
  temp3_6 = convert3(temp=20, unitFrom = "F", unitTo = "K");
  temp3_7 = convert3(temp=20, unitFrom = "H", unitTo = "F");  # error in unit
 
  
  # Celsius - Fahrenheit - Kelvin conversions using convert4() 
  temp4_1 = convert4(temp=20,unitFrom = "cel", unitTo = "fahr");
  temp4_2 = convert4(temp=20,unitFrom = "CEL", unitTo = "KEL");
  temp4_3 = convert4(temp=20,unitFrom = "Kelvin", unitTo = "Fahrenheit");
  temp4_4 = convert4(temp=20,unitFrom = "k", unitTo = "c");
  # it does not matter what you put after the first character...
  temp4_5 = convert4(temp=20,unitFrom = "F6zxq", unitTo = "Cmqp56");  
  temp4_6 = convert4(temp=20,unitFrom = "ff", unitTo = "kk");  # same
  temp4_7 = convert4(temp=20,unitFrom = "H", unitTo = "F");
  temp4_8 = convert4(temp=20,unitFrom = "F", unitTo = "F");   # same unit - no conversion
}