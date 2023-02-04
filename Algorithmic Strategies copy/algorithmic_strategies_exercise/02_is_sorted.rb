# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)
#require "byebug"
def is_sorted(arr)
   # debugger
    dup = arr.dup
    sorted_arr = bubble_sort(arr)
    return true if dup == sorted_arr
    return false
end

#check pairs of elements
def bubble_sort(arr)
    sorted = false
    while sorted == false
        sorted = true
        arr.each_with_index do |ele, idx|
            if idx != 0 && ele < arr[idx-1]
                arr[idx-1], arr[idx] = arr[idx], arr[idx-1]
                sorted = false
            end
        end
    end
    return arr
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
