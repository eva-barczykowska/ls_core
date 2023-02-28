=begin
34. Sherlock on pockets
(https://www.codewars.com/kata/53bb1201392478fefc000746)
6 kyu
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
PEDAC TEMPLATE

************** Problem **************
-write a method that will find suspects
-`pockets` array represents what people have in their pockets
-the method takes as an argument pockets and array of numbers
-array of numbers - these are the items that are allowed

Questions:

************** Examples **************
p find_suspects(pockets, [1, 2]) == [:tom, :jane]
pockets = { bob: [1],tom: [2, 5],jane: [7] } -> this is what they have in their pockets
[1, 2] -> what they are allowed to have

p find_suspects(pockets, [1, 7, 5, 2]) == nil
pockets = { bob: [1],tom: [2, 5],jane: [7] } -> this is what they have in their pockets
[1, 7, 5, 2] -> what they are allowed to have

p find_suspects(pockets, []) == [:bob, :tom, :jane]
pockets = { bob: [1],tom: [2, 5],jane: [7] } -> this is what they have in their pockets
[] -> what they are allowed to have

p find_suspects(pockets, [7]) == [:bob, :tom]
pockets = { bob: [1],tom: [2, 5],jane: [7] } -> this is what they have in their pockets
[7] -> what they are allowed to have

************** Data Structures **************
input: 2 arguments,  a hash and an array

************** Algorithm **************
-if no suspects are found/if there are no people who have illegal items in their pockects -- return nil
-if there are no pockets, pockets == nil, method returns nil
-else iterate the people's pockets and check if any item in the pocket is illegal - how (I've got only array of legal items)?

p pockets.values.flatten.select { |item| !allowed.include?(item) }

-once I've found items that are illegal, I need to check WHO has those items = how?

-initialize a counter that is the first item from the array of illegal items, counter = illegal_values[0]
-initialize suspects array

-start a loop
-iterate through pockets, now you have access to each key and value
-if the value for the key that you're currently looking at has the first item from the illegal array,
-add this key to the suspects array
-now increase the counter to look if you can find in the same way the second element from the illegal items array
-keep doing this until you've checked every item
-now you can break from the loop becasue you've checked for every item in the illegal items array

-return suspects array

************** Code **************
=end
puts "Mine:"
pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

def find_suspects(pockets, allowed_items)
  suspects = []
  illegal_items = pockets.values.flatten.select { |item| !allowed_items.include?(item) } # find if there are illegal items first
  return nil if illegal_items.empty? || pockets.empty?

  counter = 0
  loop do # I have to loop here because I need to look for EVERY element, which is illegally held
    pockets.each do |k, _|
      suspects << k if pockets[k].include?(illegal_items[counter]) # will check first for 5 (tom) and then for 7 (jane)  suspects << k if pockets[k].include?(5)
    end
    counter += 1
    break if counter > illegal_items.size
  end

  suspects.uniq
end

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

puts
puts "Kim's:"
# Kim's
pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

def find_suspects(pockets, array)
  return nil if pockets.all? {|name, subarr| subarr == nil || subarr.empty?} # added to pass CW
  selected_pairs = pockets.select do |name, value_subarr|
    value_subarr.any? do |int|
      !array.include?(int)
    end
  end

  return nil if selected_pairs.keys == []
  selected_pairs.keys
end

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

puts
puts "From codewars:"

# solution from codewars
pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |person, items|
    suspects << person unless (items - allowed_items).empty? # add the person to the suspects array if they have something that is not allowed
  end
  suspects.empty? ? nil : suspects
end

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

puts
p [7] - [1, 2] # checking their items - allowed items,  a fantastic way to fish out and compare arrays
p [2, 5] - [1, 2]
