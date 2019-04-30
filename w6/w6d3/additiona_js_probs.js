function titleize (arr, callback) {
  
  titleizedNames = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleizedNames);
}

// I thought a callback is a function that is passed to another function so it
// would have to be written like this? 
// error: names.myEach is not a function 

// function callback (names) {
//   names.myEach(name => console.log(name));
// }
titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

function Elephant (name, height, tricks) {
  this.name = name; 
  this.height = height;
  this.tricks = [];
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} goes phrRRRRRRRRR!!!!!!`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  let trick = this.tricks[Math.floor(Math.random()*this.tricks.length)];
  console.log(`${this.name} is ${trick}ing!`);
};

Elephant.prototype.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

function dinerBreakfast () {
  let order = "scrambled eggs and bacon"
  console.log(order);

  return function (food) {
    order = `${food} please`;
    console.log(order);
  };

};