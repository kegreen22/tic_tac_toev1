# Reverse an array using unshift
def array_reverse(input)
  reversed_array = []
  input.each do |i|
      reversed_array.unshift(i)
  end
  p reversed_array
end

test = [12, 8, 14, 15, 27, 48, 13, 0]
p test
array_reverse(test)


# Reverse an array using insert at position 0 (the beginning of the array)
def arr_reversal(input)
  arr = []
  input.each do |i|
    arr.insert(0, i)
  end
  p arr
end

testing_arr = [12, 8, 14, 15, 27, 48, 13, 0]
p testing_arr
arr_reversal(testing_arr)


# A completely manual approach to array reversal
def reversal(input)
    reversed_arr = []
    i = input.length-1
    while i > -1
    reversed_arr << input[i]
    i-=1
  end
p reversed_arr
end

test_arr = [12, 8, 14, 15, 27, 48, 13, 0]
p test_arr
reversal(test_arr)