# The || operator returns a truthy value if either or both of its operands are
# truthy. If both operands are falsey, it returns a falsey value.
# The && operator returns a truthy value if both of its operands are truthy,
# and a falsey value if either
# operand is falsey. This works great until you need only one of two conditions
# to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.
# Note that we are looking for a boolean result instead of a truthy/falsy value
# as returned by || and &&
#
# Explicit requirements:
# -a method
# -takes 2 arguments
# -return a boolean: TRUE / FALSE if exactly 1 argument is TRUE
# Data structure:
# -input: 2 arguments
# -output: true/false
# Algorithm:
# -define a method with 2 parameters
# -find out if any of those is truthy so not nil and not false
# -find out the above about the 2nd parameter
# -if 1st is true and 2nd false, return true
# -else 2nd is true and 1st is false return also true
# -otherwise return false

def xor?(first, second)
  if first == true && second == false
    true
  elsif first == false && second == true
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# ls implementation:

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# more concise:

def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1))
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# implementation I liked:

def xor?(p, q)
  (p || q) && !(p && q)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

def xor?(first,second)
  [first, second].count(true) == 1
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

def xor?(x, y)
  if (x == true && y == false) || (x == false && y == true)
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
