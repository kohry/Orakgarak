<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>	
	<script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/sha256.js"></script> <%-- 암호화에 대한 js --%>
	<script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/sha1.js"></script>
	<script type="text/javascript" src="./js/scroll/jquery.fullPage.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css" />
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />



<style type="text/css">

#companyList a{
	text-decoration: none;
}

#companyList th{
	text-align: center;
}

#companyList td{
	text-align: center;
}



#name{
	color: #e74c3c;
	font-weight: 700;
}

#top{
position:relative;
width:930px;
	height:70px;
	margin-top:10px;
}

#navigation{
	position: relative;
	top: 0;
	left: 0;
	right: 0;
	height: 50px;
	background: #f3f3f3;
	z-index: 100;
}

#nav_left{
float:left;
padding-left:10px;
}

#nav_right{
float:right;
padding-right:10px;
}

#navigation a{
	display: inline-block;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	padding: 0.2em 0.4em;
	margin: 0 0.4em 0;
	font-size: 0.8em;
	cursor: pointer;
	color: #e74c3c;
	outline: none;
	text-decoration: none;
}

#navigation img{
	margin:15px;
}
#navigation div{
	margin:0;
	background-color: #e74c3c;
	color: white;
}

#navigation li{
	list-style: none;
	display:inline;
}

#logoutBtn{
	display: none;
}

.user{
	display: none;
}

/* 검색창 적용 css*/

#searchStock{
	width: 180px;
	height: 38px;
	padding: 4px!important;
	font: normal 12px "Ruda", Arial, sans-serif;
	color: #b3b3b3;
	border: solid 3px #e74c3c;
	-webkit-border-radius: 0!important;
	-moz-border-radius: 0!important;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 0!important;
}

#search_form{
position: absolute;
right: 0px;
top: 26px;
}

 #searchBtn{
	
	position: relative;
	border: none;
	background-color: #e74c3c;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 50px;
}


/* hover 효과*/

.hovereffect:hover{
	color: #FFFFFF;
	background-color: #e74c3c;
}

#logo_img{
width:230px;
}


</style>

<script type="text/javascript">

$(document).ready(function() {
	
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

function singupSubmit(){
$('.ui.form.signup')
  .form({
	  			  
	  email:{
	    	identifier:'email',
	    	rules:[
				{
				type:'empty',
	    		prompt:'이메일을 입력해주세요'
				},
				{
					type:'email',
					prompt:'이메일 형식을 확인해주세요'
				}
				
	    ]
	    
	    },
	    
	    name:{
		    identifier:'name',
		    rules:[
		      {
		    	  type:'empty',
		    	  prompt:'이름을 입력해주세요'
		      }
		      ]
		    },
	  
	  password: {
      identifier: 'password',
      rules: [
        {
          type: 'empty',
          prompt: '비밀번호를 입력해주세요'
        },
         {
          type: 'match[password2]',
          prompt: '비밀번호체크를 확인해주세요'
        }
      ]
    },
    		    
  age:{
    	identifier:'age',
    	rules:[
			{
				type:'empty',
    			prompt:'나이를 입력해주세요'
			}						
    ]
    
    },
    phone:{
    	identifier:'phone',
    	rules:[
			{
				type:'empty',
    			prompt:'연락처를 입력해주세요'
			}						
    ]
    
    }
  
  });
}
	
	$("#loginBtn").click(function() {
		$('.ui.modal.login').modal('show');
	});

	$("#signupBtn").click(function() {
		$('.ui.modal.signup').modal('show');
	});
	
	
$("#loginbutton").click(loginSubmit);
$(document).keydown(function(e){
	if(e.keyCode == 13){
		loginSubmit();
	}
});


function loginSubmit(){
	
	
	
	$.getJSON("${pageContext.request.contextPath }/user_login.do",
			{"email":$("#logemail").val(),
			 "password":CryptoJS.SHA256($("#logpassword").val()).toString(CryptoJS.enc.Base64)}, function(jsonObj){					 
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

	$("#logoutBtn").click(function(){
		$.getJSON("${pageContext.request.contextPath}/user_logout.do",
			function(jsonObj){
			if(jsonObj.status){
				$("#loginBtn").show();
				$("#signupBtn").show();
				$("#logoutBtn").hide();
				$("#name").hide();
				$(".user").hide();
				
			}
		}
		);
		location.href="${pageContext.request.contextPath}/stock_detail.do";
	});

	
	
	$("#searchBtn").click(searchButtonClicked);	//searchBtn
	
	 $(document).keypress(function (e) {
        if (e.keyCode == 13) {
        	searchButtonClicked();
        }
		
        
    });	
	
	function searchButtonClicked() {
		//alert(document.getElementById("searchStock").value);
		
		$.post("${pageContext.request.contextPath}/search.do",
		{"searchStock" : document.getElementById("searchStock").value},
		function(jsonObj) {
			if (jsonObj.status) {
				$("#companyList tbody").empty();
				$(jsonObj.companyList).each(function(index, item) {
					
					
					var code = item.stockCode;
					var name = item.stockName;
									
					var td1=$('<td/>').html(code);
					var td2=$('<td/>').html(name);
					var a=$('<a/>').attr("href","${pageContext.request.contextPath}/stock_detail.do?stockCode="+code).append(td2);
					var tr=$('<tr/>').append(td1,a);
					tr.appendTo('#companyList tbody');
												
				});
				
				$('.small.modal.search').modal('show');
				
			}
			
		});
		
	
					
	}

 	
	
}); //ready

 
</script>

 <div id="top">
 <div id="logo">
    <a href="${pageContext.request.contextPath }/stock_detail.do?stockCode=${sessionScope.favorite.favList[0].stockCode}"><img src="./img/so_1.png" id="logo_img" /></a>
      </div>
       	<div id="search_form">
     <input type="text" id="searchStock" name="searchStock" placeholder="종목을 입력하세요.."/>
   		 <input type="submit" value="검색" id="searchBtn"/>   	
       	</div>
   
  </div>
  
  <div id="navigation">
   <ul id="nav_left">
 	  
 	   <li>
      <a href="${pageContext.request.contextPath }/welcome.do">오락가락이란</a>
      </li>
      
 	  <li>
      <a href="${pageContext.request.contextPath }/board_list.do">토론게시판</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/detail_search.do">상세검색</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/rank_and_search.do">랭킹</a>
      </li>
      
      
      <li>
      <a href="${pageContext.request.contextPath }/favorite.do">즐겨찾기</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/simulation.do">시뮬레이션센터</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/prefer_test.do">투자성향테스트</a>
      </li>
      
      <c:if test="${sessionScope.user.email == 'admin@orakgarak.com' }">
      <li>
      <a href="${pageContext.request.contextPath }/admin_management.do">ADMIN</a>
      </li>
      </c:if>
      
    </ul>
    
    <ul id="nav_right">
    <c:choose>
    <c:when test="${not empty sessionScope.user}">
    	
    	<li>
 	  		<span><i class="user icon" style="margin-right:0;"></i><a href="${pageContext.request.contextPath }/mypage.do" id="name" style="color:black; margin-left:0; margin-right:0;">${sessionScope.user.name }</a></span>
 	  	</li>
 	  	<li>
     		<a id="logoutBtn">LOGOUT</a>
     	</li>
     	<li>
     	 <a id="loginBtn" style="display: none">LOGIN</a>
      	</li>
		<li>
   	 	  <a id="signupBtn" style="display: none">회원가입</a>
 		</li>
    </c:when>
    
    <c:otherwise>
    	<li>
 	  		<span><i class="user icon" style="margin-right:0; display: none"></i><a href="${pageContext.request.contextPath }/mypage.do" id="name" style="color:black; margin-left:0; margin-right:0;">${sessionScope.user.name }</a></span>
 	  	</li>
 	  	<li>
     		<a id="logoutBtn" style="display: none">LOGOUT</a>
     	</li>
     	<li>
     	 <a id="loginBtn">LOGIN</a>
      	</li>
		<li>
   	 	  <a id="signupBtn">회원가입</a>
 		</li>
    </c:otherwise>
    </c:choose>
   	  
 	  
      
    </ul>
  </div>




<div class="ui small modal search">
  <i class="close icon"></i>
  <div class="header">
    검색결과
  </div>
  <div class="content" style="margin:0px auto">
    <div class="left">
      	<table class="ui basic table" id="companyList">
  			<thead>
    			<tr>
    				<th>종목코드</th>
    				<th>회사명</th>
 				</tr>
  			</thead>
  			<tbody>
  			</tbody>
</table>
    </div>
  </div>
</div>

<!-- 로그인모달입니다. -->
	<div class="ui modal small login">
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
							<input type="text" placeholder="Enter your Email" name="email" id="logemail">
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
								name="password" id="logpassword"> <i class="lock icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					<div class="ui error message">
						<div class="header">아이디/비밀번호를 다시 확인해주세요</div>
					</div>
					<div>
						<button class="ui red submit button" id="loginbutton">LogIn</button>
						<!-- <input type="submit" value="LogIn" class="ui red submit button"> -->
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>

<!-- 사인업모달입니다. -->
	<div class="ui modal small signup">
		<i class="close icon"></i>
		<div class="header">SignUp</div>

		<div class="content">
			<div class="ui form segment signup" id="updatebox">
				<form method="post" action="${pageContext.request.contextPath}/user_regist.do">
					<div class="field">
						<label>Email &nbsp;&nbsp;<span id="idMsg"></span></label>
						<input type="text" id="email" name="email">
					</div>
					<div class="field">
						<label>Name &nbsp;&nbsp;<span id="nameMsg"></span></label>
						<input type="text" id="name" name="name">
					</div>
					<div class="field">
						<label>Password</label>
						<input type="password" id="password" name="password">
					</div>
					<div class="field">
						<label>Password Check</label>
						<input type="password" id="password2">
					</div>
					<div>
						<input type="submit" value="등록" id="submitBtn"
							class="ui red submit button" />
					</div>
				</form>
				<div class="ui error message"></div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "99444095d5f8b4";
wcs_do();
</script>

  
<!--   <div id="searchWrapper">
	<div id="searchbox">
    <input type="text" id="searchStock" name="searchStock" placeholder="검색할 종목을 입력하세요.."/>
    <input type="submit" value="검색" id="searchBtn"/>
    </div>
</div> -->
  
<!-- </form> -->