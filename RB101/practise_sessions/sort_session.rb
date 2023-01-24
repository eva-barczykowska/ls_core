
music = ["10.mp3", "21.mp3", "40.mp3", "5.mp3"]
p music
# p music.sort_by {|elem| elem.to_i }

# Amy
p (music.sort_by do |element|
  new_music = element.split('.')
  new_music[0].to_i
end)

puts

# # sort can be called without arguments or with a block and 2 arguments
# because we need to tell sort what is the base for sorting, e.g. .sort { |a, b| b <=> a }

# sort_by takes a block and can sort by length for example

arr = %w( 11 2 3 444 1)
# ["11", "2", "3", "444", "1"]
p arr
# p "1111".ord # .ord of 1 will return 49, same for 11 or 111
# p "2".ord #50
p arr.sort #=> ["1", "11", "2", "3", "444"]

p ["1989", "1999", "1", "33"].sort #=> ["1", "1989", "1999", "33"]

puts

arr =  [[1, 2, 8], [1000], [44, 9], [102], [6]]

res = arr.sort_by do |subarray|
  subarray.select do |number|
  number.even? # pick up only even numbers and sort them ascending
 end  # [2, 8], [44], [102], [6], [1000]
end

p res

puts

p arr = [ 11, 2, 3, 444 ]
p arr.sort { |a, b| b <=> a }

# string#<=>
# array#<=>
# integer#<=>
# symbol#<=> just uses .to_s

# strings.sort_by(&:length)
# people.sort_by(&:age)

class Person
  attr_reader :age

  def initialize(age)
    @age = age
  end
end

ewa = Person.new(29)
kim = Person.new(28)
amy = Person.new(65)

people = [ewa, kim, amy]
p people.sort_by(&:age)


