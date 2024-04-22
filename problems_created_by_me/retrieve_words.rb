#  This method returns an array of unique words returned from string passed as an argument.
# Solve it with or without the loop.
#
# A:
# -replace all letters with a space
def get_words(string)
  string.gsub(/[^A-Za-z]/, ' ').split
end
p get_words('Ruby3.32') == ['Ruby']
p get_words('abc1234abc') == %w[abc abc]
p get_words('11abc1!23abd') == %w[abc abd]
p get_words('hello world!') == %w[hello world]
p get_words('1 2 3 4') == []
p get_words('12demo7fig24test1678!') == %w[demo fig test]

# solve with a loop
# ITERATE with counter
#--if current char belongs to alphabet, add it to the temp
#--if not, add temp to words array but you need to iterate 1 character out of bounds so that the last char is included

lower = *('a'..'z')
upper = *('A'..'Z')
ALPHABET = lower + upper

# RETURN accummucated array
def get_words(str)
  words = []
  counter = 0
  temp = ''

  while counter <= str.size
    if ALPHABET.include?(str[counter])
      temp += str[counter]
    else
      words << temp unless temp.empty?
      temp = ''
    end
    counter += 1
  end

  words
end
p get_words('Ruby3.32') == ['Ruby'] # at the last iteration counter is 7, which is not less than str.size, which is 8
p get_words('abc1234abc') == %w[abc abc]
p get_words('11abc1!23abd') == %w[abc abd]
p get_words('hello world!') == %w[hello world]
p get_words('1 2 3 4') == []
p get_words('12demo7fig24test1678!') == %w[demo fig test]
