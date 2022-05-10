// # Practice Problem 16

// # A UUID is a type of identifier often used as a way to uniquely identify items,
// # which may not all be created by the same system. That is, without any form of
// # synchronization, two or more separate computer systems can create new items,
// # and label them with a UUID with no significant chance of stepping on each
// # other's toes.

// # It accomplishes this feat through massive randomization. The number of
// # possible UUID values is approximately 3.4 X 10E38.
// #
// # Each UUID consists of 32 hexadecimal characters, and is typically broken into
// # 5 sections like this 8-4-4-4-12 and represented as a string.
// #
// # 123456789abcdf
// # It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9ffaa1-a91"

// # Write a method that returns one UUID when called with no parameters.

/*
  PORBLEM
    Input is nothing
    Output is a string that represents a UUID.
    A UUID consists of 32 hexidecimal characters
    A UUID is broken into 5 sections with the format of: 8-4-4-4-12 characters per section
    An example UUID would would look like: "f65c57f6-a6aa-17a8-faa1-a67f2dc9ffaa1-a91"
    Hexidecimal characters are the set of [1-9] and [a-f]

  ALGORITHM
    declare variable `hexChars` and init to the string `123456789abcdef`
    declare variable `uuid` and init to empty string

    iterate from 0 to 8
      choose a random character from `hexChars` and concat it to `uuid`
      (choose a random character by chooseing a random index in the range of `hexChars` length)
      (accessing the character of `hexChars` at the random length)
    end iteration

    concat a dash character onto `uuid`

    iterate from 0 to 4
      choose a random character from `hexChars` and concat it to `uuid`
    end iteration

    concat a dash character onto `uuid`

    iterate from 0 to 4
      choose a random character from `hexChars` and concat it to `uuid`
    end iteration

    concat a dash character onto `uuid`

    iterate from 0 to 4
      choose a random character from `hexChars` and concat it to `uuid`
    end iteration

    concat a dash character onto `uuid`

    iterate from 0 to 12
      choose a random character from `hexChars` and concat it to `uuid`
    end iteration

    return `uuid`
*/

// function makeUuid() {
//   const hexChars = `123456789abcdef`;
//   let uuid = "";

//   for (let i = 0; i < 8; i++) {
//     const randomIndex = Math.floor(Math.random() * hexChars.length);
//     uuid += hexChars[randomIndex];
//   }

//   uuid += `-`;

//   return uuid;
// }

// console.log(makeUuid());


// - Spend more time on the problem description and understanding
// - The problem of 'I don't know what the solution is; I'd rather figure it out in code first'


/*
  PROBLEM
    Input is nothing
    Output is a string that represents a UUID.
    A UUID consists of 32 hexidecimal characters
    A UUID is broken into 5 sections with the format of: 8-4-4-4-12 characters per section
    An example UUID would would look like: "f65c57f6-a6aa-17a8-faa1-a67f2dc9ffaa1-a91"
    Hexidecimal characters are the set of [1-9] and [a-f]

  Notes:
    - I want to try to see if I can solve this with character codes.
    - Use Math.random to choose a character code.
    - And I want to do this in one loop instead of several
    - Are the dashes part of the 32 characters? 8 + 4 + 4 + 4 + 12 = 32 So; no.
    - So; my loop needs to be 32 + 4 dashes is 36 iterations.

  ALGORITHM
    declare variable `hexChar` and init to string `123456789abcdef`
    declare variable `uuid` and init to empty string

    iterate from 0 to 32
      append random hex value to `uuid` from `hexChar`
    end iteration

    insert `dash` at 8-4-4-4 intervals to `hexChar`.

    return `uuid`
*/

/*
  deeclare `hexChars` and init to 'some value'
  declare `uuid` and init to an empty string


*/


function uuid() {
  const hexChars = `123456789abcdef`;
  let uuid = "";

  for (let i = 0; i < 32; i++) {
    const randomIndex = Math.floor(Math.random() * hexChars.length);
    uuid += hexChars[randomIndex];
  }

  const uuidArr = [...uuid];
  uuidArr.splice(8, 0, `-`);
  uuidArr.splice(13, 0, `-`);
  uuidArr.splice(18, 0, `-`);
  uuidArr.splice(23, 0, `-`);

  return uuidArr.join('');
}

console.log(uuid());
