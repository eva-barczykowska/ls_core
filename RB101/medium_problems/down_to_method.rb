
int = 10
int.downto(0) do |n| # in case of a str, gives me access to indices!
  puts n
end

puts

int = 0
int.upto(10) do |n| # in case of a str, gives me access to indices!
  puts n
end