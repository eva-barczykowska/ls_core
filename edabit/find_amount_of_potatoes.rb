# Create a function to return the amount of potatoes there are in a string.
def potatoes(str)
  str.scan("potato").size
end

p potatoes("potato") == 1
p potatoes("potatopotato") == 2
p potatoes("potatoapple") == 1