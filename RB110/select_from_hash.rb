# In this example we want to select the key-value pairs where the value is 'Fruit'.
# Write a method that uses a loop.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

empty_produce = {}

def select_fruit(produce)
  result = {}

  key_counter = 0
  value_counter = 0

  loop do
    break if key_counter >= produce.keys.size

    current_key = produce.keys[key_counter]
    current_value = produce.values[value_counter]

    if current_value == "Fruit"
      result[current_key] = current_value
    end

    key_counter += 1
    value_counter += 1

  end

  result

end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit(empty_produce)

puts

# ls solution
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit(empty_produce)

puts

# me trying to code like LS
def select_fruit(produce)
  result = {}

  counter = 0
  loop do
    break if counter == produce.size

    current_key = produce.keys[counter]
    current_value = produce[current_key]

    if current_value == "Fruit"
      result[current_key] = current_value
    end

    counter += 1
  end

  result
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit(empty_produce)

puts


# now using selection criteria as a second argument of the method
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
p general_select(produce, 'Meat')      # => {}

puts

# task:
# Try coding a method that allows you to multiply every array item by a specified value

def multiply(array, number_to_multiply_by)
  result = []
  counter = 0

  loop do
    break if counter == array.size

    current_number = array[counter]
    result << current_number * number_to_multiply_by

    counter += 1
  end

  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

# ls solution - like mine but in fewer lines
def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier

    counter += 1
  end

  multiplied_numbers
end

puts

# now a task to select a letter from a string and return how many times this letter appears in this string
# question = 'How many times does a particular character appear in this sentence?'
# select_letter(question, 'a') # => "aaaaaaaa"
# select_letter(question, 't') # => "ttttt"
# select_letter(question, 'z') # => ""

def select_letter(str, target_letter)
  result_str = ""
  counter = 0

  loop do
    break if counter == str.size

    current_letter = str[counter]
    result_str << current_letter if current_letter == target_letter

    counter += 1
  end

  result_str
end
question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

puts

# and now it returns how many times a give letter appears in the argument string

def select_letter(str, target_letter)
  how_many_times = 0
  counter = 0

  loop do
    break if counter == str.size

    current_letter = str[counter]
    how_many_times += 1 if current_letter == target_letter

    counter += 1
  end

  how_many_times
end
question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""