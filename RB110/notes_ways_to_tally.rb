str = 'onomatopeia'

p str.chars.tally

# => {"o"=>3, "n"=>1, "m"=>1, "a"=>2, "t"=>1, "p"=>1, "e"=>1, "i"=>1}

puts

def tally_me(str)
  letter_tally = {}

  str.chars.each do |letter|
    if letter_tally.has_key?(letter)
      letter_tally[letter] += 1
    else
      letter_tally[letter] = 1
    end
  end
  letter_tally
end

p tally_me('onomatopeia')

# => {"o"=>3, "n"=>1, "m"=>1, "a"=>2, "t"=>1, "p"=>1, "e"=>1, "i"=>1}

puts

str = 'onomatopeia'

def tally_me(str)
  str.chars.each_with_object(Hash.new(0)) do |letter, char_counts|
    char_counts[letter] += 1
  end
end

p tally_me(str)
