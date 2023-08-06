# Usually when you buy something, you're asked whether your credit card number,
# phone number or answer to your most secret question is still correct. However, since someone could look
# over your shoulder, you don't want that shown on your screen. Instead, we mask it.
#
#   Your task is to write a function maskify, which changes all but the last four characters into '#'.
#   "4556364607935616" --> "############5616"
# "64607935616" -->      "#######5616"
# "1" -->                "1"
# "" -->                 ""
#
# // "What was the name of your first pet?"
# "Skippy" --> "##ippy"
# "Nananananananananananananananana Batman!" --> "####################################man!"
#
# ************** Problem **************
# ************** Examples **************
# maskify('4556364607935616') == '############5616'
# maskify('1') == '1'
# maskify('11111') == '#1111'
# ************** Data Structures **************
# Input:str
# Output:str
#   ************** Notes **************
# ************** Algorithm **************
# split string into an array
# define result
# if elements are less than 4, just return the element(s)
# else transform all the other elements in excess of 4 into '#'
# *************** Code **************
#
# ************** Refactor **************

def maskify(cc)
  return cc if cc.size < 4

  cc = cc.split("")

  last_four = cc.last(4)
  size_of_masking = cc[0..-5].size
  '#' * size_of_masking + last_four.join
end

p maskify('4556364607935616') == '############5616'
p maskify('1') == '1'
p maskify('11111') == '#1111'