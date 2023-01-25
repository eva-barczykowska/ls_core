# sort_by receives just one object(as opposed to .sort which receives 2),
# and you have to call a method
# that will be used to map over the collection.

matrix = [
  [1, 2, 3, 4, 5, 6],
  [1, 2, 3],
  [1, 2, 3, 4, 5],
  [:a, :b, :c, :d]
]

matrix.sort_by { |obj| obj.size }
# => [
# [1, 2, 3],
#   [:a, :b, :c, :d],
#   [1, 2, 3, 4, 5],
#   [1, 2, 3, 4, 5, 6]
# ]

puts

Person = Struct.new(:fname, :lname)

p1 = Person.new("John", "Doe")
p2 = Person.new("Jane", "Doe")
p3 = Person.new("Marry", "Mackan")
p4 = Person.new("John", "Beck")

p [p1, p2, p3, p4].sort_by { |p| [p.fname, p.lname] }
# => [
#<struct  fname="Jane", lname="Doe">,
#<struct  fname="John", lname="Beck">,
#<struct  fname="John", lname="Doe">,
#<struct  fname="Marry", lname="Mackan">
# ]
#
# without a block, sort_by returns an enumerator

puts

my_hash = {
  name: "John",
  age: 21,
  address: "Main Str. 11",
  email: "john@example.com"
}

p my_hash.sort_by { |k, _| k }
# => [[:address, "Main Str. 11"], [:age, 21], [:email, "john@example.com"], [:name, "John"]]
# the result is a 2-dimensional array, we can change it to a hash by .to_h method

puts

scores = [
  {name: "Superman", score: 745},
  {name: "Ironman", score: 9},
  {name: "Batman", score: 10}
]

p scores.sort_by { |h | h[:name] }
# => [
# {:name=>"Batman", :score=>10},
#   {:name=>"Ironman", :score=>9},
#   {:name=>"Superman", :score=>745}
# ]