=begin
Write a method partlist that gives all the ways to divide a list (an array) of at least two elements into two non-empty parts.
 
Each two non empty parts will be in an an array: see Examples test Cases
Each part will be in a string
Elements of a pair must be in the same order as in the original array.
 
P: 
-method returns all the posible ways to divide an array of at least 2 elements into 2
non empty parts

E:
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto", "picaro zone kiwi"], , ["az toto picaro zone", "kiwi"]]
["az", "toto", "picaro", "zone", "kiwi"] =>

["az", *"toto picaro zone kiwi"] 1-4
["az toto", *"picaro zone kiwi"] 2-3
["az toto picaro", *"zone kiwi"] 2-2
["az toto picaro zone",* "kiwi"] 3-1

Idea1
Could iterate over the string as many times as its size and each time slice the string on the consecutive space. Save the 2 parts of each time the input string is sliced.

Idea2
Change to array and each time divide this array into 1-3, 2-2, 3-1 so each time taking 1 more word from the first part of the array an each time taking 1 more less word from the second part.

Idea3
Make a dup array and each time mutate the copy by shifting more elements and saving both shifted and the rest of the elements to `result`

A:
-init `result`
-make copy of str
-split it
-init counter 1
-in a loop shift counter, and save to `result` as an string(join on a space)
-in the same array save copy, joined on a space
-flatten/remove nesting because these will be nested arrays

-increase the counter
-break when counter > arr.size -1
=end
# arr = ["az", "toto", "picaro", "zone", "kiwi"]
# p arr

def partlist(array)
  result = []

  counter = 1
  loop do
    copy = array.dup
    result << [copy.shift(counter).join(" "), copy.join(" ")].flatten
    counter += 1
    break if counter > array.size - 1
  end

  result
end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto","picaro zone kiwi"], ["az toto picaro","zone kiwi"], ["az toto picaro zone", "kiwi"]]

puts
puts "same but more clear"

def partlist(array)
  result = []

  counter = 1
  loop do
    copy = array.dup
    first_string = copy.shift(counter).join(" ")
    p first_string

    second_string = copy.join(" ")
    p second_string
    result << [first_string, second_string] # no need to flatten like above
    counter += 1
    break if counter > array.size - 1
  end

  result
end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto","picaro zone kiwi"], ["az toto picaro","zone kiwi"], ["az toto picaro zone", "kiwi"]]

puts
=begin
Write a method partlist that gives all the ways to divide a list (an array) of at least two elements into two non-empty parts.
 
Each two non empty parts will be in an an array: see Examples test Cases
Each part will be in a string
Elements of a pair must be in the same order as in the original array.
 
P:
-method takes an array of strings
-method that gives all the ways to divide an array
-array has at least 2 elements
-into 2 non-empty parts
-each part is a string
-elements must be in the same order as in the original array
-return array will have arrays or pairs, which indicate the way to divide
 
E:
a = ["az", "toto", "picaro", "zone", "kiwi"] ==
[["az", "toto picaro zone kiwi"] => 1 string separately, all others together as 1 string - 4 words
["az toto", "picaro zone kiwi"], => 2 string separately, all others together as 1 string - 3 words
["az toto picaro", "zone kiwi"], => 3 string separately, all others together as 1 string - 2 words
["az toto picaro zone", "kiwi"]] => 4 string separately, all others together as 1 string - 1 words
 
4
1, 2, 3, 4
 
N:
p a = ["az", "toto", "picaro", "zone", "kiwi"][0..2].join(" ")
 
A:
-initialize `result`
 
-gradually add to result arrays of pairs of strings:
-first string gets gradually longer, second string gets gradually shorter:
 -initialize a counter 0
 -initialize `start` at 0
  -initialize `finish` at 0
 
 -start a loop
 
 -initialize temp to which you append:
  --a range from the arg array
  --ALWAYS start at 0, end at 0 (only fist word), end changes, we will start at 0 and increase immediately after
  --join - you have the first string of 2, add this first string to `temp`
  --increase `first_counter` --you have first array, join the array and add the resulting string to `temp`
  --start at `finish`, end at -1, join and add, you have second string for the `temp` array
  --start is now
 
  --a range from the arg array
  --start at 0, end at 1(`finish`) (only fist word)
  --join - you have the SECOND array of 2
  --increase `finish` --you have first array, after add it to `result`
 
p ["az", "toto", "picaro", "zone", "kiwi"][0..0]
p ["az", "toto", "picaro", "zone", "kiwi"][1..-1]
def partlist(arr)
=end

def artlist(arr)
   result = []
   
    start_second = 0 #changes! increases
   
   loop do
     temp = []
     temp << arr[0..start_second].join(" ") #get first string, save to array
      start_second += 1

     temp << arr[start_second..-1].join(" ") #get second string, save to array
      result << temp #append temp array to `result` array
    break if start_second >= arr.size - 1
   end
   result
end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto","picaro zone kiwi"], ["az toto picaro","zone kiwi"], ["az toto picaro zone", "kiwi"]]

puts
def partlist(arr)
   (1...arr.size).map { |i| [arr.take(i).join(' '), arr.drop(i).join(' ')] }
end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto", "picaro zone kiwi"], ["az toto picaro", "zone kiwi"], ["az toto picaro zone", "kiwi"]]

puts
def partlist(arr)
  arr[0...-1].map.with_index { |_, i| [arr[0..i].join(" "), arr[i+1..-1].join(" ")] }
end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto", "picaro zone kiwi"], ["az toto picaro","zone kiwi"], ["az toto picaro zone", "kiwi"]]
    
#I like this one:
def partlist(arr)
  result = []
  (1...arr.length).each do |i|
    part1 = arr[0...i].join(' ') #define each part separately and join it
    part2 = arr[i..-1].join(' ') 
      result << [part1, part2] # append both strings as an array, sweet!
  end
  result
  end
p partlist(["az", "toto", "picaro", "zone", "kiwi"]) == [["az", "toto picaro zone kiwi"], ["az toto","picaro zone kiwi"], ["az toto picaro","zone kiwi"], ["az toto picaro zone", "kiwi"]]

puts
puts "earlier solution"
