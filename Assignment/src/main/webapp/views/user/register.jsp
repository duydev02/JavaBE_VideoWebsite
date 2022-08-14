<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-12 col-12 mb-5">
				<center>
					<h2 class="tm-text-primary mb-5">Register</h2>
				</center>
				<form id="register-form" action="register" method="POST"
					class="tm-contact-form mx-auto">
					<div class="form-group">
						<input type="text" name="username" class="form-control rounded-0"
							placeholder="UserName" required />
					</div>
					<div class="form-group">
						<input type="password" name="password" id="password"
							class="form-control rounded-0" placeholder="Password" required />
					</div>
					<div class="form-group">
						<input type="password" name="cfmPass" id="cnfrm-password"
							class="form-control rounded-0" placeholder="Confirm Password"
							required />
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control rounded-0"
							placeholder="Email" required />
					</div>
					<div class="form-group">
						<h6 class="tm-text-primary mb-4" id="message">
							${param.message}
						</h6>
					</div>
					<div class="form-group tm-text-right">
						<input type="submit" id="send-submit" value="Send"
							class="btn btn-primary" onclick="checkPassword()">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
		function checkPassword() {
		    if($("#password").val() == $("#cnfrm-password").val()) {
		        $("#message").text("Password match")
		    } else {
		        $("#message").text("Password don't match")
		    }
		}
		$("#send-submit").click(function(event){
			if ($("#password").length != 0) {
				if ($("#password").val() == $("#cnfrm-password").val()) {
					$("#message").text("Password match")
                    event.preventDefault()
					$("#send-submit").parents("form:first").submit()
				} else {
					$("#message").text("Password don't match")
					event.preventDefault()
				}
			}
			console.log("cc")
		}); -->
	</script>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>