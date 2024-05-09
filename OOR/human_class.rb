module Speak
  def speak(sound)
    sound
  end
end

class Human
  include Speak
end

me = Human.new
p me
p me.speak('Going swimming, byeeeeeee!')

cledwyn = Human.new
p cledwyn
p cledwyn.speak('Check the bank account, hun!')

cailan = Human.new
p cailan
p cailan.speak('Can I pleeeeezze buy a new game, mom?')
