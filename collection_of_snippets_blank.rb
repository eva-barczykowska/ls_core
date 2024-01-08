## Code Snippets to analyze

###### For all the snippets describe what is happening with specific focus on return values, expected output and the concept demonstrated. Be particular about using clear and accurate language.

```ruby
#1.
2 <=> 1
1 <=> 2
2 <=> 2

'b' <=> 'a'
'a' <=> 'b'
'a' <=> 'a'

1 <=> 'a'
```
```ruby
#2.
'a' <=> 'b'
'apple' <=> 'ape'
'cat' <=> 'catty'

words = %w(card soap knife crab soapy coin sand king kill)
words.sort

```

```ruby
#.3
def remove_evens!(arr)
  cloned_arr = arr.dup # making a clone with .dup
  cloned_arr.each do |num| # performing action on the first array, will the changes reflect in both?
    if num % 2 == 0
      arr.delete(num) # iterating over the cloned array but deleting from the ORIGINAL ARRAY!!!
    end
  end
  arr # yes coz elements are SHARED. We're using .dup not to mess up the argument array since we're deleting during iterating
end

```

```ruby
#4.
array = ['a', 'b', 'c', 'd', 'e']

array.each do |letter|
  letter.upcase!
end

p array
```

```ruby
#5.
names = ["george", "bobbi", "joel", "susan"]
names = names.each do |name| # not changed because each returns its caller
          name.capitalize
        end
        
p names
```

```ruby
#6.
names = ["george", "bobbi", "joel", "susan"]
names.each do |name|
  puts name.capitalize
end

p names
```

```ruby
#7.
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

```ruby
#8.
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

```ruby
#9.
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

```ruby
#10.
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |element, index| # element gets printed as an array!
  puts "The index of #{element} is #{index}."
end
```

```ruby
#11.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

```ruby
#12.
snowy_owl = {
  "type"=>"Bird",
  "diet"=>"Carnivore",
  "life_span"=>"10 years"
}

snowy_owl.select do |key, value|
  key == "type"
end
```

```ruby
#13.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b.map! { |word| word.upcase }

p arr_a
p arr_b
```

```ruby
#14.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b[1].upcase!
p arr_a
p arr_b
```

```ruby
#15.
arr_a = %w(ant bat cat)
arr_b = arr_a.dup

arr_b.map! { |word| word.upcase! }

p arr_a
p arr_b
```

```ruby
#16.
['dog', 'cat', 'pig'].sort_by do |word|
  word[1]
end
```

```ruby
#17.
[[2, 4], [2, 1, 4], [0, 1, 2], [3, 2, 0], [0, 1], [3, 2, 5]].sort
```

```ruby
#18.
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|  
  array << pair.last
end
```

```ruby
#19.
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|   
  hash[value] = key
end
```

```ruby
#20.
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
```

```ruby
#21.
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
```

```ruby
#22.
a = [1, 2, 3]

a.map { |x| puts x**2 }
```

```ruby
#23.
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

```ruby
#24.
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

```ruby
#25.
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

```ruby
#26.
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
```

```ruby
#27.
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

```ruby
#28.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end
```

```ruby
#29.
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

```ruby
#30.
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

```ruby
#31.
experiment = [["???", "!!!", "?!?!"], ["select_me!", "please_select_me?", "how about_me?"], ["what does it mean to be a string?", 'true']]
  
experiment2 = experiment.each do |array|
  array.map { |string| string.include?('?') }
end

p experiment
p experiment2

```

```ruby
#32.
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end

```

```ruby
#33
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array

```

```ruby
#34.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1 
  puts n # what gets output here? careful!
end
p new_array


```

```ruby
#35.
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array

```

```ruby
#36.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented

```

```ruby
#37.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array

```

```ruby
#38.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array

```

```ruby
#39.
a = "hello"

[1, 2, 3].map { |num| a }

```

```ruby
#40.
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

```

```ruby
#41.
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

```

```ruby
#42.
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

```

```ruby
#43.
['ant', 'bear', 'caterpillar'].pop.size

```

```ruby
#44.
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

```

```ruby
#45.
arr = [1, 2, 3, 4, 5]
arr.take(2)

```
```ruby
#46.
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

```

```ruby
#47.
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

```

```ruby
#48.
[123, 432, 543, 642, 543, 256].sort_by do |num|
  num.digits.first
end

```

```ruby
#49.
contacts = {
  Jenny: '230-867-5309',
  Skylar: '432-555-5555',
  joe: '230-432-1234',
  Jimmy: '123-123-1234'
}

contacts.sort_by do |_, number|
  number.split('-')[0]
end

```

```ruby
#50.
contacts = {
  Jenny: '230-867-5309',
  Skylar: '432-555-5555',
  joe: '230-432-1234',
  Jimmy: '123-123-1234'
}

contacts.sort_by do |name, _|
  name.capitalize
end

```

```ruby
#51.
hash = { chris: '510-204-5555', sam: '510-909-5526',
adrienne: '650-433-2112' }

hash.sort_by do |name, number|
  p name.length * number.split('-')[2][0].to_i
end

```

```ruby
#52.
words = %w(cantaloupe apple durian bananas)

# default uses <=> to compare collection elements
words.min                               
words.min(2)                             

# with a block
words.min { |a, b| a.size <=> b.size }   
words.min(2) { |a, b| a.size <=> b.size } 

```

```ruby
#53.
words = %w(cantaloupe apple durian)

# sort by amount of vowels
words.min_by { |word| word.count("aeiou") }

words.min_by(2) { |word| word.count("aeiou") }

```

```ruby
#54.
def add_one_to(nums) 
  0.upto(nums.length) do |i| # -1 error
    nums[i] += 1 
  end 
  nums 
end 

numbers = [0, 1, 2, 3, 4] 

p add_one_to(numbers) 
p numbers

```

```ruby
#55.
def test(b) 
  b.map {|letter| "I like the letter: #{letter}"} 
end 

a = ['a', 'b', 'c'] 
test(a)

```

```ruby
#56.
[1, 2, 3].reject do |num|
  puts num > 2
end

```

```ruby
#57.
{ a: "ant", b: "bear", c: "cat" }.include?("ant")

```

```ruby
#58.
{ flour: '1c', sugar: '.5c', eggs: 2 }.first(2)

```

