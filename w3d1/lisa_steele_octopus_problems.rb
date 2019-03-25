

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#O(n^2)
#nested search
def longest_fish_nested(arr)
  swapped = true 
  while swapped 
    swapped = false 
    (0...arr.length - 1).each do |idx|
      if arr[idx].length > arr[idx + 1].length
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped = true 
      end
    end
  end
  arr.last
end

#longest_fish_nested(fishies)


#O(n log n)
#Quicksort
def longest_fish_merge_sort(arr)
    return arr if arr.length < 2
  
    mid = arr.length / 2
  
    left = arr.take(mid)
    right = arr.drop(mid + 1)
    longest_fish_merge_sort(left)
    longest_fish_merge_sort(right)
    
    merge(left, right).last 
  end

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      merged << ((left.first < right.first) ? left.shift : right.shift)
    end
    merged + left + right 
  end

# longest_fish_merge_sort(fishies)


#O(n)
#Linear search
def longest_fish_linear(arr)
  longest = ""
  arr.each do |el|
    if el.length > longest.length 
      longest = el
    end
  end
  longest
end

# p longest_fish_linear(fishies)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.index(direction)
end

# slow_dance("up", tiles_array)
# slow_dance("right-down", tiles_array)

new_tiles_data_structure = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7}

def fast_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)