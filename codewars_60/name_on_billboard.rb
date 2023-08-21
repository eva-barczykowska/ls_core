# You can print your name on a billboard ad. Find out how much it will cost you.
# Each character has a default price of £30, but that can be different if you are given 2 parameters instead of 1 (allways 2 for Java).
#
#  You can not use multiplier "*" operator.
#
# If your name would be Jeong-Ho Aristotelis, ad would cost £600. 20 leters * 30 = 600 (Space counts as a character).
#
# price = 30
# sum = 0
# 5.times { |n| sum += price }
#
# p sum

def billboard(name, price=30)
  total = 0
  name.size.times { |number| total += price}
  total
end

p billboard("Jeong-Ho Aristotelis") == 600
p billboard("Abishai Charalampos") == 570
p billboard("Idwal Augustin") == 420
p billboard("Hadufuns John",20) == 260
p billboard("Zoroaster Donnchadh") == 570
p billboard("Claude Miljenko") == 450
p billboard("Werner Vigi",15) == 165
p billboard("Anani Fridumar") == 420
p billboard("Paolo Oli") == 270
p billboard("Hjalmar Liupold",40) == 600
p billboard("Simon Eadwulf") == 390

