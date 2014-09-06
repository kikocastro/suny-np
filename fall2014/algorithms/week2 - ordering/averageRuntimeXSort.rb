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

def bSort(list)
  size = list.length
  @comparisonsCounter = 0
  
  unless size == 1
    pass = 1
    swap = true
    
    while (pass <= size - 1 && swap) do
      swap = false
      
      0.upto(size - 1 - pass) do |i|
        @comparisonsCounter += 1
        if list[i] > list[i+1] 
          list.swap!(i, i+1)
          swap = true
        end
      end
      
      pass += 1
    end
  end
  list
end

def insertionSort(list)
  size = list.length
  @comparisonsCounter = 0
  
  1.upto(size - 1) do |i|
    temp = list[i]
    j = i - 1
    
    while j >= 0 && list[j] > temp do
      @comparisonsCounter += 1
      list[j+1] = list[j]
      j -= 1
    end 

    list[j + 1] = temp
  end
  list
end

def estimateAverageRuntime(xSort)
  averages = []
  (1..100).each do |n|
    total = 0
    
    3.times do |i|
      randomList = generateRandomPermutation(n)
      send(xSort, randomList)
      total += @comparisonsCounter
    end
    averageComparisons = total.to_f/3
    averages << [ n, averageComparisons ]
  end
  averages
end

def printAverageRuntimeTable(xSort)
  results = estimateAverageRuntime(xSort)
  puts xSort
  puts "   n           av       av/n      av/n^2  av/nlogn    "

  results.each do |result|
    n = result[0]
    average = result[1].to_f
    printf "%7d   %10.2f  %8.4f  %8.4f  %8.5f" %
     [ n, average, average/n, average/(n*n), average/(n*Math.log2(n))]
    puts " " 
  end 
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
    ["bSort", "insertionSort"].each do |xSort|
      xSortAverages = estimateAverageRuntime(xSort)
      xSortResults = prepareResultsToBeExported(xSortAverages)
      exportCsv(xSortResults, xSort.to_s)
    end
  rescue
    p "Error"
  end
end

mainCall()