# The Fibonacci numbers are the numbers in the following integer sequence (Fn):
#
#     0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...
#
# such as
#
#     F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.
#
# Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying
#
#     F(n) * F(n+1) = prod.
#
# Your function productFib takes an integer (prod) and returns an array:
#
# [F(n), F(n+1), true] or {F(n), F(n+1), 1} or (F(n), F(n+1), True)
#
# depending on the language if F(n) * F(n+1) = prod.
#
# If you don't find two consecutive F(n) verifying F(n) * F(n+1) = prodyou will return
#
# [F(n), F(n+1), false] or {F(n), F(n+1), 0} or (F(n), F(n+1), False)
#
# F(n) being the smallest one such as F(n) * F(n+1) > prod.
# Some Examples of Return:
#
# (depend on the language)
#
# P:
# -method takes an integer
# -method returns 2 numbers that, when multiplied, return that integer
#
# E:
# =>
#
# A:
# -have a base array `fibonacci_nums` = [1, 1, 2]
# -GENERATE more fib numbers by adding last and one but last from `fibonacci_nums` array
#
# -AFTER generating the last number in `fibonacci_nums`, check if this lastly added number and the number before, when multiplied equal to the argument number
# -KEEP generating until the 2 last numbers are eual/greater
#
# -if this is true, RETURN last and the one before from fibonacci array, true  in an array

def productFib(product)
  fibonacci_nums = [1, 1, 2]

  fibonacci_nums << fibonacci_nums[-1] + fibonacci_nums[-2] while fibonacci_nums[-1] * fibonacci_nums[-2] < product

  return [fibonacci_nums[-2], fibonacci_nums[-1], true] if fibonacci_nums[-2] * fibonacci_nums[-1] == product

  [fibonacci_nums[-2], fibonacci_nums[-1], false] if fibonacci_nums[-2] * fibonacci_nums[-1] != product
end

p productFib(714) == [21, 34, true]
p productFib(4895) == [55, 89, true]
p productFib(5895) == [89, 144, false]
