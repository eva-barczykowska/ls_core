# 1. How would you delete just the first occurrence of a character?
# find_all.with_index

a = ['a', 'b', 'd', 'a']
target = []

a.each_with_index { |ch, i| target << i if ch == 'a'}

p target

puts
# OR
a = ['a', 'b', 'd', 'a']
target = []
a.find_all.with_index { |ch, i| target << i if ch == 'a'}
p target

# 2. next and break are keywords, next skips the rest of the current iteration and moves on to the next one,
# break is used to exit loop prematurely. Both return the expression that was passed to them, just like in the example
# below

counter = 0
loop do
  break if counter == 9

  counter += 1

  if counter == 5
    next p 'hello' # next returns the expression passed to it so in this case 5 isn't printed but str "hello" is
  end

  puts counter
end

puts

# when to use next? E.g. if I want to transform some elements but not all of them, some of them I want to skip
a = ['a', 'b', 'd', 'a']

target = a.map do |ch|
  next if ch == 'a'

  ch * 5
end

p target

puts

# 3. Methods like .first, .last, .take, .drop create a SHALLOW COPY of the object so when we call destructive methods
# on that copy, the change will reflect also in the caller:

a = ['first', 'second', 'third']

removed = a.last(2)
p removed                       # ['second', 'third' ]

removed[-1] << '-last'          # we used the last element of the array created with .last on line 55 but it's shared
                                # between `a` removed`

p removed                       # ['second', 'third'-last']
p a                             # ["first", "second", "third-last"]

# Same with first/take/drop
puts
bikes = ['ducati', 'yamaha', 'harley-davidson', 'royal einfield']
i_want = bikes.first(3)

p i_want

i_want[2] << 's'
p i_want
p bikes

puts

fruit = ['apple', 'pear', 'guava']
taken = fruit.take(2)
p taken

taken[0] << ' juice'

p taken
p fruit
