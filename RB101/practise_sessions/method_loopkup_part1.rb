=begin
Method Lookup (Part 1)

Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes that were checked by Ruby when searching for the #color method.
=end

module Walkable
  def walk
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end


class Cat < Animal
  include Walkable
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# method lookup chain for color:
# Cat, its own class. Since there are no methods named `color` here, Ruby next looks in any modules included in a class. Since there are no modules in the `Cat` class Ruby then searches inside the parent class. Here is where Ruby finds the `color` method defined.  Is it still defined if it's the `attr_reader`?

p Cat.ancestors