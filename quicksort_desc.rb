# Sorting an array in descending order

class QuickSort
  def sort(keys)
    quick(keys, 0, keys.size-1)
  end

  private

  def quick(keys, left, right)
    if left < right
      pivot = partition(keys, left, right)
      quick(keys, left, pivot-1)
      quick(keys, pivot+1, right)
    end
    keys
  end

  def partition(keys, left, right)
    x = keys[right]
    i = left-1
    for j in left..right-1
      if keys[j] >= x  # this version sorts an array in descending order
        i+= 1
        keys[i], keys[j] = keys[j], keys[i]
      end
    end
      keys[i+1], keys[right] = keys[right], keys [i+1]
      i+1
    end
  end

# example to test the sort
  arr = [4, 14, 0, 7, 99, 105, 42, 55, 39, 21, 154, 210, 19]
  sorter = QuickSort.new
  puts sorter.sort(arr)