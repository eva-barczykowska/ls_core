=begin
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

PEDAC:
P:
-write a method that returns an integer, how many cakes can Pete bake considering the ingredients he has
-the method takes 2 arguments, recipe and ingredients, both hashes
-ingredients not present can be considered as 0


Examples:
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}) == 2
=> 2
=> 1200/500 - 2, 1200/200 = 6, 5/1 = 1
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}) == 0
=> I don't have ALL ingredients I should have

DS:
input: 2 hashes
middle? hash/array
output: integer

A:
-return 0 if the second hash/ingredients don't have all the keys that recipes has

-take all the keys that are present in recipe and ingredients and divide the values from ingredients by the values in recipe

-take the minimum number of all the numbers and return it

=end

def cakes(recipe, ingredients)
  return 0 unless recipe.keys.all? { |key| ingredients.include?(key) }

  results = []

  recipe.each do |key, value|
    results << ingredients[key] / value
  end

  results.min
end


p cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}) == 2

p cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}) == 0

