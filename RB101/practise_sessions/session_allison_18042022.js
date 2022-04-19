// JavaScript has three keywords that are used to declare new variables.
// They are the `let`, `const` and `var` keywords.

// `let` and `const` were introduced to the language in 2015.
// Before that, you could only create variables with the `var` keyword.
// (Creating a variable without one of these keywords results in something
// called an 'undelclared variable'. They are not real variables). 

// ----------------------------------------------
// SCOPE

function hello() {
  console.log("hello");

  for (var i = 0; i < 2; i++) {
    console.log(i);
  }

  console.log(i);
}

hello();


// if (true) {
//   // hello is a block-scoped varaible
//   let hello = 'hi';
//   console.log(hello);

//   function sayHello() {
//     console.log(hello);
//   }

//   if (true) {
//     console.log(hello);
//   }

//   sayHello();

//   // block-scoped variables can be accessed inside of nested scopes.
// }
