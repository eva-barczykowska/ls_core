# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing
# dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions.
# Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string
# between 0 and 255 as required for IP numbers and asked Ben to use it.
#

def is_an_ip_number?(num)
  (0..255).cover?(num.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_chunks = input_string.split(".")
  # p dot_separated_words
  return false if dot_separated_chunks.size > 4 || dot_separated_chunks.size < 4
  while dot_separated_chunks.size > 0 do
    chunk = dot_separated_chunks.pop
    break unless is_an_ip_number?(chunk)
  end
  return false if !is_an_ip_number?(chunk)
  return true
end

p dot_separated_ip_address?("10.4.5.11") == true
p dot_separated_ip_address?("4.5.5") == false
p dot_separated_ip_address?("1.2.3.4.5") == false
p dot_separated_ip_address?("1.2.3") == false
p dot_separated_ip_address?("266.4.5.11") == false

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that
# there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
# Help Ben fix his code.

puts

# ls fix
def dot_separated_ip_address?(input_string)
  dot_separated_chunks = input_string.split(".")
  return false unless dot_separated_chunks.size == 4

  while dot_separated_chunks.size > 0 do
    chunk = dot_separated_chunks.pop
    return false unless is_an_ip_number?(chunk)
  end

  true
end

p dot_separated_ip_address?("10.4.5.11") == true
p dot_separated_ip_address?("4.5.5") == false
p dot_separated_ip_address?("1.2.3.4.5") == false
p dot_separated_ip_address?("1.2.3") == false
p dot_separated_ip_address?("266.4.5.11") == false