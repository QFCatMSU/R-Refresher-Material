{
  #### 1) convertFtoC function:
  #    This function takes as input one fahrenheit value and
  #    returns the converted Celsius value
  convertFtoC = function(fTemp)
  {
    celTemp = ((5/9)*(fTemp -32));
    return(celTemp)
  }
  
  #### 2) convertFandC function:
  #    This function takes as input one temperature value and
  #    a Boolean values that gives which direction the conversion
  #    goes (default is F -> C).  
  #    The function returns the converted temperature  
  convertFandC = function(temp, toCelsius=TRUE)
  {
    if(toCelsius == TRUE)
    {
      convertedTemp = ((5/9)*(temp -32));
    }
    else
    {
      convertedTemp = (( (9/5)*temp + 32 ));
    }
    return(convertedTemp);
  }
  
  #### 3) convertFCK function:
  #    This function takes as input one temperature value and
  #    two strings values that give the conversion units (Fahrenheit,
  #    Celsius, and Kelvin.  
  #    The function returns the converted temperature   
  convertFCK = function(temp, convertFrom, convertTo)
  {
    if(convertFrom == "C" && convertTo == "F")
    {
      convertedTemp = (( (9/5)*temp + 32 ));
    }
    else if(convertFrom == "C" && convertTo == "K")
    {
      convertedTemp = convertedTemp + 273;
    }
    else if(convertFrom == "F" && convertTo == "C")
    {
      convertedTemp = ((5/9)*(temp -32));
    }
    else if(convertFrom == "F" && convertTo == "K")
    {
      convertedTemp = ((5/9)*( (temp+273) - 32));
    }
    else if(convertFrom == "K" && convertTo == "C")
    {
      convertedTemp = convertedTemp - 273;
    }
    else if(convertFrom == "K" && convertTo == "F")
    {
      convertedTemp = (( (9/5)*(temp-273) + 32 ));
    }
    else # some error occurred
    {
      convertedTemp = NA;
    } 
    return(convertedTemp);
  }
  
  
  #### 4) convertFCK2 function:
  #    This function is the same as the previous except that it
  #    checks the first letter of the input
  convertFCK2 = function(temp, convertFrom, convertTo)
  {
    from = substr(convertFrom, start=1, stop=1);
    to = substr(convertTo, start=1, stop=1);
    from = toupper(from);
    to = toupper(to);
    
    # assume they get the first letter right...
    if(from == "C" && to == "F")
    {
      convertedTemp = (( (9/5)*temp + 32 ));
    }
    else if(from == "C" && to == "K")
    {
      convertedTemp = convertedTemp + 273;
    }
    else if(from == "F" && to == "C")
    {
      convertedTemp = ((5/9)*(temp -32));
    }
    else if(from == "F" && to == "K")
    {
      convertedTemp = ((5/9)*( (temp+273) - 32));
    }
    else if(from == "K" && to == "C")
    {
      convertedTemp = convertedTemp - 273;
    }
    else if(from == "K" && to == "F")
    {
      convertedTemp = (( (9/5)*(temp-273) + 32 ));
    }
    else # some error occurred
    {
      convertedTemp = NA;
    } 
    return(convertedTemp);
  }
  
}