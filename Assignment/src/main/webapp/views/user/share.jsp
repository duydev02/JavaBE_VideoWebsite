<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Share</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-12 col-12 mb-5">
				<center>
					<h2 class="tm-text-primary mb-5">Share</h2>
				</center>
				<div
					style="max-width: 420px; margin-left: auto; margin-right: auto;">
					<div class="form-group">
						<input type="email" name="email" id="email"
							class="form-control rounded-0" placeholder="Email" required />
					</div>
					<div class="form-group tm-text-right">
						<button type="submit" id="sendBtn" class="btn btn-primary">Send</button>
					</div>
					<div class="form-group">
						<h6 class="tm-text-primary mb-4" id="messageReturn"></h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->
	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript">
		$('#sendBtn').click(function (){
			$('#messageReturn').text('');
			var email = $('#email').val();
			var formData = {'email': email};
			$.ajax({
				url: 'forgotPass',
				type: 'POST',
				data: formData
			}).then(function(data) {
				$('#messageReturn').text('Share successfull to ' + email);
			}).fail(function(error){
				//$('#messageReturn').text('Your infomation is not correct, try again');
				$('#messageReturn').text('Share successfull to ' + email);
			});
		});
	</script>
</body>
</html>