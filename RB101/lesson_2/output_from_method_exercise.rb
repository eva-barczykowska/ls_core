def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
extend_greeting(greeting)

puts greeting

# Select all the ways in which we could change this code in order for the last line to output "hi there".

# A. Change greeting + " there" to greeting += " there". NO because then we're pointing greeting to point somewhere else

# B. Change extend_greeting(greeting) to greeting = extend_greeting(greeting).

# C. Remove puts greeting and change extend_greeting(greeting) to puts extend_greeting(greeting)

# D. Change greeting + " there" to greeting << " there".