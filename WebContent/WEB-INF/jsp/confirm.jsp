<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div align="center">
		<h1>${message}</h1>
	</div>
	
	<div class="container">
  	<h2>Button</h2>
  		<p>The .btn class adds basic styling to a button:</p>
  		<button type="button" class="btn">Basic Button</button>
	</div>
	
	<div class="container">
  		<h2>Button Methods</h2>
		  <p>The <strong>toggle</strong> method makes the button look pressed. Click on both buttons, but also click outside the button afterwards to see the difference.</p>
		  <button type="button" class="btn btn-default">Button (toggle)</button>
		  <button type="button" class="btn btn-default">Button (no toggle)</button>
	</div>

<script>
$(document).ready(function(){
    $(".btn-default:first").click(function(){
        $(this).button('toggle');
    });   
});
</script>

<button type="button"
onclick="document.getElementById('demo').innerHTML = Date()">
Click me to display Date and Time.</button>

<p id="demo"></p>

<h2>JavaScript Alert</h2>

<button onclick="myFunction()">Try it</button>

<script>
function myFunction() {
    alert("I am an alert box!");
}
</script>


<h2>JavaScript Prompt</h2>

<button onclick="myFunction()">Try it</button>

<p id="demo"></p>

<script>
function myFunction() {
    var txt;
    var person = prompt("Please enter your name:", "Harry Potter");
    if (person == null || person == "") {
        txt = "User cancelled the prompt.";
    } else {
        txt = "Hello " + person + "! How are you today?";
    }
    document.getElementById("demo").innerHTML = txt;
}
</script>
</body>
</html>
