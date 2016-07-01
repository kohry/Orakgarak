<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$.getJSON("calculateDCF.do",{"code":"005930"},function(jsonData) {
		console.log(jsonData);
	});
	
});

</script>
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "99444095d5f8b4";
wcs_do();
</script>

<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "99444095d5f8b4";
wcs_do();
</script>

</body>
</html>