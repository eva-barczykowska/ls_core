=begin
Google is launching a network of autonomous pizza delivery drones and wants you to create
a flexible rewards system (Pizza Points™) that can be tweaked in the future.
The rules are simple: if a customer has made at least N orders of at least Y price, they get a FREE pizza!

Create a function that takes a dictionary of customers, a minimum number of orders and a minimum order price.
Return a list of customers that are eligible for a free pizza.

Sort the returned array of customer names in alphabetical order.

customers = {
  "Batman": [22, 30, 11, 17, 15, 52, 27, 12],
  "Spider-Man": [5, 17, 30, 33, 40, 22, 26, 10, 11, 45]
}

  pizza_points(customers, 5, 20) == ["Spider-Man"]

  pizza_points(customers, 3, 10) == ["Batman", "Spider-Man"]

  pizza_points(customers, 5, 100) == []

P:
- out of the hsh argument, return the list of customers who are eligible for a free pizza, in alphabetical order

- the hsh argument contains key-value pairs: customers and their orders

- my method takes that hsh as an argument plus 2 other arguments, orders and price

- if a given customer make n orders of at least y price, he is eligible for a free pizza

Examples:
customers = {
  "Batman": [22, 30, 11, 17, 15, 52, 27, 12],
  "Spider-Man": [5, 17, 30, 33, 40, 22, 26, 10, 11, 45]
}

  pizza_points(customers, 5, 20) == ["Spider-Man"]
- Spiderman is eligible because he made more than 5 orders of price 20 (30, 33, 50, 22, 26, 45)

  pizza_points(customers, 3, 10) == ["Batman", "Spider-Man"]
- Batman and Spiderman are eligible/are returned because
- Batman made more than 3 orders of value 10 (22, 30, 11, 17, 15, 52, 27, 12)
- Spiderman made more than 3 orders of value 10 (17, 30, 33, 40, 22, 26, 10, 11, 45)

  pizza_points(customers, 5, 100) == []
- both customers placed 5 orders or more but none of those orders were more than 100

DS:
- input: hsh, n - orders, y - price
- output: an array of eligible customers who made at last n orders of y price

A:
- if a hsh is empty, return []

-initialize `eligible_customers` array

- iterate over the hsh values
- check which customers made at least n orders which are of y price

- populate the `eligible_customers` array with the names of the customers who fullfill this above requirement

- sort the names alphabetically

- return the array of `eligible_customers`
=end

customers = {
  "Spider-Man": [5, 17, 30, 33, 40, 22, 26, 10, 11, 45],
  "Batman": [22, 30, 11, 17, 15, 52, 27, 12]
}

def pizza_points(hsh, n, y)
  return [] if hsh.empty?

  eligible = []

  hsh.each { |customer, orders| eligible << customer.to_s if orders.count { |order_value| order_value >= y } >= n }

  eligible.sort
end
p pizza_points(customers, 5, 20) == ["Spider-Man"]
p pizza_points(customers, 3, 10) == ["Batman", "Spider-Man"]
p pizza_points(customers, 5, 100) == []