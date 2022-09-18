# Youtube Upload Count
# You are given an array of dates in the format Dec 11 and a month in the format Dec as arguments.
# Each date represents a video that was uploaded on that day. Return the number of uploads for a given month.

# Examples
# upload_count(["Sept 22", "Sept 21", "Oct 15"], "Sept") ➞ 2
# upload_count(["Sept 22", "Sept 21", "Oct 15"], "Oct") ➞ 1
=begin
verify with the interviewer (Is this correct?)
ask clarifying questions - questions are allowed!
PEDAC
Problem
-write a method that takes 2 arguments
-1st argument is an array of dates in the format "Sept 22"
-2nd argument is a string representing date in the format "Sept"
-return the number of uploads for a given month (represented by the 2nd argument)
=end
# Examples
# upload_count(["Sept 22", "Sept 21", "Oct 15"], "Sept") == 2
# upload_count(["Sept 22", "Sept 21", "Oct 15"], "Oct") == 1
# upload_count([], "Oct") == 0
# consider edge cases!
# upload_count(["Sept 22", "Sept 21", "Oct 15", "Sept 22", "Sept 21", "Oct 15"], "oct") ➞ 0
=begin
Data Structures
input - an array, a string
output - an integer

Algorithm
-define a method with 2 arguments, an array and a string
-initialize uploads variable to an integer 0
-iterate over argument array
-each element of this array is a string, split each element "Sept 22" --> ["Sept", "22"]
-if the first element of the array is equal to the 2nd argument, e.g. arr[0] == "Sept", I am going to add 1 to uploads variable
-I will do the above for all elements of the input array
-I will return the uploads variable

Code
=end

# def upload_count(arr, str)
#   uploads = 0
#   arr.each do |date|
#     date = date.split
#     uploads += 1 if date[0] == str
#   end
#   uploads
# end
# p upload_count(["Sept 22", "Sept 21", "Oct 15"], "Sept") == 2
# p upload_count(["Sept 22", "Sept 21", "Oct 15"], "Oct") == 1
# p upload_count([], "Oct") == 0

#futher exploration
# -the case doesn't matter

def upload_count(arr, str)
  uploads = 0
  arr.each do |date|
    date = date.split
    uploads += 1 if (date[0] == str || date[0].capitalize == str )
  end
  uploads
end
p upload_count(["Sept 22", "Sept 21", "Oct 15"], "Sept") == 2
p upload_count(["Sept 22", "Sept 21", "Oct 15"], "Oct") == 1
p upload_count([], "Oct") == 0

puts ""

p upload_count(["sept 22", "Sept 21", "Oct 15"], "Sept") == 2
p upload_count(["sept 22", "sept 21", "oct 15"], "Oct") == 1
p upload_count([], "Oct") == 0

puts ""

p upload_count(["sept 22", "Sept 21", "Oct 15"], "sept") == 2 # this will fail coz I didn't take care of the 2nd argument
p upload_count(["sept 22", "sept 21", "oct 15"], "oct") == 1
p upload_count([], "Oct") == 0

def upload_count(arr, str)
  uploads = 0
  arr.each do |date|
    date = date.split
    uploads += 1 if (date[0].downcase == str.downcase) # standardize the input
  end
  uploads
end

puts ""
p upload_count(["sept 22", "Sept 21", "Oct 15"], "sept") == 2
p upload_count(["sept 22", "sept 21", "oct 15"], "oct") == 1
p upload_count([], "Oct") == 0
