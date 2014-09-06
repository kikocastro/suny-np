def EuclidsAlgorithm(bigger, smaller) 
  @runtime = 1
  while smaller > 0 && smaller < bigger
    @runtime += 1
    remainder = bigger % smaller
    bigger = smaller
    smaller = remainder
  end
end    

def EstimateAverageRuntimeForEuclidsAlgorithm(bigger)
  totalRuntime = 0
  
  50.times do
    smaller = rand(bigger)
    EuclidsAlgorithm(bigger, smaller)
    totalRuntime += @runtime
  end
  
  averageRuntime = totalRuntime/50
  logAverageRuntime = Math.log(2) * averageRuntime/Math.log(bigger)
  puts "#{bigger.to_s.ljust(4)}  #{averageRuntime}  #{logAverageRuntime}"
end

(10000..20000).step(100) do |i|
  EstimateAverageRuntimeForEuclidsAlgorithm(i)
end
