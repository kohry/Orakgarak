<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
<style type="text/css">
body{
	margin:0;
	background: #E64A3C;
	font-family: 'Nanum Gothic' !important;
	color:white;
}
</style>
</head>
<body>
<h1>400 ERROR</h1>
<div style="width:480px; margin:40px auto;">
<a href="${pageContext.request.contextPath }/welcome.jsp"><img src="image/errorant.png"></a>
<img src="image/400error.png">
</div>

<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "99444095d5f8b4";
wcs_do();
</script>

</body>
</html>