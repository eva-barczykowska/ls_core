# 13. Kebabize
# (https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)
# 6 kyu
=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters
PEDAC TEMPLATE

************** Problem **************
-write a method that takes a string in camelCase as an argument
-the method returns kebab-case
-the returned string is downcased and cleaned out of non-alhabet characters

Questions:

************** Examples **************
kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps

************** Data Structures **************
input: string in camelCase
output: string in kebab-case

************** Algorithm **************
-initialize the result array
-clean the string out of non alphabet characters
-iterate over the characters
-when I see a capital character, insert a - in front of it
-downcase the capital letter
-join and return the result

************** Code **************
=end

def kebabize(str)
  result = []

  array = str.chars.reject { |ch| ch =~ /[^A-Za-z]/ }

  array.each do |letter|
    if letter == letter.upcase
      result << "-"
      result << letter.downcase
    else
      result << letter
    end
  end

  result.join
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'