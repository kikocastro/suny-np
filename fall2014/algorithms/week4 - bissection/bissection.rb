# Implements the bisection method for finding a root of f (x) = 0
# Input: Two real numbers a and b, a < b,
# a continuous function f (x) on [a, b], f (a)f (b) < 0,
# an upper bound on the absolute error tolerance > 0,
# an upper bound on the number of iterations maxIterations
# Output: An approximate (or exact) value x of a root in (a, b)
# or an interval bracketing the root if the iteration number limit is reached

def f(x)
  Math.sin(x)
end

def bisection(a,b,tolerance,maxIterations)
  n = 0

  while n < maxIterations do
    x = (a + b)/2.0
    return x if (x - a).abs < tolerance
    functionValue = f(x)
    return x if functionValue == 0

    if functionValue * f(a) < 0
      b = x
    else
      a = x
    end
    n += 1
  end
end

estimatedPi = bisection(2, 4, 0.0000001, 1000).round(9)
puts "Real Value:       #{ Math::PI.round(9) } "
puts "Estimatedd Value: #{ estimatedPi } "
puts "The error begins at the 8th decimal place, accordingly to the expected by the tolerance"
puts "Error: #{ (Math::PI.round(9) - estimatedPi).abs.round(9) } < tolerance = 1.0e-7"
