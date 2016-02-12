def merge_sort(arr)
  if arr.length <=1
    arr
  else   # Recursive case. First, divide the array into equal-sized sublists consisting of the even and odd-indexed elements.
    mid = (lst.length / 2).floor
    left = merge_sort(lst[0..mid - 1])
    right = merge_sort(lst[mid..lst.length])
    merge(left, right)
  end
end




def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end

# example to test the sort
array_test = [1, 5,3, 4, 6,3, 12, 24,17, 99, 102, 34]
puts merge_sort(array_test)