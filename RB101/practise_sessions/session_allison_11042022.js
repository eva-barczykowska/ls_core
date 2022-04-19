function operation(operator) {
  switch (operator) {
    case 1:
      console.log('add');
      break;
    case 2:
      console.log('subtract');
      break;
    case 3:
      console.log('multiply');
      break;
    case 4:
      console.log('divide');
      break;
    default:
      console.log('invalid operator');
  }
}

function otherOperation(operator) {
  switch (operator) {
    case 1: return 'add';
    case 2: return 'subtract';
    case 3: return 'divide';
    case 4: return 'multiply';
    default: return 'invalid operator';
  }

#  const isOdd = (3 % 2 === 1) ? "Yes, it's odd" : "Not odd";

const addTwo = elem => elem + 2;

const addThree = elem => { return elem + 3 };

console.log(addTwo(3));
console.log(addTwo(6));
console.log(addThree(3));

function multiplyByTwo(elem) {
  return elem * 2;
}

const mappedElements = [1, 2, 3].map(multiplyByTwo);
// console.log(mappedElements);

const otherMapped = [1, 2, 3].map(elem => {
  elem * 2;
});

// console.log(otherMapped);


const filteredElements = [1, 2, 3].filter(elem => elem > 2);
// console.log(filteredElements);

// [1, 2, 3].forEach(elem => {
//    console.log(elem);
// });
