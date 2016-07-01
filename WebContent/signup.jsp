<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>	
	<script type="text/javascript" src="./js/scroll/jquery.fullPage.js"></script>
	<script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/sha256.js"></script>
	<script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/sha1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css" />
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />


<script type="text/javascript">

$(document).ready(function() {
	
	$('#notloggedin').modal('show'); 
	$("#btn_login").click(loginSubmit);
	
	$("#email").blur(function(){
		
		$.getJSON("${pageContext.request.contextPath}/check_id.do",
				{"email" : $("#email").val()},
				function(jsonObj){
					if(jsonObj.status){
						$("#idMsg").text(jsonObj.message);
						$("#registBtn").attr('disabled',false);
					}else{
						$("#email").focus();
						$("#idMsg").text(jsonObj.message);
						$("#registBtn").attr('disabled',true);
					}
			});
	
});


$("#name").blur(function(){
	
	$.post("${pageContext.request.contextPath}/check_name.do",
			{"name" : $("#name").val()},
			function(jsonObj){
				if(jsonObj.status){
					$("#nameMsg").text(jsonObj.namemessage);
					$("#submitBtn").attr('disabled',false);
				}else{
					$("#name").focus();
					$("#nameMsg").text(jsonObj.namemessage);
					$("#submitBtn").attr('disabled',true);
				}
		});

});




$(document).keydown(function(e){
	if(e.keyCode == 13){
		loginSubmit();
	}
});


function loginSubmit(){
	
	$.getJSON("${pageContext.request.contextPath }/user_login.do",
			{"email":$("#input_email").val(),
			 "password":CryptoJS.SHA256($("#input_pw").val()).toString(CryptoJS.enc.Base64)}, function(jsonObj){					 
				if(jsonObj.status){
					if(jsonObj.favorite!=null){
					var stockCode=jsonObj.favorite.favList[0].stockCode;
					console.log("stockCode:"+stockCode);
					location.replace("${pageContext.request.contextPath}/stock_detail.do?stockCode="+stockCode);
					}else{
						location.replace("${pageContext.request.contextPath}/stock_detail.do?stockCode=005930");
					}
					
				}else{
					$(".login.field").addClass("error");
					$("#headermsg").remove();
					$(".header.login").empty();
					$('<span/>').html(" 아이디와 비밀번호를 확인해주세요").css('color',"#E75859").css('font-family',"font-family:'Nanum Gothic' !important").appendTo(".header.login");
				};
			});
	
};

	});
	</script>



		<div id="notloggedin" class="ui modal small">
		<i class="close icon"></i>
		<div class="header login">
			<div id="headermsg">LogIn</div>
		</div>

		<div class="content">
			<div class="ui form segment">
				<%-- <form action="${pageContext.request.contextPath }/user_login.do" --%>
					<!-- method="post"> -->
					<div class="login field">
						<label>Username</label>
						<div class="ui left labeled icon input">
							<input type="text" placeholder="Enter your Email" name="email" id="input_email">
							<i class="user icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					<div class="login field">
						<label>Password</label>
						<div class="ui left labeled icon input">
							<input type="password" placeholder="Enter your password"
								name="password" id="input_pw"> <i class="lock icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					<div class="ui error message">
						<div class="header">아이디/비밀번호를 다시 확인해주세요</div>
					</div>
					<div>
						<button class="ui red submit button" id="btn_login">LogIn</button>
						<!-- <input type="submit" value="LogIn" class="ui red submit button"> -->
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>

