=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Problem:
input: a string that may or may not contain parentheses
return: true or false
- balanced: pairs, even number
  - the # ( of == # of )
  - must start with (
  - must end with )
- return true if input contains no parentheses

Examples:

balanced?('What (is) this?') == true --> ()
balanced?('What is) this?') == false --> )
balanced?('What (is this?') == false --> (
balanced?('((What) (is this))?') == true --> (()()) --> (()) --> ()
balanced?('((What)) (is this))?') == false -->
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false --> ())(() --->))(() --> )(

()((())) --> ((())) --> (()) --> ()
Note that balanced pairs must each start with a (, not a ).

Algo:
- delete all but the parentheses chars from input String, assign to result
- if string is empty, return true
- initiate a loop
  - if result includes "()", then delete it
  - else, then break
- if the result is empty. return true
- else, return false
=end
def balanced?(string)
  result = string.delete("^()")
  return true if result.empty?

  loop do
    if result.include?("()")
      result.sub!("()", "")
    else
      break
    end
  end
  result.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false 