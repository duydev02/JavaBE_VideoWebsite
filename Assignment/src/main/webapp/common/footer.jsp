<%@ page pageEncoding="utf-8"%>
<footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
	<div class="container-fluid tm-container-small">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
				<h3 class="tm-text-primary mb-4 tm-footer-title">About DuTube</h3>
				<p>
					DuTube is free <a rel="sponsored" href="#">Bootstrap 5</a>----------------------
				</p>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
				<h3 class="tm-text-primary mb-4 tm-footer-title">Our Links</h3>
				<ul class="tm-footer-links pl-0">
					<li><a href="#">Advertise</a></li>
					<li><a href="#">Support</a></li>
					<li><a href="#">Our Company</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
				<ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
					<li class="mb-2"><a href="https://www.facebook.com/duymoiz/"
						target="_blank"><i class="fab fa-facebook"></i></a></li>
					<li class="mb-2"><a href="https://twitter.com/duymoiz"
						target="_blank"><i class="fab fa-twitter"></i></a></li>
					<li class="mb-2"><a href="https://www.instagram.com/duymoiz/"
						target="_blank"><i class="fab fa-instagram"></i></a></li>
					<li class="mb-2"><a
						href="https://www.pinterest.com/hiimlinhlinh/" target="_blank"><i
							class="fab fa-pinterest"></i></a></li>
				</ul>
				<a href="#" class="tm-text-gray text-right d-block mb-2">Terms
					of Use</a> <a href="#" class="tm-text-gray text-right d-block">Privacy
					Policy</a>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-md-7 col-12 px-5 mb-3">Copyright 2022
				DuTube Company. All rights reserved.</div>
			<div class="col-lg-4 col-md-5 col-12 px-5 text-right">
				Designed by <a href="#" class="tm-text-gray" rel="sponsored"
					target="_parent">HMD</a>
			</div>
		</div>
	</div>
</footer>

<script src="<c:url value='/templates/user/js/plugins.js'/>"></script>
<script>
	$(window).on("load", function() {
		$('body').addClass('loaded');
	});
</script>

<script type="text/javascript">
	$('#changePassBtn').click(function (){
		$('#messageChangePass').text('');
		var currentPass = $('#currentPass').val();
		var newPass = $('#newPass').val();
		var formData = {
				'currentPass': currentPass,
				'newPass': newPass
		};
		$.ajax({
			url: 'changePass',
			type: 'POST',
			data: formData
		}).then(function(data) {
			$('#messageChangePass').text('Your password has been changed successfully');
			setTimeout(function(){
				window.location.href = 'http://localhost:8080/check/index';
			}, 5 * 1000);
		}).fail(function(error){
			$('#messageChangePass').text('Your password is not correct, try again');
		});
	});
</script>