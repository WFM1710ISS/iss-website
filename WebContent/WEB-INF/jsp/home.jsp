<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ISS Consulting</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Request for ISS Consulting</h2>
		<p>Pleas fill out the form to request a consulting service from
			ISS:</p>
		<form>
			<div class="form-group">
				<label for="company">Company:</label> 
				<input type="text" class="form-control" id="company">
			</div>
			<div class="form-group">
				<label for="username">Full Name:</label> 
				<input type="text" class="form-control" id="username">
			</div>
			<div class="form-group">
				<label for="email">E-Mail:</label> 
				<input type="text" class="form-control" id="email">
			</div>
			<div class="form-group">
				<label for="phone">Phone:</label> 
				<input type="text" class="form-control" id="phone">
			</div>
			<div class="form-group">
				<label for="street">Street:</label> 
				<input type="text" class="form-control" id="street">
			</div>
			<div class="form-group">
				<label for="zip">Zip-Code:</label> 
				<input type="text" class="form-control" id="zip">
			</div>
 			<div class="form-group">
				<label for="city">City:</label> 
				<input type="text" class="form-control" id="city">
			</div> 
			<div class="form-group">
				<label for="designreq">Design Requirements:</label>
				<textarea class="form-control" rows="5" id="designreq"></textarea>
			</div>
			<div class="form-group">
				<label for="securityreq">Security Requirements:</label>
				<textarea class="form-control" rows="5" id="securityreq"></textarea>
			</div>
		</form>
		
		<input id="confirmBtn" type='submit' class="btn btn-info" value="Submit Button" onclick="startProcess()">
		
	</div>

	<script>
		function startProcess() {

			var inputs = document.getElementsByTagName('input'), empty = 0;

			for (var i = 0, len = inputs.length - 1; i < len; i++) {
				empty += !inputs[i].value;
			}

			if (empty > 0) {
				alert('Please fill out every text field!');
			} else {
				
				var data = {
					"messageName": "instantiationMessage", 
					"processVariables" : { 
						"company" : {"value" : document.getElementById("company").value, "type": "String"}, 
						"username" : {"value" : document.getElementById("username").value, "type": "String"},
						"email" : {"value" : document.getElementById("email").value, "type": "String"},
						"phone" : {"value" : document.getElementById("phone").value, "type": "String"},
						"street" : {"value" : document.getElementById("street").value, "type": "String"},
						"zip" : {"value" : document.getElementById("zip").value, "type": "String"},
						"city" : {"value" : document.getElementById("city").value, "type": "String"},
						"designreq" : {"value" : document.getElementById("designreq").value, "type": "String"},
						"securityreq" : {"value" : document.getElementById("securityreq").value, "type": "String"},
					}
				};

				$.ajax({
					type : 'GET',
					url : "/iss-process/startProcess?company=" + document.getElementById("company").value + "&username=" + document.getElementById("username").value + "&email=" + document.getElementById("email").value + "&phone=" + document.getElementById("phone").value + "&street=" + document.getElementById("street").value + "&zip=" + document.getElementById("zip").value + "&city=" + document.getElementById("city").value + "&designreq=" + document.getElementById("designreq").value + "&securityreq=" + document.getElementById("securityreq").value,

					processData : false,
					success : function(r) {
						console.log('success', r);
						
						alert(r);
							
					},
					
					error: function (request, status, error) {
				        alert(request.responseText);
				    }
				});
			}
		}
	</script>

</body>
</html>