// this is an example of an object literal in JavaScript
// const obj = {
//   a: 'hello',
//   b: 'goodbye',
//   c: true,
//   d: 3,
//   e: undefined,
//   f: function() { console.log('hello') }
// };

// console.log(obj.f()); // hello

// console.log(hello('mary'));
// console.log(sayHello1);

// `hello` is a function declaration
function hello(name) {
    console.log("hello " + name);
}

// `sayHello1` is a function expression.
// the function object is created by the arrow function syntax before being stored in the `sayHello1` variable.
let sayHello1 = name => `hello ${name}`;

// [1, 2, 3].forEach(val => console.log(`val is ${val}`));

const newArr = [[1, 2], [3, 4]].map(arr => {
    return arr.filter(num => num % 2 === 0);
});

console.log(newArr);

const newArr2 = [[1, 2], [3, 4]].map(function(arr) {
    return arr.filter(function(num) {
        return num % 2 === 0;
    });
});

console.log(newArr2);

// const sayHello2 = name => {
//   return `hello ${name}`;
// }

// const sayHello3 = function(name) {
//   return `hello ${name}`;
// }

// console.log(sayHello1('terry'));
// console.log(sayHello2('morgan'));

// JavaScript has two ways to define functions:
//  1 - function declarations (`hello`)
//  2 - function expressions  (`sayHello1`, `sayHello2` and `sayHello3`)
// A function declaration is a function definition with a line that starts with the `function` keyword. A function expression is a function that is stored directly in a variable.
// Functions in JavaScript are all the same under the hood - they're all represented as 'function objects.' But the distinction between the term 'function declaration' and 'function expression' deal with

// console.log(Object.getOwnPropertyNames(obj));
// console.log(Object.getOwnPropertyNames(hello));
