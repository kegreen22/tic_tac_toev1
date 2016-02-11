def insertion_sort(arr)
 for i in 1...arr.length
  k = arr[i]
  j = i - 1
  while j >= 0 and arr[j] > k
    arr[j+1] = arr[j]
    j = j - 1
  end
  arr[j+1] = k
  p arr
end
arr

end

array_test = [1, 5,3, 4, 6,3, 12, 24,17, 99, 102, 34]
puts insertion_sort(array_test)