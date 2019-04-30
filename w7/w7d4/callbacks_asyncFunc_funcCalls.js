window.setTimeout(function () {
  alert('HAMMERTIME');
}, 5000);

function hammerTime(time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, 5000);
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin, 
  output: process.stdout
});

function teaBiscuit() {
  reader.question("Would you like some tea?", (res) => {
    console.log(`you replied ${res}.`);
    reader.question("Would you like some biscuits?", (res) => {
      console.log(`you replied ${res}.`);
      const firstRes = (first === 'yes') ? "do" : "don\'t";
      const secondRed = (second === 'yes') ? "do" : "don\'t";
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits?`);
    });
  });

  reader.close();
}

function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();