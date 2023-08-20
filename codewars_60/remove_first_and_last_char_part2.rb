# P
# I have a string of chars separated by comma
# write a method that returns a new_str containing the same sequcne except the first and last chars AND
# chars are sparated by spaces

# -if str.empty or after removing first and last item it would be empty, return an empty value, nil

# A:
# return nil if str.empty or str.size <=2
# else
# build a new string
# split str on the comma
# convert to array and extract chars from index 1 to -2
# iterate from char at index 1 to char at index - 2
# add char and space to new_str
#
# if new_str is an empty str, return nil
# else remove the last char that is space
# join the array on space?
def array(str)
  return nil if str.chars.empty? || str.chars.size <= 2

  new_str = []

  str_to_process = str.split(",")
  str_to_process = str_to_process[1..-2]

  str_to_process.each do |char|
    new_str << char
  end

  return nil if new_str.empty?
  new_str.join(" ").rstrip
end
p array('1,2,3') #== '2'
p array('1,2,3,4') #== '2 3'
p array('1,2,3,4,5') #== '2 3 4'
