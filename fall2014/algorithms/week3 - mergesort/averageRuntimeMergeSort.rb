class Array
  def swap!(i,j)
    self[i], self[j] = self[j], self[i]
    self
  end
end

def generateRandomPermutation(n)
  sequence = []
  
  n.times do |i|
    sequence[i] = i
  end
  
  (n - 1).downto(1) do | index |
    randomIndex = rand(1..index)
    sequence.swap!(index, randomIndex) 
  end
  
  sequence
end
def mergeSort(list)
  return list if list.size <= 1
  middle = list.size / 2
  left  = list[0, middle]
  right = list[middle, list.size-middle]
  merge(mergeSort(left), mergeSort(right))
end
 
def merge(left, right)
  temp = []
  @comparisonsCounter = 0
  until left.empty? or right.empty?
    @comparisonsCounter += 1
    if left.first <= right.first
      temp << left.shift
    else
      temp << right.shift
    end
  end
  temp.concat(left).concat(right)
end

def estimateAverageRuntime(xSort)
  averages = []
  (1000..20000).step(100) do |n|
    total = 0
    
    50.times do |i|
      randomList = generateRandomPermutation(n)
      send(xSort, randomList)
      total += @comparisonsCounter
    end
    averageComparisons = total.to_f/30
    averages << [ n, averageComparisons ]
    p n
  end
  averages
end

def prepareResultsToBeExported(results)
  preparedResults = []
  results.each do |result|
    n = result[0]
    average = result[1].to_f
    preparedResults <<  [ n, average, average/n, average/(n*n), average/(n*Math.log2(n))]
  end
  preparedResults
end

def exportCsv(preparedResults, fileName)
  require 'csv'
  
  CSV.open("#{fileName}.csv", "w") do |csv|
    csv << ["n", "av", "av/n", "av/n^2", "av/nlogn"]
    preparedResults.each do | result |
      csv << result
    end
  end
end

def mainCall 
  begin
    mergeSortAverages = estimateAverageRuntime("mergeSort")
    mergeSortResults = prepareResultsToBeExported(mergeSortAverages)
    exportCsv(mergeSortResults, "mergeSort")
    p "Done"
  rescue
    p "Error"
  end
end

mainCall()
