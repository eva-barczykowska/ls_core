
=begin
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.

If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]


◸≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ 𝓟roblem ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◹
Given a input array, subtract list a with values that are present in list b


◸≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ Examples ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◹


[1,2],[1] => [2]
[1,2,2], [1] => [2,2]

◸≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◟ Algorithm ◞≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂≂◹

● Access values from list a
  ⚬ compare with values from list b
  ⚬ reject values that are equal
● Return remainder array

=end

def array_diff(arr_a, arr_b)
  arr_a.reject do |ele|
    arr_b.any? { |inner_ele| ele == inner_ele }
  end
end

p array_diff([1,2], [1])# == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
