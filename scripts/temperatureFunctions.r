{
  #### function convert1()
  # Input: ftemp -- a Fahrenheit temperature
  # Output: celTemp -- a Celsius Tempertaure
  #    This function takes a Fahrenheit value and
  #    converts in into a Celsius value
  convert1 = function(fTemp)
  {
    celTemp = (5/9)*(fTemp-32);
    return(celTemp)
  }
  
  #### function convert2()
  # Inputs:temp -- a temperature value
  #        toCelsius -- a Boolean value which determine the conversion
  # Output: convertedTemp -- the value of the converted temperature
  #    This function takes a temperature value and a Boolean values.  The function
  #    converts the temperature from F to C if toCelsius is TRUE and converts
  #    converts the temperature from C to F if toCelsius is FALSE
  convert2 = function(temp, toCelsius=TRUE)
  {
    if(toCelsius == TRUE)
    {
      convertedTemp = (5/9)*(temp-32);
    }
    else  # if(toCelsius == FALSE)
    {
      convertedTemp = ((9/5)*temp+32);
    }
    return(convertedTemp);
  }
  
  #### function convert3()
  # Inputs:temp -- a temperature value
  #        unitFrom -- the unit for the input temperature value
  #        unitTo -- the unit for the return temperature value
  #    This function takes a temperature value and converts it from
  #    the unitFrom to the unitTo value.  The possible units are
  #    Fahrenheit, Celsius, and Kelvin
  convert3 = function(temp, unitFrom, unitTo)
  {
    if(unitFrom == "C" && unitTo == "F")
    {
      convertedTemp = ((9/5)*temp + 32);
    }
    else if(unitFrom == "C" && unitTo == "K")
    {
      convertedTemp = temp + 273;
    }
    else if(unitFrom == "F" && unitTo == "C")
    {
      convertedTemp = (5/9)*(temp -32);
    }
    else if(unitFrom == "F" && unitTo == "K")
    {
      convertedTemp = (5/9)*((temp+273)-32);
    }
    else if(unitFrom == "K" && unitTo == "C")
    {
      convertedTemp = temp - 273;
    }
    else if(unitFrom == "K" && unitTo == "F")
    {
      convertedTemp = ((9/5)*(temp-273)+32);
    }
    else # some error occurred
    {
      convertedTemp = NA;
    } 
    return(convertedTemp);
  }
  
  
  #### function convert4()
  # Inputs:temp -- a temperature value
  #        unitFrom -- the unit for the input temperature value
  #        unitTo -- the unit for the return temeprature value
  #    This function takes a temperature value and converts it from
  #    the unitFrom to the unitTo value.  The possible units are
  #    Fahrenhiet, Celsius, and Kelvin.
  convert4 = function(temp, unitFrom, unitTo)
  {
    # get the first character in the units 
    from = substr(unitFrom, start=1, stop=1);
    to = substr(unitTo, start=1, stop=1);
    
    # convert the first character to uppercase 
    #   (it will do nothing if the character is already uppercase)
    from = toupper(from);
    to = toupper(to);
    
    if(from == "C" && to == "F")
    {
      convertedTemp = ((9/5)*temp + 32);
    }
    else if(from == "C" && to == "K")
    {
      convertedTemp = temp + 273;
    }
    else if(from == "F" && to == "C")
    {
      convertedTemp = (5/9)*(temp -32);
    }
    else if(from == "F" && to == "K")
    {
      convertedTemp = (5/9)*((temp+273)-32);
    }
    else if(from == "K" && to == "C")
    {
      convertedTemp = temp - 273;
    }
    else if(from == "K" && to == "F")
    {
      convertedTemp = ((9/5)*(temp-273)+32);
    }
    else if(from == to) 
    {
      convertedTemp = temp;
    }
    else # some error occurred
    {
      convertedTemp = NA;
    } 
    return(convertedTemp);
  }
  
}