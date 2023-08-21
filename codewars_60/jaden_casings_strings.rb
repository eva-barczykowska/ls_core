# Jaden Smith, the son of Will Smith, is the star of films such as The Karate Kid (2010) and After Earth (2013).
# Jaden is also known for some of his philosophy that he delivers via Twitter. When writing on Twitter, he is known for almost always capitalizing every word. For simplicity, you'll have to capitalize each word, check out how contractions are expected to be in the example below.

# Your task is to convert strings to how they would be written by Jaden Smith. The strings are actual quotes from Jaden Smith, but they are not capitalized in the same way he originally typed them.
#
# Examples:
# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"
#
# P:
# write a method which converts a str argument to a string with every word capitali
def toJadenCase(str)
  str.split.map { |word| word.capitalize }
end

str = "How can mirrors be real if our eyes aren't real"
p to_jaden_case(str) == "How Can Mirrors Be Real If Our Eyes Aren't Real"