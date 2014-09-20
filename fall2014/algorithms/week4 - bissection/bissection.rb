# Implements the bisection method for finding a root of f (x) = 0
# Input: Two real numbers a and b, a < b,
# a continuous function f (x) on [a, b], f (a)f (b) < 0,
# an upper bound on the absolute error tolerance > 0,
# an upper bound on the number of iterations maxIterations
# Output: An approximate (or exact) value x of a root in (a, b)
# or an interval bracketing the root if the iteration number limit is reached

def sin(x)
  Math.sin(x)
end

def bisection(a,b,tolerance,maxIterations)
  n = 1

  while n < maxIterations do
    x = (a + b)/2
p n
    return x if (x - a).abs < tolerance
    functionValue = sin(x)
    return x if functionValue < 0

    if functionValue * sin(a) < 0
      p 'oi1'
      b = x
    else
      p 'oi2'
      a = x
    end
    n += 1
  end
end

bisection(3, 4, 0.00000001, 1000)