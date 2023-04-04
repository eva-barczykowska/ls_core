=begin
25. Pete, the baker
(https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby)
5 kyu
Pete likes to bake some cakes. He has some recipes and ingredients.
Unfortunately he is not good in maths.
Can you help him to find out, how many cakes he could bake considering his recipes?

Write a method cakes(), which takes the recipe (object) and the available ingredients (also an object)
and returns the maximum number of cakes Pete can bake (integer).
For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200).
Ingredients that are not present in the objects, can be considered as 0.

Examples:

# must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0 this example is wrong, it should return 2
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});
** first hash is cake recipe, 2nd hash is avail ingredients
return the max num of cakes that can be made
=begin pedac

*************Problem********************
Overall goal: To write a method that analyzes the recipe and the avail ingredients and returns how many cakes can be made
initial input: 2 hashes: recipe, available ingredients
overall output: integer / the max number of cakes that can be made

explicit requirements:
input hashes: no units for the amounts
              ingredients not present are considered as 0
return: integer - this is the max number of times the recipe can be made given the avail ingredients

implicit requirements:
if ingredient is not present in the available ingredients, the return value will be 0

questions:

**********Examples/Test cases************

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) # == 2
** flour can make 2 cakes, sugar can make 6 cakes, eggs can make 5 cakes. Smallest number is 2 so 2 is returned

# p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},
{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
** cream can make 1, flour can make 3, sugar can make 1, milk can make 1, oil can make 1, eggs can make 1 >> 1 is returned

# p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
** apples can make 0 because there are no apples in the ingredients, so 0 is returned
  sugar can make 3, milk can make 20, oil can make 0 because there is no oil

*************Data Structure**************
2 hashes > integer/num of cakes

***************Algorithm*****************
Overall approach:
def a method with parameters `recipe` `avail_ingredients`
given 2 hashes
return 0 if the hash keys of the recipe hash are not all included in the avail_ingredients hash
** avail_ingredients keys >> array
   iterate over the array, see if all ingredient in recipe hash are included in the avail ingredients
nested iteration using each
  avail_ingredients values / recipe values
  use integer division
  store the nums in newly init `return_array``
return the minimum value
** iterate over `return_array` use min
return value is the min value/return value of min

=end
# MY PEDAC
# -analyze examples first
#
# # first we will return 0 if ingredients list is empty
# # -then also 0 if not all ingredients are there in the list of ingredients what we have
# # -then we can go down to calculations
#
# necessary ingredients:
# {"flour"=>500, "sugar"=>200, "eggs"=>1}
#
# ingredients I have:
#  {"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200} == this will make 2 cakes
#
# -first see if any available_ingredients are empty or do not contain enough ingredients
# -then clean my available_ingredients out of those I don't need, this will make both hashes have the same size
#
# -I think I'd have to iterate over the keys and see if each of the key is a multiple of what's required and
# what multiple, like 2, 3, 4,. etc.
#
# e.g from the first example I have 1200 flour, which is more than 2 * 500 but it's not 3 so we'll settle on 2
# -this means I'm looking for the smallest number
#
# this number 2 is decisive so we're looking for the smallest multiple of (any) number in numbers - values
# -how to find this smallest number?
#
# - so divide each value from available_ingredients by each value from recipes
# - use a counter and loop through the values, dividing each from available_ingredients by recipe
# results of division save to a `result` array
# stop looping when reached the values array size, this means I've gone through all the values and can analyze them now
#
# select the smallest result of division, that's the answer

def cakes(recipe, available_products)
  return 0 unless recipe.keys.all? { |ingredient| available_products.keys.include?(ingredient) } # this takes care of no ingredients OR not all necessary ingredients

  cleaned_ingredients = available_products.select { |key, _| recipe.include?(key) } # getting rid of unnecessary ingredients
  cleaned_ingredients = cleaned_ingredients.sort_by { |k, _| k }.to_h # sorting so that the keys/values in both hashes are at the same index position
  recipe = recipe.sort_by { |k, _| k }.to_h

  result = []
  counter = 0
  loop do
    # p cleaned_ingredients.values[counter]
    # recipe.values[counter]
    result << (cleaned_ingredients.values[counter] / recipe.values[counter]) # retrieving the result of division
    counter += 1
    break if counter >= recipe.values.size
  end
  result.min # it will be the smallest number
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
