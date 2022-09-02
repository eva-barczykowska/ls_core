=begin

Grade book
Write a method that determines the mean (average) of the three scores passed to it,
and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

PEDAC
Problem
-write a method that calculates the average from 3 passed numbers
-and then returns a grade associated with that average score

Examples
get_grade(95, 90, 93) == "A" # 95 + 90 + 93 = 188 and 278 / 3 = 92
get_grade(50, 50, 95) == "D" # 50 + 50 + 95 = 195 and 195 / 3 = 65

Data structures
-input: 3 integers
-output: a string

Code
-calculate the average by adding the 3 integers and dividing the sum by 3
-save the result to a variable called score
-ask if that variable is in the range(between lower number and higher)
-and return the respective grade
-can use case statement or if statement

Code
=end
def get_grade(a, b, c)
  score = (a + b + c) / 3
  if score.between?(90, 100)
    return	'A'
  elsif score.between?(80, 89)
    return 'B'
  elsif score.between?(70, 79)
    return 'C'
  elsif score.between?(60, 69)
    return 'D'
  else score.between?(0, 59)
  return	'F'
  end
end

p get_grade(95, 90, 93) == "A" # 95 + 90 + 93 = 188 and 278 / 3 = 92
p get_grade(50, 50, 95) == "D" # 50 + 50 + 95 = 195 and 195 / 3 = 65

puts ""

#try the same but with the case statement
def get_grade(a, b, c)
  score = (a + b + c) / 3

  case score
  when 90..100
    return	'A'
  when 80..89
    return 'B'
  when 70..79
    return 'C'
  when 60..69
    return 'D'
  when 0..59
    return	'F'
  end

end

p get_grade(95, 90, 93) == "A" # 95 + 90 + 93 = 188 and 278 / 3 = 92
p get_grade(50, 50, 95) == "D" # 50 + 50 + 95 = 195 and 195 / 3 = 65

puts ""

def get_grade(a, b, c)
  score = (a + b + c) / 3

  case score
  when 90..100
    'A'
  when 80..89
    'B'
  when 70..79
    'C'
  when 60..69
    'D'
  when 0..59
    'F'
  end

end

p get_grade(95, 90, 93) == "A" # 95 + 90 + 93 = 188 and 278 / 3 = 92
p get_grade(50, 50, 95) == "D" # 50 + 50 + 95 = 195 and 195 / 3 = 65

# ls solution

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

puts ""

# futher exploration
# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?
puts "further exploration"

def get_grade(*grades)
  score = grades.sum / grades.size
  if score > 101
    'A+'
  else
    case score
    when 90..100
      return	'A'
    when 80..89
      return 'B'
    when 70..79
      return 'C'
    when 60..69
      return 'D'
    when 0..59
      return	'F'
    end
  end
end

p get_grade(95, 90, 93) == "A" # 95 + 90 + 93 = 188 and 278 / 3 = 92
p get_grade(50, 50, 95) == "D" # 50 + 50 + 95 = 195 and 195 / 3 = 65
p get_grade(50, 50, 95, 222) == "A+"

puts ""
# other solutions
# yes, keys in a hash can also be ranges
def get_grade(score1, score2, score3)
  grade_scores = {
    101..   => 'A+',
    90..100 => 'A',
    80...90 => 'B',
    70...80 => 'C',
    60...70 => 'D',
    0...60  => 'F'
  }

  score = [score1, score2, score3].sum / 3

  grade_scores.each do |k, v|
    return v if k.include? score
  end
end

p get_grade(100, 100, 100) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(50, 150, 195) == "A+"
