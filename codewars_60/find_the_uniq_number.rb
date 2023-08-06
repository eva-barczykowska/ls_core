# There is an array with some numbers. All numbers are equal except for one. Try to find it!
# It’s guaranteed that array contains at least 3 numbers.
#
# The tests contain some very huge arrays, so think about performance.
# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
#
# -iterate over the array, and find a number that is different than the previous one

def find_uniq(array)
  array.tally.each do |k, v|
    return k if v == 1
  end
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

puts
def find_uniq(arr)
  arr.uniq.min_by { |number| arr.count(number) }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

puts
def find_uniq(arr)
  arr.uniq.find { |n| arr.count(n) == 1 }
end
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55