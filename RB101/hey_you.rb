#String#upcase! is a destructive method, so why does this code print HEY you
# instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
