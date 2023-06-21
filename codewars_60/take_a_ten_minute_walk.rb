=begin
15. Take a Ten Minute Walk
(https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby)
6 kyu

You live in the city of Cartesia where all roads are laid out in a perfect grid.
You arrived ten minutes too early to an appointment, so you decided
to take the opportunity to go for a short walk.
The city provides its citizens with a Walk Generating App on their phones
-- everytime you press the button it sends you an array of one-letter strings
representing directions to walk (eg. ['n', 's', 'w', 'e']).

You always walk only a single block in a direction and you know it takes you
one minute to traverse one city block, so create a function that will
return true if the walk the app gives you will take you exactly ten minutes
(you don't want to be early or late!) and will, of course,
return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing
a random assortment of direction letters ('n', 's', 'e', or 'w' only).

It will never give you an empty array (that's not a walk, that's standing still!).

=begin pedac

*************Problem********************
Overall goal: write a method that returns true if the walk is 10 blocks and returns you to your starting point
initial input: array (directions n, s, e, w)
overall output: boolean

explicit requirements:
to return true:
  walk must take 10 min
    array size must be 10
  directions must get you back to the starting point
    num of 'n' must equal num of 's'
    num of 'e' must equal num of 'w'
array will not be empty
array will always contain valid elements


implicit requirements:

questions:

**********Examples/Test cases************
p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
> 10 elements, num of n (5) == num of s (5) > true because both requirements are met
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
> 12 elements > false because doesnt have 10 elements
p is_valid_walk(['w']) == false
> only 1 element > false because it doesnt have 10 elements
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
> 10 elements but num of 'n'(6) != num of 's'(4) > false

*************Data Structure**************
array > boolean

***************Algorithm*****************
Overall approach: if array size is 10 and num of 'n' equals the num of 's' and the num of 'e' equals the num of 'w' then return true. otherwise return false

*/ if conditional: if branch: 3 things are true: array size == 10
details:

*/ if branch: count the number of all n, s, e , w. compare n and s, e and w. if n = s and e = w
details:

*/ else branch: return false
details:

=end

def is_valid_walk(array)
  return true if (array.size == 10) && (array.count('n') == array.count('s')) && (array.count('e') == array.count('w'))
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])  == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false