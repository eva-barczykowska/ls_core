=begin
19. Title Case
(https://www.codewars.com/kata/5202ef17a402dd033c000009)
6 kyu
A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.
PEDAC TEMPLATE

************** Problem **************
-write a method that makes all words of the title capitalized BUT
-the method also takes a list of words which shouldn't be capitalized
-any of these words from the list should not be capitalized except when
 they are in the first position/they start the title
-there could be no list, and then all the words in the title have to be capitalized -how do know that there is no list?
Questions:

************** Examples **************
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
-> a is down-cased but has to be capitalized coz it starts the title
-> of is downcase and has to be downcase so nothing changes

p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
->maybe first downcase the title totally?
->
p title_case('the quick brown fox') == 'The Quick Brown Fox'

************** Data Structures **************
input: 2 strings, the title and the list of minor words separated by space

middle: arrays

output: a 'proper' title so all words capitalized with the exception of the words in the list BUT if a word from the list is the first word in the title - it has to be capitalized

************** Algorithm **************
-declare the `final title` variable
-downcase and divide exceptions into an array or words,
-downcase the string, divide title into array of words - this way we unify the case of both arguments we work with
-the exceptions argument in my method should default to an empty string in case I don't have exceptions - nice trick codewars!
-iterate thought the title array and capitalize each word if it is not in the list of exceptions
-join into a string, capitalize it and return it

-what if there is no exception list???
************** Code **************
=end
def title_case(title, exceptions='')
  final_title = []
  exceptions = exceptions.downcase.split
  title = title.downcase.split

  title.map do |word|
    if exceptions.include?(word)
      final_title << word
    else
      final_title << word.capitalize
    end
  end
  first_letter = final_title.first.capitalize
  final_title[0] = first_letter
  final_title.join(" ")

end
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'


