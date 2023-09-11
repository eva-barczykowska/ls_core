=begin
Google is launching a network of autonomous pizza delivery drones and wants you to create a flexible rewards system
(Pizza Points™) that can be tweaked in the future. The rules are simple: if a customer has made at least N orders of
at least Y price, they get a FREE pizza!

Create a function that takes a dictionary of customers, a minimum number of orders and a minimum order price.
Return a list of customers that are eligible for a free pizza.

P:
- create a method that takes a hash and two integers as an argument
- hash represents the customers: key is name and value is an array with numbers of orders (array size) and price of
each order (value of each element)
- 1st integer: minimum number of orders
- 2nd integer: minimum order price
- return an array with names of customers that meet the requirements for a free pizza, sort in alphabetical order

customers = {
  "Batman": [22, 30, 11, 17, 15, 52, 27, 12],
  "Spider-Man": [5, 17, 30, 33, 40, 22, 26, 10, 11, 45]
}

  pizza_points(customers, 5, 20) ➞ ["Spider-Man"]

  pizza_points(customers, 3, 10) ➞ ["Batman", "Spider-Man"]

  pizza_points(customers, 5, 100) ➞ []

  Sort the returned array of customer names in alphabetical order.

  DS:
  - return a sorted array

  ALgo:
  - initialize a storage array
  - iterate through the input hash
    - count the items in the value array that are >= 2nd integer input
    - if count is >= 1st integer input, add the key to the storage array
  - sort the storage array in alphabetical order
  - return storage array
=end

def pizza_points(hash, num1, num2)
  output = []

  hash.each do |key, value|
    output << key.to_s if value.count { |order| order >= num2 } >= num1
  end

  output.sort
end


customers = {
  "Batman": [22, 30, 11, 17, 15, 52, 27, 12],
  "Spider-Man": [5, 17, 30, 33, 40, 22, 26, 10, 11, 45]
}

p pizza_points(customers, 5, 20) == ["Spider-Man"]

p pizza_points(customers, 3, 10) == ["Batman", "Spider-Man"]

p pizza_points(customers, 5, 100) == []
