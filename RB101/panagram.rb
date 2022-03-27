def panagram?(str)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  str = str.downcase
  counter = 0
  if str.size < 26
    return false
  else
    loop do
      break if counter >= alphabet.size
      current_alphabet_letter = alphabet[counter]
      if str.include?(current_alphabet_letter)
        counter += 1
      else
        return false
      end
    end
  end
  true
end

p panagram?("The quick brown fox jumps over the lazy dog.") #== true
p panagram?("This is not a pangram.") #== false
p panagram?("Two driven jocks help fax my big quiz.") #== true
p panagram?("Say I will just type as I speak so it is a long string") #== false

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def panagram?(str)
  clean_str = str.delete('^A-Za-z').downcase

  if clean_str.size < 26
    return false
  else
    ALPHABET.chars.each do |char|
      next if clean_str.include?(char)
      return false
    end
  end

  true
end




p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
p panagram?("Two driven jocks help fax my big quiz.") == true
p panagram?("Say I will just type as I speak so it is a long string") == false
