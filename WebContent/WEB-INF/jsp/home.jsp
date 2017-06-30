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
				<label for="username">Full Name:</label> 
				<input type="text" class="form-control" id="username">
			</div>
			<div class="form-group">
				<label for="email">E-Mail:</label> 
				<input type="text" class="form-control" id="email">
			</div>
			<div class="form-group">
				<label for="amount">Amount:</label> 
				<input type="text" class="form-control" id="amount">
			</div>
  
			<div class="form-group">
				<label for="comment">Comment:</label>
				<textarea class="form-control" rows="5" id="comment"></textarea>
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
					"messageName": "instantiationMessage", "processVariables" : { "amount" : {"value" : document.getElementById("amount").value, "type": "Double"}, "username" : {"value" : document.getElementById("username").value, "type": "String"},"email" : {"value" : document.getElementById("email").value, "type": "String"},"invoiceDocument" : {"value" : "TESTTEST", "type": "String"}}
				};

				$.ajax({
					type : 'GET',
					url : "/iss-process/create?username=" + document.getElementById("username").value + "&email=" + document.getElementById("email").value + "&amount=" + document.getElementById("amount").value + "&comment="+ document.getElementById("comment").value,
					processData : false,
					success : function(r) {
						console.log('success', r);
						
						alert(r);
							
						location.reload();
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