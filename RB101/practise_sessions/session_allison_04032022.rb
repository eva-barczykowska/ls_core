
#  CAN WE USE MARCO'S SOLUTION AS IS?
# Your previous JavaScript content is preserved below:
#
# TUI - Telephonic User Interface
# 30 prompts
# -sound is muffled/garbled
# -'function' to recognize if the sound is not perfect
# -if it happens repeatedly?
# -what is garbled?
# -2 ways to compare:
# a) record the audio, convert the sound to text and compare with the string that you have
# https://github.com/alphacep/vosk-api
# text: 'Hello, please select the option you wish to proceed with'
# how to call python script from ruby:
# result = ("python script.py params")
# a library to work with audio: ffmpeg
#
# -2 fingerprinting
# -AUDFPRINT
# -comparing sound based on freequencies
#
# -he has an dekstop app using 1 and 2
#

# Algorithm 1
# - VOSK
# Problems:
# -this solution is implementing neural networks, which learn(???).
# - Does this mean that the software will 'guess' what word should be there
#  in spite of audio disturbances? I don't want the software to help me guess what
#  should be there but I want to be informed about all the sound problems
#
# Algorithm 2
# -AUDFPRINT
# # challenges:
# # -it's python
# -use python in ruby
# -pip - package installer for python
# DEPRECATION: Configuring installation scheme with config files is deprecated and will no longer work in the near future. If you are using a Homebrew or Linuxbrew Python, please see discussion at https://github.com/Homebrew/homebrew-core/issues/76621 ???
# documentation
# https://www.youtube.com/watch?v=Itic1lFc4Gg&t=379s
# where is the model?
# how to use it?
# ask Marco
# use his solution????? can I compare TUI prompts in his app: put 1 prompt in the db and then see if what I recorded
# is correct
# what are the conditions for using his app?
# it compares hashes
#Generally, anything more than 5 or 6 consistently-timed matching hashes indicate
# a true match, and random chance will result in fewer than 1% of the raw common
# hashes being temporally consistent.
#Isn't it too sensitive? I don't want it to match easily


Algorithm 3
objective measures of SPEECH quality
http://labrosa.ee.columbia.edu/projects/snreval/
# The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.
# loop do
#   puts 'Just keep printing...'
#   break
# end

# The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#   break
# end

# puts 'This is outside all loops.'

# Explain why the code works


def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  p century
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  p 'not 11, 12 or 13'

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

    find the pattern, remove the pattern
