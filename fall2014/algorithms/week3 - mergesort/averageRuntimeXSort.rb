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

def mergeSort(list, left, right)
  if left < right
    middle = (left + right)/2
    mergeSort(list, left, middle)
    mergeSort(list, middle + 1, right)
    merge(list, left, right)
  end
end

def merge(list, left, right)
  temp = []
  @comparisonsCounter = 0

  middle = (left + right)/2
  # p middle
  i = left
  j = middle + 1
  k = 0

  # puts "i: #{i} j: #{j}" 

  while (i <= middle && j <= right) do
    # puts "list[#{i}] #{list[i]}  list[#{j}]: #{list[j]} "
    if list[i] <= list[j]
      temp[k] = list[i]
      i += 1
    else
      temp[k] = list[j]
      j += 1
    end
    k += 1
    @comparisonsCounter += 1
  end
    p temp

  if i > middle
    j.upto(right) do |p|
      temp[k] = list[p]
      k += 1
    end
  else
    j.upto(middle) do |p|
      temp[k] = list[p]
      k +=1
    end
  end
  n = right - left + 1
  1.upto(n) { |p| list[left + p - 1] = temp[p]  }

  list
end

def estimateAverageRuntime(xSort)
  averages = []
  (1000..10000).step(100) do |n|
    total = 0
    
    30.times do |i|
      randomList = generateRandomPermutation(n)
      send(xSort, randomList)
      total += @comparisonsCounter
    end
    averageComparisons = total.to_f/30
    averages << [ n, averageComparisons ]
    printf "."
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

# def mainCall 
  # begin
      # mergeSortAverages = estimateAverageRuntime(mergeSort)
      # mergeSortResults = prepareResultsToBeExported(mergeSortAverages)
      # exportCsv(mergeSortResults, xSort.to_s)
    # end
    # p "Done"
  # rescue
    # p "Error"
  # end
# end

# mainCall()
p mergeSort([56, 28, 49, 88, 25, 13, 125, 0, -12, 3, 8, 88], 0, 11)