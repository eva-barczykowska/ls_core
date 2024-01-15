=begin
Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If, for example, we change the first number to something else, comp is not returning true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be nil
If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.

#problem
Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

INput 2 Inputs both Arraystwo arrays a and b write a function comp(a, b)
- a Array (array of integers)
- b Array
Output Boolean

true
[121, 144, 19, 161, 19, 144, 19, 11]
[121, 14641, 20736, 361, 25921, 361, 20736, 361]

Data Strctures
Arrays of square roots. Mayye array_of_suares

Alorithim
Convert all elements in array b to floats array_of_floats_a
Convert all elements in array b to floats array_of_floats_b
iterate over array_of_floats_b take square root of each element
  - Check if square_of_b is included in array_of_floats_a
    - If it is, continue to next iteration
    - If it is not, exit method returning boolean `false`
Return true (all squares of b were included in a)



If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.
=end

def comp a, b
  return false if a.nil? || b.nil?
  array_of_floats_a = a.map(&:to_f)
  array_of_floats_b = b.map(&:to_f)

  array_of_floats_b.each do |int_from_array_b|
    sqrt_b = Math.sqrt(int_from_array_b)
    return false unless array_of_floats_a.include?(sqrt_b)
  end
  true
end


# p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])# == true

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a,b) == false

=begin
#my algorigthm
A:
  - sort a array
- sort b array

-transform a array into power ** 2

- see if a == b
=end
def comp(a, b)
  return false if a.nil? || b.nil?

  a = a.sort.map { |n| n ** 2}
  b = b.sort

  a == b
end


p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])# == true

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a,b) == false

a = nil
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a,b) == false
