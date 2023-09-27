=begin
A group of friends have decided to start a secret society. The name will be the first letter of each of their names, sorted in alphabetical order.

Create a function that takes in an array of names and returns the name of the secret society.

P: - create a method that takes an array of names as an arg
 - method returns an acronym, all capital letters
 - the acronym is alphabetically sorted


 E:

 society_name(["Adam", "Sarah", "Malcolm"]) == "AMS"

society_name(["Harry", "Newt", "Luna", "Cho"]) == "CHLN"

society_name(["Phoebe", "Chandler", "Rachel", "Ross", "Monica", "Joey"]) == "CJMPRR"

N:

A:
- iterate over the arg array and transform it into first letters only

-sort alphabetically the resulting array

- join it and return it

=end
def society_name(array)
  array.map { |name| name[0] }.sort.join
end

p society_name(["Adam", "Sarah", "Malcolm"]) == "AMS"
p society_name(["Harry", "Newt", "Luna", "Cho"]) == "CHLN"
p society_name(["Phoebe", "Chandler", "Rachel", "Ross", "Monica", "Joey"]) == "CJMPRR"
