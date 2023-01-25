=begin
Question:
Name Swapping
Write a method that takes a first name, a space, and a last name passed
as a single String argument, and returns a string that contains
the last name, a comma, a space, and the first name.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String object consisting of a first and last name
Output: New string object with name flipped and separated by a comma and space
Rules:
  Explicit Requirements
  - Return a string with the name flipped with a comma and space as a separator

  Implicit Requirements

-----------------------
Examples:
swap_name('Joe Roberts') == 'Roberts, Joe'

-----------------------
Data Structure: Array to store name to flip and add comma/space
Algorithm:
- Define `swap_name` with param `str`
- Separate string at empty space (to get first and last) and add them to an array to create a 2 element array.
- Flip (reverse) the two elements to move last name to first index position
- Convert array elements back into a string with a comma and space as the seperator
- Implicitly return the result

-----------------------
Code:
=end

def swap_name(str)
  str.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
