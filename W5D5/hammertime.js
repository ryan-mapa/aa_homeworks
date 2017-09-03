const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// function hammerTime(time) {
//   setTimeout( function() {
//     // alert(`${time} is hammertime!`);
//     console.log('HAAAAAMMMERTIIIIME!!!');
//   }, time);
// }

// reader.question('HUNGRY FOR APPLES?!', (reply) => {
//   console.log(`${reply}`);
//
//   reader.question('ARE YOU SURE?!', (reply2) => {
//     console.log(`You said ${reply} to APPLEZ and then ${reply2}, FOO!`);
//     // reader.close();
//   });
//
//   reader.close();
// });
//
function hungryForApples () {
    reader.question('HUNGRY FOR APPLES?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('ARE YOU SURE?', function (res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want APPLEZ and you ${second}
                  want MORE APPLEZ.`);
      reader.close();
    });
  });
}
