=begin
25. Pete, the baker
(https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby)
5 kyu
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

Examples:

# must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

Problem:
Given a recipe and ingredients figure out how many cakes you can bake

Notes:
  2 object
    1st hash - recip
    2nd hash - available ingredients

  Track:
    Ingredients not present are considered zero
      if a recipe item is missing from the ingredients - return 0
      end
    end
  end
end

input: 2 hashash (recipe, ingredients)
output: integer max_cakes ( number of cakes able to bake)

Algorithm:
1. Selectivey reduce key-value pairs from ingredients based on what key-value paairs are in recipe
   return 0 if any keys are not present in ingredients that are in recipe
   iterate ingredients hash to determine the number of cakes by dividing current keys value by recipes key-value. Store that to max and on next iteration, if the quotient of the new ingredients is less thn the previous ingredient, reasign max.
   return max_cake

set max_cakes to 0
Selectivey reduce key-value pairs from ingredients based on what key-value paairs are in recipe
  iterate over the ingredients hash
    if recipe includes ingreient throw into return hash
return 0 if any keys are not present in ingredients that are in recipe
    make sure all the keys in recipe are included in ingredients
      iterate over keys of recipe
        if ingredients does NOT include the key then reuturn 0
iterate ingredients hash to determine the number of cakes with index
  if index is 0
    assign quotient to max_cakes
  else
  dividing current ingredient's amount by recipe's
    Store that to max if the quotient of the ingredients is less current max
return max_cakes



=end

# def cakes(recipe, ingredients)
#   max_cakes = []
#   ingredients = ingredients.select { |ingr, units| recipe.keys.include?(ingr)}
#   return 0 if recipe.keys.any? {|ingr| !ingredients.keys.include?(ingr) }
#   ingredients.each_with_index { |(ingr, units), idx| max_cakes << units / (recipe[ingr]) }
#   max_cakes.min
# end

# p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
# p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
# p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
# p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
# p cakes({"eggs"=>4, "flour"=>400},{}) == 0
# p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1


# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# PEDAC
# Problem
# -write a method that takes 2 arguments, they are arrays
# -this method returns a NEW array that contains elements from both arrays taken in alternation

# Examples
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data structures
#   input: array
#   output: an array

# Algorith
# -initialize a result array
# -take an element from first array and append to the new array
# -take an element from the second array and append to in the new array
# -do this until the 2nd array is empty
# -return the result array

# ['a', 'b', 'c'].shift

# def interleave(array1, array2)
#   result = []
#   until array2.empty?
#     result << array1.shift
#     result << array2.shift
#   end
#   result
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# PEDAC
# Problem
# -write a method that takes a string
# -the method returns hash
# -the hash has 3 entries:
# * the number of characters in the str that are lowercase letters
# * the number of characters in the str that are uppercase letters
# * the number of characters in the str that are neither (e.g. like a space)


# Examples
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data structures
#   input: -a string
#   output: - a hash with 3 keys and values

# Algorithm
# -initialize a result hash with 3 keys: lowercase, uppercase and neither, the value for each of them will be 0
# -look a the string and answer the questions
# -1. how many lowercase characters I have? when I have this answer, update the hash the value
# -2. how many uppercase characters I have? when I have this answer, update the hash the value
# -3. how many non-letter characters I have? when I have this answer, update the hash the value

# - return the hash

# Code

def letter_case_count(str)
  result = { lowercase: 0, uppercase: 0, neither: 0}
  result[:lowercase] = str.scan(/[a-z]/).count
  result[:uppercase] = str.scan(/[A-Z]/).count
  result[:neither] = str.length - result[:lowercase] - result[:uppercase]
  return result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
