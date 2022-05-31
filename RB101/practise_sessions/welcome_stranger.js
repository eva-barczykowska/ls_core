/*Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces,
will produce a person's name. The hash will contain two keys, :title and
:occupation, and the appropriate values. Your method should return a greeting
that uses the person's full name, and mentions the person's title and occupation.
*/

/*
  ALGORITHM
    declare `fullName` and init to input array joined on spaces.
    declare `title` and init to input object property 'title'
    delcare `occupation` and init to input object property 'occupation'
    return the string `Hello, ${fullName}! Nice to have a ${title} ${occupation} around.`
*/

function greetings(nameArr, jobObj) {
  const fullName = nameArr.join(" ");
  const title = jobObj.title;
  const occupation = jobObj.occupation;

  return `Hello, ${fullName}! Nice to have a ${title} ${occupation} around.`
}

console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));
