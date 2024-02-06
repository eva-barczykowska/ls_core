def move_zeros(arr)
  arr.sort_by { |n| n == 0 ? 1 : 0 }
end

p move_zeros([1,2,0,1,0,1,0,3,0,1]) == [1,2,1,1,3,1,0,0,0,0]