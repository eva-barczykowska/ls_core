# Build a function that creates histograms. Every bar needs to be on a new line and its length corresponds to the numbers in the array passed as an argument.
# The second argument of the function represents the character that needs to be used.
#
# histogram(lst, char) -> str
# P:
# -write a method that takes as an argument an array and a character
# - that character will be printed each time on a separate line - how many times will it be printed?
# - the array integers specify that
# Examples:
# histogram([1, 3, 4], "#") == "#\n###\n####"
#
# #
# ###
# ####
#
# histogram([6, 2, 15, 3], "=") == "======\n==\n===============\n==="
#
# ======
# ==
# ===============
# ===
#
# histogram([1, 10], "+") == "+\n++++++++++"
#
# +
# N:
# print, puts
# A:
# P:
# -write a method that takes 2 args, an array and a character
# - the method will print lines
# each line will have as many characters as the corresponding array element indicates
# Examples:
# histogram([1, 3, 4], "#") == "#\n###\n####"
def histogram(array, char)

  array.each do |number|
    print char * number
    puts
  end

end

histogram([1, 3, 4], "#")