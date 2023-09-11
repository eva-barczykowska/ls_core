# 14. Dubstep
# (https://www.codewars.com/kata/551dc350bf4e526099000ae5/train/ruby)
# 6 kyu
=begin
Polycarpus works as a Dhttps://www.codewars.com/kata/551dc350bf4e526099000ae5/train/rubyJ
in the best Berland nightclub, and he often uses dubstep music in his performance.
Recently, he has decided to take a couple of old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB).
To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB"
before the first word of the song (the number may be zero), after the last word
(the number may be zero), and between words (at least one between any pair of neighbouring words),
and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep
remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track,
but since he isn't into modern music, he decided to find out what was the initial song
that Polycarpus remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting
only of uppercase English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix.
Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND

PEDAC TEMPLATE

************** Problem **************
-write a method
-the argument is a string, with only capital letters
-the string's length wont' be greater than 200 characters
-WUB is the remix sound cluster
-the method has to return the lyrics w/o WUB
-all the WUB clusters have to be removed
-replace the WUB cluster/muliple clusters with 1 space
-return the original lyrics

************** Examples **************

p song_decoder("AWUBBWUBC") == "A B C"
=>A-WUB-B-WUB-C
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
=>A-WUB-WUB-WUB-B-WUB-WUB-WUB-C
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
=>WUB-A-WUB-B-WUB-C-WUB
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == WE ARE THE CHAMPIONS MY FRIEND

************** Data Structures **************
input: a strin, capital letters only
output: a string, original lyrics of the song
************** Algorithm **************
-find and replace each cluster with a space
-reduce the spaces between words to just 1
-return the cleaned string

************** Code **************
=end
def song_decoder(str)
  str = str.gsub('WUB', ' ').squeeze
  str.reverse![-1] == " " ? str.chop! : str # deleting the first space if it exists
  str.reverse![-1] == " " ? str.chop! : str # deleting the last space if it exists
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"

puts

def song_decoder(wub_string)
  wub_string.gsub('WUB', " ").squeeze(' ').strip # best approach
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"

puts

def song_decoder(wub_string)
  wub_string.split('WUB').delete_if {|word| word == ''}.join(' ') # splitting on one wub works, but splitting on two in a row adds a empty string
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"

puts

def song_decoder(wub_string)
  wub_string.split('WUB').select {|word| word != ''}.join(' ')
end
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"

puts

# P:
# -write a method that takes a str as an arg
# -the string has inserted 'WUB' str
# -the method returns the str without all the WUBs

# E:

# DS:
# input: str
# output: str

# A:
# -replace all occurences of WUB with a space
# -strip the spaces at the beginning and end, if any
# =end

def song_decoder(str)
  str.gsub('WUB', '').split('').join(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
# "A-WUB-B-WUB-C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
# "A WUB WUB WUB B WUB WUB WUB C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
# "WUB A WUB B WUB C WUB"





