# session with Izzayah

# Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.

# module Walkable
#   def walk
#     print "Let's go for a walk!"
#   end
# end

# class Cat
#   include Walkable

#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end

# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.walk

# Expected output:

# Hello! My name is Sophie!
# Let's go for a walk!

# Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

# Code:

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = 'Luna'
# kitty.greet

# Expected output:

# Hello! My name is Sophie!
# Hello! My name is Luna!

# Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.

# Code:

# class Cat
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   # def name=(new_name)
#   #   @name = new_name
#   # end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = "Luna"
# kitty.greet

# Expected output:

# Hello! My name is Sophie!
# Hello! My name is Luna!

# # Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

# Code:

# class Cat
#   attr_reader :name # attr methods is for basic behaviours

#   def initialize(name)
#     @name = name
#   end

#   def name # traditional way is for more complex behaviours
#     @name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# Expected output:

# Hello! My name is Sophie!

# Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

# # Code:

# types of variables
# local variable - var
# Constant variable - VAR
# instance variable - @var

# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# Expected output:

# Hello! My name is Sophie!

# Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

# Code:

# class Cat
#   def initialize(name)
#     @name = name
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# Expected output:

# Hello! My name is Sophie!

# Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is instantiated.

# Code:

# class Cat
#   def initialize
#     puts "I'm a cat!"
#   end
# end

# kitty = Cat.new

# Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.

# Code:

# class Cat
# end
# # ruby doc instance: Class#method_name, class methods: Class::method_name
# kitty = Cat.new
# kitty = Cat::new # same like previous line, exclusive for class methods
# puts kitty

# Create an empty class named Cat.
# class Cat

# end

# class Pet < Animal
#   def greet
#     puts 'hello'
#   end
# end

# # same thing different syntax

# class Cat < Pet; end

# Cat.new.greet

# Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.
# def puts(obj) # overidding
#   p obj.class
# end

# puts "Hello"
# puts 5
# puts [1, 2, 3]

# Expected output:

# String
# Integer
# Array

# # Create class:
# class Integer
# end
# class String
# end
# class Hashes
# end
# class Human
# end
# #...
# # Instatiation:
# Integer.new
# # note: will raise error due to integers being immutable objects,
# # just hear for a visual
# Hashes.new
# String.new
# Array.new
# Human.new
# #Instatiation - creates Objects/Instances:
# 1, {}, '', [], #<Human:0x00007f..>d
# #------------------------------
# # instance variables: @var , @name ….# put `@` in front to create instance variable
#   # keeps track of information unique to that object
#   class Human
#     attr_reader :name, :height
#     def initialize(name, height)
#       @name = name
#       @height = height
#     end
#   end
#   ewa = Human.new('Ewa', '6ft') # @name = 'Ewa', @height = '6ft'
#   travis = Human.new('Travis', '7ft') # name = 'Travis', @height = '7ft'
#   puts ewa.name # prints Ewa
#   puts travis.height # prints 7ft
# #-------------------------------
#   attr_reader
#   #creates 1 method: getter method:
#   # - only exposes/returns value of instance variable
#   #equivalent:
#     def getter
#       @var
#     end
# #-----------------------
#   attr_writer
#   #creates 1 method: setter method:
#   # - only changes value of instance variable
#   # note: setter methods are destructive(changes value but same object)
#    #equivalent:
#    def setter=(var)
#       @var = var
#     end
# # ----------------------
# attr_accessor
# # creates 2 methods: 1 getter, 1 setter
#   #equivalent:
#   def getter
#     @var
#   end
#   # and
#   def setter=(var)
#     @var = var
#   # end
