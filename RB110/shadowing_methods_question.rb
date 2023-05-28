item = 1

def print_item(item)
  puts item
  item = 2
end

print_item 5      # prints 5
puts item         # prints 1



reassigned_value = print_item(5)
p reassigned_value