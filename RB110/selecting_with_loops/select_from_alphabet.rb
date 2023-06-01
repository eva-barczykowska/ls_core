# from alphabet, select the letter g and return it
# do not use the select method, use only a loop
#
alphabet = 'abcdefghijklmnopqrstuvwxyz'

selected_letter = ''
counter = 0

loop do
  current_letter = alphabet[counter]

  selected_letter << current_letter if current_letter == "g"

  counter += 1
  break if counter == 26
end

p selected_letter

# how ls did it

alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"