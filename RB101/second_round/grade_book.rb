=begin
Question:
Grade book
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter  Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60  'F'
Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: Three separate integers
Output: String representing the letter grade based off the average of the three input integers
Rules:
  Explicit Requirements
  - Need to average the three input integers
  - Average integer result is used to determine the 'grade'
  - All values will be from 0 to 100, no need to account for anything below 0 or above 100
  - Return the letter

  Implicit Requirements

-----------------------
Examples:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

-----------------------
Data Structure: An array to work with the input integers to find the average
Algorithm:
- Define `get_grade` with params `int1`, `int2`, and `int3`
- Initialize `scores` to the three integer inputs as an array
- Initialize `average` to the result of summing the integers,
  then dividing the result by 3 to obtain the average
- Determine the string/grade score based on the average
- Implicitly return the letter (grade)

-----------------------
Code:
=end

def get_grade(int1, int2, int3)
  scores = int1, int2, int3
  average = scores.inject(:+) / 3

  result = case average
           when 0..60
             'F'
           when 61..70
             'D'
           when 71..80
             'C'
           when 81..90
             'B'
           else
             'A'
           end
  result
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

puts

def get_grade(a, b, c)
  scores = a, b, c
  average = scores.inject(:+) / 3

  case average
  when 0..60
    return 'F'
  when 61..70
    return'D'
  when 71..80
    return'C'
  when 81..90
    return 'B'
  else
    return'A'
 end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

puts

GRADEBOOK = { (0..60) => 'F', (61..70) => 'D', (71..80) => 'C', (81..90) => 'B', (91..100) => 'A' }
p GRADEBOOK.keys
p GRADEBOOK.values

def get_grade(a, b, c)
  grade = nil
  average = (a + b + c) / 3
  GRADEBOOK.keys.each do |range, letter|
    if range.include?(average)
      grade = GRADEBOOK[range]# why can I not return here?
    end
  end
  grade
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"
