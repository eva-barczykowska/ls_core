# The reverse_sentence method should return a new string with the words of its
# argument in reverse order, without using any of Ruby's built-in reverse
# methods.
# However, the code below raises an error. Change it so that it behaves as
# expected.

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
    p "there are reversed words after adding"
    p reversed_words
    p "***********************"
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
On line 29 we split the argument string so that we get an array of strings/words.
We initialize reversed_words array, which is where we will place the words in reverse order.
Then we initialize the (counter) variable i and point it to the integer 0.
On line 33 we are starting the loop. We will loop through the array the amount
of times that is equivalent to its length, so in this case 4 times.

First time the loop is executed
reversed_words = words[0] + [], so the word [ "how" ] gets picked up + an empty array is added. So we are starting to build our result.
After 1st iteration of the loop reversed_words array now contains 1 element, a string "how".
We increase the counter.

Second time the loop is executed
reversed_words = words[1] + reversed_words so [ "are" ] gets picked up and [ "how" ] is added.
After 2nd iteration of the loop, the reversed_words array now contains 2 elements, [ "are", "how" ].
We increase the counter.

Third time the loop is executed
reversed_words = words[2] + reversed_words so [ "you" ] gets picked up and [ "are", "how" ] are added.
After 3rd iteration of the loop, the reversed_words array now contains 3 elements, [ "you", "are", "how" ].
We increase the counter.

Fourth time the loop is executed
reversed_words = words[3] + reversed_words so [ "doing" ] gets picked up and [ "you", "are", "how" ] are added.
After 4th iteration of the loop, the reversed_words array now contains 4 elements, [ "doing", "you", "are", "how" ].
We increase the counter, the counter is now 5 and that means that the loop will not be executed anymore.

We exit the loop. We have an array of 4 string objects, [ "doing", "you", "are", "how" ].
The tasks calls for the method to return a string so we call the join method and our reversed_words array
and we pass it (" ") as an argument. The array will be joined on a space. The join method will return
a string object with the value "doing you are how". The line with the join method call is the last line in our method
so this string object will be what the method will ultimately return.
