# - first pass comments
## - second pass comments


def prime_factors number, factors=[] # solving for 21

  # given line 25/33, number may eventually equal one
  # since a number divided by itself is 1, aka prime
  return factors if number == 1 

  # starting from 2, finds the next factor in a range
  # from 2 to the number we are finding factors for
  # in this case, next factor is the prime # 3
  next_factor = (2..number).find do |possible_factor| # the first factor found will be prime
    number % possible_factor == 0
  end

  # save the factor, 3
  factors << next_factor
  ## the second time through, 7 gets put here too

  #finds the opposing factor ie: 21= 3 * 7
  # our method will find 3, next attemp will be
  # to factor down 7, if we can
  next_attempt = number / next_factor
  ## 7/7 is 1; we will hit our base case at the
  ## beginning of our 3rd time through

  # we pass in our collection of factors, 
  # if it is prime, we will return the factors
  # array which we have been collecting 
  # throughout the stack
  prime_factors( next_attempt , factors ) 
end

p prime_factors 21


