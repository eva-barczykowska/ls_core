# What do you expect to happen when the greeting variable is referenced
#   in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# calling variables initialized in if statement doesn't produce an error but nil

# greeting is nil here, and no "undefined method or local variable" 
# exception is thrown.
# Typically, when you reference a variable that hasn't been initialized,
# Ruby will raise an exception, stating that it’s undefined.
#
# However, when you initialize a local variable within an if block,
# even if that if block doesn’t get executed, the local variable
# is initialized to nil
