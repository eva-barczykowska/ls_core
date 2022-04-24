# The reverse_sentence method should return a new string with the words of its
# argument in reverse order, without using any of Ruby's built-in reverse methods.
# However, the code below raises an error. Change it so that it behaves as expected.

# my solution

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   p words
#   reversed_words = ""
#
#   i = 0
#   while i < words.length
#     reversed_words = words[i] + " " + reversed_words
#     i += 1
#   end
#
#   reversed_words.rstrip
# end
#
# p reverse_sentence('how are you doing')
# # expected output: 'doing you are how'

# ls solution

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length

    p "reverse words before adding"
        p words[i]
    p reversed_words
    p "***"
    reversed_words = [words[i]] + reversed_words
    p "there are reversed words after addingå"
    p reversed_words
    p "***********************"
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
