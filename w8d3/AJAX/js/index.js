console.log("Hello from the JavaScript console!");

// Your AJAX request here
let weather = $.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log(data);
  },
  error() {
    console.error("An error occured.");
  },
});

// Add another console log here, outside your AJAX request
console.log("AJAX sent");

//1. console.log "sent" gets printed first
//2. response comes back after
//3. current weather in New York is: Overcast clouds, wind speed 2.1, temp 284?!
//4. no
//5. I think AJAX allows you to use any HTTP request, so you could also 
//    POST or DELETE, etc