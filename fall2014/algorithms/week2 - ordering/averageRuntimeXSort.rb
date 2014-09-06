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
  
  unless size == 1
    pass = 1
    swap = true
    
    while (pass <= size - 1 && swap) do
      swap = false
      
      0.upto(size - 1 - pass) do |i|
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
  
  1.upto(size - 1) do |i|
    temp = list[i]
    j = i - 1
    
    while j >= 0 && list[j] > temp do
      list[j+1] = list[j]
      j -= 1
    end 
    list[j + 1] = temp
  end
  p list
end
