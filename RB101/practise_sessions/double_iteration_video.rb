puts "More complicated algorithm:"

def substrings(str)
  index = (0...str.size).to_a #=> gives me [0, 1, 2, 3, 4]
  all_slices = index.product(index) #=> gives me [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
  only_valid_slices = all_slices.reject do |start_index, end_index|
    start_index > end_index # so e.g. when we have [0, 4] and [4, 0], [4, 0] will be rejected
  end
  # so now we have an array of 15 valid/unique slices
  # [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 1], [1, 2], [1, 3], [1, 4], [2, 2], [2, 3], [2, 4], [3, 3], [3, 4], [4, 4]]

  substrings = only_valid_slices.map do |starting_index, ending_index|
    str[starting_index..ending_index] #=> so replace with characters at [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], etc. until [4,4]
  end
  substrings
end

str = "madam"
p substrings(str)

puts "***"

puts "Simpler algorithm:"
str = "madam"
       01234
"m" #---------------> str[0..0]
"ma" #--------------> str[0..1]
"mad" #-------------> str[0..2]
"mada" #------------> str[0..3]
"madam" #-----------> str[0..4]
 "a" #--------------> str[1..1]
 "ad" #-------------> str[1..2]
 "ada" #------------> str[1..3]
 "adam" #-----------> str[1..4]
  "d" #-------------> str[2..2]
  "da" #------------> str[2..3]
  "dam" #-----------> str[2..4]
   "a" #------------> str[3..3]
   "am" #-----------> str[3..4]
   "m" #------------> str[4..4]

def substrings(str)
  substrings = []
  (0...str.size).each do |start_index|
    (start_index...str.size).each do |end_index|
      sub = str[start_index..end_index]
      substrings << sub
      end
    end
  substrings #=>["a", "am", "amm", "amma", "ammad", "m", "mm", "mma", "mmad", "m", "ma", "mad", "a", "ad", "d"]
end

p substrings('ammad')
p substrings('ewa')
