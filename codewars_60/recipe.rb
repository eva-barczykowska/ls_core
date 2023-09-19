=begin
pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you
help him to find out, how many cakes he could bake considering his recipes?
Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the
maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or
200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.
Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});
P:
-the method takes 2 args, recipe and ingredients
-based on the recipe, find out how many cakes can be made
-no ingredient in ingredients means it's a 0 amount

E
# 200 - 5000  = 25
# 300 - 20000 = 66
# 150 - 1700 = 11 --- min is what we need
# 100 - 20000 = 200
# 100 - 30000 = 300

A:
-check if all ingredients are present,
-if not, return 0

else
-compare ingriedients and amounts, take the smallest number and return it -HOW?
 - iterate over the recipe hash
 - retrieve the value for each ingredient from the ingredients hash and
   divide the value from ingredients by the value from recipe
  - store the results for each value pair in an array

- return the min from that array
=end

def cakes(recipe, ingredients)
  result = []

  if !recipe.keys.all? { |k| ingredients.include?(k) }
    return 0
  else
    recipe.each do |k, v|
      if ingredients.include?(k)
        result << ingredients[k] / recipe[k]
      end
    end
  end

  result.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1}, {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2

p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0

p cakes({"eggs"=>4, "flour"=>400},{}) == 0

p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1