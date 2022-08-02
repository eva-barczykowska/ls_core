def cleanup(str)
  str.gsub(/[^A-Za-z]/, " ").squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '

# What is this code doing?

=begin
On `line 5` we call the `cleanup` method and pass it a `str` as an argument.

On lines 1-3 we define `cleanup` method and pass it a String object as an argument.
Within the body of the method we call the `gsub` method on the `str` argument. The
`gsub` method takes 2 arguments, first what we want to replace, second, what we want to replace it with. In this case, we are using regex and we decide to replace all the characters which are not alphabet characters, with a space.
We then call on the return value of the `gsub` method the `squeeze` method, which, with no arguments passed, will reduce all the consecutive spaces to just one space.
=end

# Sentence structure advice.
# 'On lines 1-3 we define the `cleanup` method and pass it...'
# 'We then call the `squeeze` method on the return value of the `gsub` method...'


# Advice for how to speed up your answer process.
# Don't worry about editing your answer while you're working on it the first time.
# Said another way; quickly create an initial answer (even if parts of it are wrong) then spend more time on editing. You don't have to have the perfect answer on your first go.
# My focus on first pass is: Making sure the answer addresses the questions that are being asked. My goal is to create a framework off which I can give a better answer. I don't focus on flow, clarity of communicaiton or correctness in my explanation. I will edit my markup if I miss that on the way.


def cleanup(str)
  str.gsub(/[^A-Za-z]/, " ").squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '

=begin
From `lines 1-3` we define a method called `cleanup.` This method takes a string
object as an argument, and when it is invoked, it will replace any non-alphabetical
characters with spaces and then compress multiple spaces down to a single space and return that result.

It does this by first invoking the `gsub` method on the given string object,
whose first argument can be either a string or a regular expression, and represents
what we want to replace, and whose second argument is a string that represents
what the matches to the first argument will be replaced with.
The `gsub` method will return a string that looks like `'   what s my    line '`.

The `squeeze` method is then called on the return value of `gsub`, which will compress any duplicate spaces into a single space.

Methods implicitly return the last value in their bodies, so the return value of `cleanup`
will be the string that is returned by the `squeeze` method.

On `line 5` we invoke the `cleanup` method and print its return value.
We pass the string of `'--what's my +*& line?'` as an argument,
and we get the string `' what s my line '` returned to be printed by the `p` method.
=end

# You were unsure of whether to choose between 'parameter' and 'argument'.
# There are many situations in which the line is blurred, and a good stratagey
# for stepping around that is to structure your sentence in such a way that one is preferred.

# "Within the body of THE method we call There `gsub` method on the `str` argument."
# Choose between one of 'argument' or 'parameter'. I'll choose 'argument'.
# Within the body of the `cleanup` method we call the `gsub` method
# - it is invoked on the string object that was given to `cleanup` as an argument. 
# Within the body of the `cleanup` method, we call the `gsub` method on `cleanup`'s `str` parameter.

# function cleanup(str) {}
# cleanup('my string');
# `str` is the parameter, `'my string'` is the argument.



# [1, 2, 3].forEach(callback);
# function callback(val) {
#  console.log(val);
#}

# [1, 2, 3].forEach(val => console.log(val));
