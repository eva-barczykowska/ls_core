=begin
Lettercase Counter
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

PEDAC
Problem
-write a method that takes a string
-the method returns hash
-the hash has 3 entries:
* the number of characters in the str that are lowercase letters
* the number of characters in the str that are uppercase letters
* the number of characters in the str that are neither (e.g. like a space)


Examples
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

Data structures
  input: -a string
  output: - a hash with 3 keys and values

Algorithm
-initialize a result hash with 3 keys: lowercase, uppercase and neither, the value for each of them will be 0
-look a the string and answer the questions
-1. how many lowercase characters I have? when I have this answer, update the hash the value
-2. how many uppercase characters I have? when I have this answer, update the hash the value
-3. how many non-letter characters I have? when I have this answer, update the hash the value

- return the hash

Code
=end

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

puts ""

def letter_case_count(str)
  result = { lowercase: 0, uppercase: 0, neither: 0}
  result[:lowercase] = str.scan(/[a-z]/).count
  result[:uppercase] = str.scan(/[A-Z]/).count
  result[:neither] = str.scan(/[^a-zA-Z]/).count
  return result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

# ls solution

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

# other solutions
def letter_case_count(string)
  string_array = string.chars
  result = { lowercase: 0, uppercase: 0, neither: 0 }

  string_array.each do |character|
    ascii_value = character.ord # very interesting to think about it like that

    case ascii_value
    when 65..90
      result[:uppercase] += 1
    when 97..122
      result[:lowercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

def letter_case_count(string)
  hash = Hash.new(0)

  hash[:lowercase] = string.count "a-z"
  hash[:uppercase] = string.count "A-Z"
  hash[:neither] = string.count "^A-Z" "^a-z"

  hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

def letter_case_count(string)
  {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^A-z')
  }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

def letter_case_count(str)
  count_hashula = Hash.new

  count_hashula[:lowercase] = str.scan(/[a-z]/).count
  count_hashula[:uppercase] = str.scan(/[A-Z]/).count
  count_hashula[:neither] = str.scan(/[^a-zA-Z]/).count

  count_hashula
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

# very clever!
CASE = {
  lowercase: /[a-z]/,
  uppercase: /[A-Z]/,
  neither: /[^a-zA-Z]/
}

def letter_case_count(str)
  hsh = Hash.new(0)
  CASE.each { |k, v| hsh[k] = str.scan(v).count }
  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts ""

LOWERCASE = /[a-z]/
UPPERCASE = /[A-Z]/

def letter_case_count(string)
  counts = %i(lowercase uppercase neither).zip([0, 0, 0]).to_h

  string.chars.each do |char|
    case char
    when /[a-z]/ then counts[:lowercase] += 1
    when /[A-Z]/ then counts[:uppercase] += 1
    else counts[:neither] += 1
    end
  end

  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
