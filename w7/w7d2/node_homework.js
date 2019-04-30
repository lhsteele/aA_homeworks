function madLib(verb, adj, noun) {
... console.log(`We shall ${verb} the ${adj} ${noun}`)
... }

function isSubstring(searchString, subString) {
... console.log(searchString.includes(subString));
... }

function fizzBuzz(arr) {
	let result = [];
... arr.forEach(function(i)) {
		if i % 3 === 0 || i % 5 === 0 {
			result.push(i)
		}
	}
	return result 
}

function isPrime(n) {
	if (n < 2) {return false;}
	for (let i = 2; i < n; i++) {
		if (n % i === 0) {
			return false;
		}
	}
	return true;
}


