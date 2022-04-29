a += ‘ Doe'

`a += ‘Doe’` is alternative syntax for `a = a + ‘Doe’`. `a = a + ‘Doe’`
reassigns a to the return value of the `#+` method called on variable a with `‘Doe’`
passed in as an argument, which return value is a new string object created from
the concatenation of the calling string object and the string passed in as an argument.

`a += ‘Doe’` uses the `+=` assignment operator to reassign the target variable
to the return value of `a + ‘Doe’`. In the expression `a + ‘Doe’`, the `+` method
is called on variable a with `‘Doe’` passed in as an argument; the `+` method
returns a new string created from the concatenation of the caller of the `+`
method and the argument passed into the method.

`a += ‘Doe’` reassigns the target variable to the return value of `a + ‘Doe’`.
`a + Doe’` creates and returns a new string object that is the concatenation of
the string referenced by a and `‘Doe’`.

`a += ‘Doe’` reassigns the target variable to the return value of `a + ‘Doe’`.
In `a + Doe’`, the `+` operator concatenates its operands, the string referenced
by a and the string `‘Doe’`, and thereby creates a new string object and
returns that new string object.

`a += ‘Doe’` creates a new string object and reassigns the target variable to the new string object.
