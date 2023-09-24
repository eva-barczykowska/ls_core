# Given an integer array, transform it into a mirror.
# Notes
# Do not repeat the last item of the given array.
# P:
# - write a method that takes an array as an arg
# - the method returns an array that has the argument array + the mirror
# N:
# - pop, dup
# A:
# initialize mirror to an []
# initialize a_copy of the arg array
# append a_copy to mirror
# remove arg array's last element
# reverse arg array
# append it to the mirror
# return mirror

def mirror(array)
  res = []

  copy = array.dup
  res << copy

  array.pop
  res << array.reverse

  res.flatten

end
p mirror([0, 2, 4, 6]) == [0, 2, 4, 6, 4, 2, 0]
# 0,2,4,6-4,2,0
p mirror([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5, 4, 3, 2, 1]

p mirror([3, 5, 6, 7, 8]) == [3, 5, 6, 7, 8, 7, 6, 5, 3]