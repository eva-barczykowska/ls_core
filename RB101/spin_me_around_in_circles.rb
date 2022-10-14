=begin
Spin Me Around In Circles
You are given a method named spin_me that takes a string as an argument
and returns a string that contains the same words, but with each word's characters reversed.
Given the method's implementation, will the returned string be the same object
as the one passed in as an argument or a different object?
=end

str = "hello world"
# p "hello world".equal?(str)

p "before we pass this str as an argument:"
p str.object_id # object_id 60

def spin_me(str)
  p "inside the method:"
  p str.object_id # object_id 60
  str.split.each { |word| word.reverse! }.join(" ")
end

puts ""
p spin_me(str).object_id # object_id 80
# p str.object_id

puts ""
# we get different objects, already after calling the #split method within the method, we have a different object

# we can check it like this
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = 'hello world'
puts str.object_id # 47435609148580
puts spin_me(str).object_id # 47435609148360

puts ""

puts "passing array as an argument will mutate the object in place"

puts ""

# BUT
# However, if we rework this method to use an array argument instead of a string
# and we reversed each word in it by calling the same methods, then the array
# that was passed in as an argument and the array that was returned from the method
# would be the same object. Again, we can test this.

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
puts spin_me(arr).object_id # 47264354160220 -- same object_id!
