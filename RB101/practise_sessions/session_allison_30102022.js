const HTTP = require('http');
const express = require('express');

const SERVER = HTTP.createServer(function(req, res) {
  res.status = 200;
  res.end();
});

SERVER.listen(443, () => {
  console.log("Server listening on port 443");
});

// console.log(Object.getOwnPropertyNames(global));
// console.log(Object.getOwnPropertyNames(JSON));


// const person = {
//   name: 'Jack',
//   age: 57,
// };




// // console.log(Object.getPrototypeOf(person));

// function Person(name, age) {
//   this.name = name;
//   this.age = age;
// }

// Person.prototype.greet = function() {
//   console.log(`${this.name} says hello!`);
// }

// const jake = new Person('Jake', 30);
// jake.greet();

// // Object properties are inherited through the prototype chain.
// // jake --> Person.prototype -> Object.prototype -> null
// // jake's [[Prototype]] is Person.prototype.

// // [[Prototype]] and <constructor>.prototype are NOT the same thing.

// // The `Person` constructor is used to make instances that represent the abstraction of a person, or the 'type' of 'Person'.

// // In a prototype-based language, there are no classes. State and behavior are only inherited from other objects.

// // Every function in JS is an object and every constructor is a function.

// function Cat(name) {
//   this.name = name;
// }

// Cat.prototype.sayHello = function() {
//   console.log('meow!');
// }

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   sayHello() {
//     console.log("meow!");
//   }
// }

// let cat = new Cat('fluffy')
// cat.sayHello();

// Node is a runtime env that I can download
// Npm is a package manager that allows me to download additional functionalities
