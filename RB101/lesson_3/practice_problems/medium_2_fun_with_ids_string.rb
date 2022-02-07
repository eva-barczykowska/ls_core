# Question 1
# Every named entity in Ruby has an object_id.
# This is a unique identifier for that object.
#
# It is often the case that two different things "look the same",
#   but they can be different objects. The "under the hood" object referred to
#   by a particular named-variable can change depending on
#   what is done to that named-variable.
#
# In other words, in Ruby, all values are objects...
# but they are not always the same object.
#
# Predict how the values and object ids will change
# throughout the flow of the code below:

def fun_with_ids
  b_outer = "forty two"
  b_outer_id = b_outer.object_id

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts

  1.times do
    b_outer_inner_id = b_outer.object_id #this is like alias
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." #pointing to the SAME object id
    puts

    b_outer = "thirty three"
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."# different before and after
    puts
    b_inner = b_outer
    b_inner_id = b_inner.object_id
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."#different
    puts
  end

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."#different
  puts
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids
