
 // Constructs
 // If-else chains
 // switch statements
 // for loops
 // while loops

 const num = 3;
 const hello = 'hello';

 if (num === 3) {
   console.log('Num equal to 3.');
 } else if (num > 3) {
   console.log('Num is greater than 3.');
 } else {
   console.log('Num is equal to 3.');
 }

 switch (num) {
   case 1:
     console.log("Num is 1.");
     break;
   case 2:
     console.log("Num is 2.");
     break;
   case 3:
     console.log("Num is 3.");
     break;
   case 4:
     console.log("Num is 4.");
    break;
   default: console.log('No cases applied.');
 }

 for (let i = 0; i <= 0; i += 2) {
   console.log(hello[i]);
 }

 // Initial expression; condition expression; increment expression

 let i = 0;
 while (true) {
   console.log(hello[i]);
   i += 2;

   if (i > hello.length) break;
 }

 // JavaScript has two types of equality: loose equalty and strict equality
 // Loose equality is done with the double equals; ==
Strict equality is done with the tripple equals; ===

The difference between them is that loose equality will
 perform type coherseion on the operands if they are of
 different types.

 const hello = 'hello';

if ('2' == 2) console.log('was true!');
 if ('2' === 2) console.log('was true!');
