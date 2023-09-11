=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
You should also print the number of words in the longest sentence.

Example text:

Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

If you have a variable str that contains a bunch of sentences, you can split into an array of sentences like this:

sentences = text.split(/\.|\?|!/)
P:
-write a method that text as an arg
-print the longest sentence
-print how many words it has
-anything that is not a space and a sentence ending char is considered a word
-sentence ending chars are . ? !
E:
DS:input: str
output: str, int
A:
sentences = text.split(/\.|\?|!/) -split an array into sentences
-ask about the size of each, pick the longest
-split it on a space - this will give me words
-count these words
-print the sentence
-print the number of words it has

Code:
=end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal. Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

def pick_longest_sentence(str)
  sentences = str.split(/\.|\?|!/)
  sentences.each do |sentence|
    sentence = sentence.gsub!("\n", " ")
  end

  size = 0
  longest = sentences.each do |sentence|
    sentence = sentence.split(" ")
    if sentence.size > size
      size = sentence.size
    end
  end
  p size

  p sentences.select { |s| s.split(" ").size == size}


end

pick_longest_sentence(text)

words = "I love programming. Only on Mon days."

pick_longest_sentence(words)
