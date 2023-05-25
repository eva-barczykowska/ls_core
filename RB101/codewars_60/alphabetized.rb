def alphabetized(str)
  alphabet = ("a".."z").to_a + ("A".."Z").to_a
  str.chars.each do |char|
    if !alphabet.include?(char)
      str.delete!(char)
    end
  end
  str.chars.sort { |a, b| a.downcase <=> b.downcase }.join
end

p alphabetized("The Holy Bible") #== "BbeehHilloTy"
# =>capital B comes before b
p alphabetized("!@$%^&*()_+=-`,") #== ""
# # => no alphabetical characters, hence an empty string is returned
p alphabetized("CodeWars can't Load Today") #== "aaaaCcdddeLnooorstTWy"
# =>removed apostrophe and sorted alphabetically