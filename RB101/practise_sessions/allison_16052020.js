// You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.


// Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

console.log(is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true);
console.log(is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false);
console.log(is_valid_walk(['w']) == false);
console.log(is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false);

/*
  PROBLEM
    - input is an array with single-character string elements that represent cardinal directions.
    - Output is a boolean that represents whether the given directions put you at your starting position within ten steps.
    - input array will always contain at least one element
    - input will always be a valid array
    - assume characters will always be lower-case

  Note:
    - I want to use math for this.
    - If a resulting sum is 0, then I have 'made it back'
    - N/S will +1/-1
    - E/W will +2/-2
    ['n', 'e', 's', 'w'] => 1 + 2 - 1 - 2 = 0

  ALGORITHM
    if the input array is not ten elements long, return false

    declare `sum` and init to 0

    iterate over the input array
      if current char is 'n' - add 1 to `sum`
      if current char is 's' - subtract 1 from `sum`
      if current char is 'e' - add 2 to `sum`
      if current char is 'w' - subtract 2 from `sum`
    end iteration

    return `sum` is equal to zero
*/

function is_valid_walk(arr) {
  if (arr.length !== 10) return false;

  let sum = 0;
  for (let i = 0; i < arr.length; i++) {
    const char = arr[i];
    if (char === 'n') sum += 1;
    if (char === 's') sum -= 1;
    if (char === 'e') sum -= 1;
    if (char === 'w') sum -= 1;
    // console.log(`Sum is: ${sum}, dir is: ${char}.`);
  }

  return sum === 0;
}
