# Create a function that takes a string and returns a new string with all vowels removed.
def remove_vowels(str)
  str.delete('aeouiAEOUI')
end
p remove_vowels("I have never seen a thin person drinking Diet Coke.") == " hv nvr sn  thn prsn drnkng Dt Ck."

p remove_vowels("We're gonna build a wall!") =="W'r gnn bld  wll!"

p remove_vowels("Happy Thanksgiving to all--even the haters and losers!") == "Hppy Thnksgvng t ll--vn th htrs nd lsrs!"

p remove_vowels("Aloha") == "lh"