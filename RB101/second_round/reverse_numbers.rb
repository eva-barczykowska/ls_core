# def reverse!(arr)
#   arr[0], arr[1], arr[2], arr[3] = arr[-1], arr[-2], arr[-3], arr[-4] not good coz doesn't mutate the array
# end

def reverse!(arr)
  arr.size
end


p list = [1, 2, 3, 4]
p list.object_id
p result = reverse!(list)
p result.object_id
p result #== [4, 3, 2, 1] # true
p list #== [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
