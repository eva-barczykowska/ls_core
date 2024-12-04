# Read number of entries
n = gets.to_i

# Create phone book hash
phone_book = {}

# Add entries to phone book
n.times do
  name, phone = gets.chomp.split
  phone_book[name] = phone
end

# Process queries
while name = gets&.chomp
  break if name.nil?
  if phone_book.key?(name)
    puts "#{name}=#{phone_book[name]}"
  else
    puts "Not found"
  end
end

# The `&.` is the "safe navigation operator" in Ruby.
# It allows you to call a method on an object only if the object is not `nil`.
#
# In the code `name = gets&.chomp`, if `gets` returns `nil`, the method call won't raise an error.
# Instead, it will return `nil`.
#
# Without `&.`, calling `.chomp` on `nil` would raise a `NoMethodError`.
# This operator helps prevent such errors when dealing with potentially `nil` values.
# Read number of entries

# rewrite without the save navigation operator
n = gets.to_i

# Create phone book hash
phone_book = {}

# Add entries to phone book
n.times do
  name, phone = gets.chomp.split
  phone_book[name] = phone
end

# Process queries
while true
  name = gets
  break if name.nil?
  name = name.chomp
  if phone_book.key?(name)
    puts "#{name}=#{phone_book[name]}"
  else
    puts "Not found"
  end
end