<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0"/>
<title>재미있는 주식투자정보 - 오락가락</title>

<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
<style type="text/css">
body{
	margin:0;
}

#footer{
	position:relative;
	width:940px;
	margin:0 auto;
}

#sidebar{
	position:fixed;
	margin-left:0px !important;
	z-index:5000;
}

#menuContentPage{
	margin-left:0;
	transition:margin-left .3s;
	min-height: 810px;
}

#menubar{
width: 930px;
margin: 0px auto;
margin-bottom: 10px;
transition: margin-left .3s;
}

/* #menubar{
	position:absolute;
	width:1024px;
	margin:0 auto;
} */
</style>
</head>
<body>
<div>

<div id="sidebar">

<c:if test="${not empty sessionScope.user}">
<jsp:include page="sidebar.jsp" />
</c:if>

		</div>
	
	<div id="menuContentPage">
	<div id="menubar">
	
	<jsp:include page="menu.jsp" />

	</div>
	
	<!-- &&   -->
		<c:choose>
		<c:when test="${not empty contentPage}">
			<jsp:include page="${requestScope.contentPage }" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/pentagon/report.jsp"/>
			
		</c:otherwise>
		</c:choose>
	
	
	<div id="footer">
	<jsp:include page="footer.jsp" />
	</div>
	</div>
	</div>
	
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "99444095d5f8b4";
wcs_do();
</script>
	
</body>
</html>