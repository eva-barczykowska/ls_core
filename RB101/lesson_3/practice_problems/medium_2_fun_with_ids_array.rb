
def fun_with_ids
  c_outer = [42]
  c_outer_id = c_outer.object_id
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts

  1.times do
    c_outer_inner_id = c_outer.object_id
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts

    c_outer = [44]
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." #different
    puts
    c_inner = c_outer#this is an alias
    c_inner_id = c_inner.object_id
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."#SAME!!!
    puts
  end

  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."#different
  puts
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids
