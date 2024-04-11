Matching parentheses
def balanced?(string)
  parentheses = string.chars.select { |char| ['(', ')'].include?(char) }
  open = []
  close = []
  parentheses.each do |par|
    if par == ')'
      close << par
      next if open.size >= close.size

      return false

    else
      open << par
    end
  end
  open.size == close.size
end

def balanced1?(string)
  brackets = {
    parens: { open: '(', closed: ')', count: 0 },
    square: { open: '[', closed: ']', count: 0 },
    curly: { open: '{', closed: '}', count: 0 }
  }
  type_balanced?(string, brackets[:parens]) &&
    type_balanced?(string, brackets[:square]) &&
    type_balanced?(string, brackets[:curly])
end

balanced?('What (is) this?')
balanced?('What is) this?')
balanced?('What (is this?')
balanced?('((What) (is this))?')
balanced?('((What)) (is this))?')
balanced?('Hey!')
balanced?(')Hey!(')
balanced?('What ((is))) up(')
balanced?('What ())(is() up')

puts

def type_balanced?(string, type)
  string.each_char do |char|
    if char == type[:open]
      type[:count] += 1
    elsif char == type[:closed]
      type[:count] -= 1
    end
    return false if type[:count] < 0
  end
  type[:count].zero?
end

p balanced?('What (is) this?')
p balanced?('What is) this?')
p balanced?('What (is this?')
p balanced?('((What) (is this))?')
p balanced?('((What)) (is this))?')
p balanced?('Hey!')
p balanced?(')Hey!(')
p balanced?('What ((is))) up(')
p balanced?('What ())(is() up') == false
