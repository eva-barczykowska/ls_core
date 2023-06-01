# write a method to select vowels from a string, use loop
# hint:
# if 'aeiouAEIOU'.include?(current_char)
#   selected_chars << current_char
# end

def select_vowels(str)
  selected_vowels = ""
  counter = 0

  loop do
    current_char = str[counter]
    if 'aeiouAEIOU'.include?(current_char)
      selected_vowels << current_char
    end

    counter += 1
    break if counter >= str.size
  end

  selected_vowels
end

p select_vowels("Ewa")
p select_vowels("vlk")