<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!-- slider css -->
 <script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report_slider/demo.css">

<!--   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
 -->
 
  <!-- Bootstrap core CSS -->
    <link href="css/dcf/bootstrap.css" rel="stylesheet">
    <link href="css/dcf/jquery.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dcf/main.css" rel="stylesheet">

 <!--  Fonts from Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,900' rel='stylesheet' type='text/css'>
 		<script src="js/dcf/jquery.cookie.js"></script>
		<script src="js/dcf/bootstrap.min.js"></script>
		<link rel="shortcut icon" href="../favicon.ico">
		<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" type="text/css" href="css/dcf/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/component.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/content.css" />
		<link rel="stylesheet" type="text/css" href="css/dcf/orakgarak.css"/>
		<script src="js/dcf/modernizr.custom.js"></script>
		
		

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">


	
	function hide(){
		
		$(".rft, .fst").hide();
	
	}

	function close(){
		$("#myModal").remove();
		$(".modal-backdrop").hide();
		

	}
	
	function calculateScoreAndPrice(){
		
		var currentPrice = "${requestScope.price}";
		var valPrice = $("#dcfVal").text();
    	var calculatedPrice = valPrice/currentPrice;
    	var calculatedScore = calculatedPrice*100/1.8;
    	if((calculatedScore)>=90){
    		$("#results").text("강력매수");
    	}else if((calculatedScore)>=70){
    		$("#results").text("매수");
    	}else if((calculatedScore)>=50){
    		$("#results").text("중립");
    	}else if((calculatedScore)>=35){
    		$("#results").text("매도");
    	}else{
    		$("#results").text("강력매도");
    	}
    	
    	
    	
    	if(calculatedPrice>=7){
    		$("#score").text("100");
    	}else if(calculatedPrice>=6){
    		$("#score").text("99");
    	}else if(calculatedPrice>=5){
    		$("#score").text("98");
    	}else if(calculatedPrice>=4){
    		$("#score").text("97");
    	}else if(calculatedPrice>=3){
    		$("#score").text("96");
    	}else if(calculatedPrice>=2){
    		$("#score").text("95");
    	}else if(calculatedPrice<2 && calculatedScore>=100.1){
    		$("#score").text("82");
    	}else if(calculatedScore<2 && calculatedScore<101 && calculatedScore>=50){
    		$("#score").text(Math.round(calculatedScore)-5);
    	}else{
    		$("#score").text(Math.round(calculatedScore));
    	}
    	
    	var highestScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>저평가</span> 되어 있는것으로써 앞으로 오를 가능성이 매우 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
		var highScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>저평가</span> 되어 있는것으로써 앞으로 오를 가능성이 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
		var averageScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>적절하게 </span> 반영 되어 있는것으로써 앞으로 주식가격 변화폭이 적을 가능성이 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
		var lowScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>높게</span> 반영 되어 있는것으로써 앞으로 주식가격이 내려갈 가능성이 있는 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
		var lowestScore = $("#2013_name").text()+"에 대한 투자 의견은 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#results").text()+ "</span>"+" 이며, 오락가락에서 환산된 투자 점수는 "+ "<span style='font-weight: bold; color: #e64a3c;'>" +$("#score").text()+ "</span>"+"점 입니다 (100점 만점). 점수는 신뢰구간 (confidence interval) 표본을 사용하여 환산 하였습니다. 이론 가격대비 실제 주식가격이 <span style='font-weight: bold; color: #e64a3c;'>매우 높게</span> 반영 되어 있는것으로써 앞으로 주식가격이 내려갈 가능성이 매우 높은 주식입니다. 개별 회사의 향후에 미칠 호재등은 감안이 안된 철저히 재무재표에 기반한 이론 가격이므로 오락가락에서 제공하는 다른 가치평가 모델을 확인해 보시고 투자를 결정하시길 바랍니다.";
		
		
		if(($("#score").text())>=90){
			$("#description").html(highestScore);
			$("#description2").html(highestScore);
		}else if(($("#score").text())>=80){
			$("#description").html(highScore);
			$("#description2").html(highScore);
		}else if(($("#score").text())>=60){
			$("#description").html(averageScore);
			$("#description2").html(averageScore);
		}else if(($("#score").text())>=40){
			$("#description").html(lowScore);
			$("#description2").html(lowScore);
		}else{
			$("#description").html(lowestScore);
			$("#description2").html(lowestScore);
		}
    	
	}
	
	function updatePentagon(){
		var code = $("#2013_code").text();
		 $.post("${pageContext.request.contextPath}/dcfPentagon_update.do?stockCode="+code,
			
				
				 {"scoreDcf" : $("#score").text()});
	
		
		}
	
	function insertGrowth(){
		$.post("${pageContext.request.contextPath}/select_growth.do",
				{"indName": $("#2013_indName").text()}
				,
				function(jsonObj) {
				 if(jsonObj.status){
					$("#2013_growth").text(jsonObj.growth);
				 }else{
					 $("#2013_growth").text(0.012);
				 }
			 });
	
			
		
		}
	
	
	function insertCostOfDebt(){
		
		$.post("${pageContext.request.contextPath}/select_costofdebt.do",
				{"code": $("#2013_code").text(),
					"year": $("#2013_year").text()}
				,
				function(jsonObj) {
				 if(jsonObj.status){
					$("#2013_kd").text(jsonObj.kd);
				 }else{
					 $("#2013_kd").text(0);
				 }
			 });
	
			
		
		}
	

	
	function updateScore(){
		var code = $("#2013_code").text();
		var year = $("#2013_year").text();
		 $.post("${pageContext.request.contextPath}/dcf_update.do?code="+code+"&&year="+year,
		
			
			 {"score" : $("#score").text()});
	
	}
	
	function manual(){
		$('#yourModal').modal({show:true,
			keyboard: false,
			backdrop: 'static'
			
		});
	 	$("#yourModal").show();
		
	 	
	 	
	 	
		/* $(".modal-backdrop").show(); */
	}
	
	function revenueCalc(){
		 var year1_revenue = $("#2009_revenue").text();
		    var year2_revenue = $("#2010_revenue").text();
		    var year3_revenue = $("#2011_revenue").text();
		    var year4_revenue = $("#2012_revenue").text();
		    var year5_revenue = $("#2013_revenue").text();
		    var year2_growth = Math.pow(Math.round(year2_revenue/year1_revenue), 1/2)-1;
		    var year3_growth = Math.pow(Math.round(year3_revenue/year1_revenue), 1/3)-1;
		    var year4_growth = Math.pow(Math.round(year4_revenue/year1_revenue), 1/4)-1;
		    var year5_growth = Math.pow(Math.round(year5_revenue/year1_revenue), 1/5)-1;
			var avgRevenueGrowth = (year2_growth+year3_growth+year4_growth+year5_growth)/4;
		   	if(avgRevenueGrowth>=0.3){
		   		avgRevenueGrowth = 0.3
		   	}else if(avgRevenueGrowth<=-0.3){
		   		avgRevenueGrowth = -0.3
		   	}else{avgRevenueGrowth;}
		   	
		   	var f1 = year5_revenue*(1+avgRevenueGrowth);
		   	var f2 = f1*(1+avgRevenueGrowth);
		   	var f3 = f2*(1+avgRevenueGrowth);
		   	var f4 = f3*(1+avgRevenueGrowth);
		   	$("#2014_rev").text(Math.round(f1));
		   	$("#2015_rev").text(Math.round(f2));
		   	$("#2016_rev").text(Math.round(f3));
		   	$("#2017_rev").text(Math.round(f4));
		   	
		
	}
	
	function cogsCalc(){
		var year1_cogs = $("#2009_cogs").text();
	    var year2_cogs = $("#2010_cogs").text();
	    var year3_cogs = $("#2011_cogs").text();
	    var year4_cogs = $("#2012_cogs").text();
	    var year5_cogs = $("#2013_cogs").text();
	    var year2_growth = Math.pow(Math.round(year2_cogs/year1_cogs), 1/2)-1;
	    var year3_growth = Math.pow(Math.round(year3_cogs/year1_cogs), 1/3)-1;
	    var year4_growth = Math.pow(Math.round(year4_cogs/year1_cogs), 1/4)-1;
	    var year5_growth = Math.pow(Math.round(year5_cogs/year1_cogs), 1/5)-1;
		var avgCOGSGrowth = (year2_growth+year3_growth+year4_growth+year5_growth)/4;
	   	if(avgCOGSGrowth>=0.3){
	   		avgCOGSGrowth = 0.3
	   	}else if(avgCOGSGrowth<=-0.3){
	   		avgCOGSGrowth = -0.3
	   	}else{avgCOGSGrowth;}
	   	
	   	var f1 = year5_cogs*(1+avgCOGSGrowth);
	   	var f2 = f1*(1+avgCOGSGrowth);
	   	var f3 = f2*(1+avgCOGSGrowth);
	   	var f4 = f3*(1+avgCOGSGrowth);
	   	$("#2014_cogs").text(Math.round(f1));
	   	$("#2015_cogs").text(Math.round(f2));
	   	$("#2016_cogs").text(Math.round(f3));
	   	$("#2017_cogs").text(Math.round(f4));

	}
	
	function sgaCalc(){
		var year1_sga = $("#2009_sga").text();
	    var year2_sga = $("#2010_sga").text();
	    var year3_sga = $("#2011_sga").text();
	    var year4_sga = $("#2012_sga").text();
	    var year5_sga = $("#2013_sga").text();
	    var year2_growth = Math.pow(Math.round(year2_sga/year1_sga), 1/2)-1;
	    var year3_growth = Math.pow(Math.round(year3_sga/year1_sga), 1/3)-1;
	    var year4_growth = Math.pow(Math.round(year4_sga/year1_sga), 1/4)-1;
	    var year5_growth = Math.pow(Math.round(year5_sga/year1_sga), 1/5)-1;
		var avgSgaGrowth = (year2_growth+year3_growth+year4_growth+year5_growth)/4;
	   	if(avgSgaGrowth>=0.3){
	   		avgSgaGrowth = 0.3
	   	}else if(avgSgaGrowth<=-0.3){
	   		avgSgaGrowth = -0.3
	   	}else{avgSgaGrowth;}
	   	
	 	var f1 = year5_sga*(1+avgSgaGrowth);
	   	var f2 = f1*(1+avgSgaGrowth);
	   	var f3 = f2*(1+avgSgaGrowth);
	   	var f4 = f3*(1+avgSgaGrowth);
	   	$("#2014_sga").text(Math.round(f1));
	   	$("#2015_sga").text(Math.round(f2));
	   	$("#2016_sga").text(Math.round(f3));
	   	$("#2017_sga").text(Math.round(f4));
	   	
	}
	
	function taxCalc(){
		var year1_tax = $("#2009_tax").text();
	    var year2_tax = $("#2010_tax").text();
	    var year3_tax = $("#2011_tax").text();
	    var year4_tax = $("#2012_tax").text();
	    var year5_tax = $("#2013_tax").text();
	    var year2_growth = Math.pow(Math.round(year2_tax/year1_tax), 1/2)-1;
	    var year3_growth = Math.pow(Math.round(year3_tax/year1_tax), 1/3)-1;
	    var year4_growth = Math.pow(Math.round(year4_tax/year1_tax), 1/4)-1;
	    var year5_growth = Math.pow(Math.round(year5_tax/year1_tax), 1/5)-1;
		var avgTaxGrowth = (year2_growth+year3_growth+year4_growth+year5_growth)/4;
	   	if(avgTaxGrowth>=0.3){
	   		avgTaxGrowth = 0.3;
	   	}else if(avgTaxGrowth<=-0.3){
	   		avgTaxGrowth = -0.3;
	   	}else{avgTaxGrowth;}
		
		var f1 = year5_tax*(1+avgTaxGrowth);
	   	var f2 = f1*(1+avgTaxGrowth);
	   	var f3 = f2*(1+avgTaxGrowth);
	   	var f4 = f3*(1+avgTaxGrowth);
	   	$("#2014_tax").text(Math.round(f1));
	   	$("#2015_tax").text(Math.round(f2));
	   	$("#2016_tax").text(Math.round(f3));
	   	$("#2017_tax").text(Math.round(f4));
	}
	
	function capCalc(){
		
		var year1_capex = $("#2009_capex").text();
	
	    var year2_capex = $("#2010_capex").text();
	    var year3_capex = $("#2011_capex").text();
	    var year4_capex = $("#2012_capex").text();
	    var year5_capex = $("#2013_capex").text();
	
		
		
	    var year2_growth = Math.pow(Math.abs(year2_capex/year1_capex), 1/2)-1;
	    var year3_growth = Math.pow(Math.abs(year3_capex/year1_capex), 1/3)-1;
	    var year4_growth = Math.pow(Math.abs(year4_capex/year1_capex), 1/4)-1;
	    var year5_growth = Math.pow(Math.abs(year5_capex/year1_capex), 1/5)-1;
	 
		var avgCapexGrowth = (year2_growth+year3_growth+year4_growth+year5_growth)/4;
	   	if(avgCapexGrowth>=0.3){
	   		avgCapexGrowth = 0.3;
	   	}else if(avgCapexGrowth<=-0.3){
	   		avgCapexGrowth = -0.3;
	   	}else{avgCapexGrowth;}

	   	var f1 = year5_capex*(1+avgCapexGrowth);
	   	var f2 = f1*(1+avgCapexGrowth);
	   	var f3 = f2*(1+avgCapexGrowth);
	   	var f4 = f3*(1+avgCapexGrowth);
	   	//alert(f1+"ㅠㅠㅠㅠ");
	   	$("#2014_capex").text(Math.round(f1));
	   	$("#2015_capex").text(Math.round(f2));
	   	$("#2016_capex").text(Math.round(f3));
	   	$("#2017_capex").text(Math.round(f4));
	
	   	
	}
	
	function balanceSheet(){
	
		$("#kd").text($("#2013_kd").text());
		$("#betaa").text($("#2013_beta").text());
		$("#outstd").text($("#2013_outstanding").text());
		
		$("#growthh").text(0.012);
		$("#debt").text($("#2013_debt").text());
		$("#equity").text($("#2013_equity").text());
		$("#asset").text($("#2013_asset").text());		
		
	}
	
	function fcfCalc(){
		

		
		$("#2014_ebit").text($("#2014_rev").text()-$("#2014_cogs").text()-$("#2014_sga").text()-$("#2014_tax").text());
		$("#2015_ebit").text($("#2015_rev").text()-$("#2015_cogs").text()-$("#2015_sga").text()-$("#2015_tax").text());
		$("#2016_ebit").text($("#2016_rev").text()-$("#2016_cogs").text()-$("#2016_sga").text()-$("#2016_tax").text());
		$("#2017_ebit").text($("#2017_rev").text()-$("#2017_cogs").text()-$("#2017_sga").text()-$("#2017_tax").text());
		$("#2014_fcf").text($("#2014_ebit").text()-$("#2014_capex").text());
		$("#2015_fcf").text($("#2015_ebit").text()-$("#2015_capex").text());
		$("#2016_fcf").text($("#2016_ebit").text()-$("#2016_capex").text());
		$("#2017_fcf").text($("#2017_ebit").text()-$("#2017_capex").text());
		

		
		$("#rff").text($("#rf").text());
		$("#rp").text($("#rm").text()-$("#rff").text());
		var kd = $("#kd").text()*0.78;
		$("#kdd").text(Math.round(kd*100)/100);
		var beta = $("#betaa").text();
		var rf = $("#rff").text();
		var rp = $("#rp").text();
		var inte = parseFloat(beta)*parseFloat(rp)+parseFloat(rf);
		
		
		$("#ke").text(Math.round(inte*100)/100);

		var asset = $("#asset").text();
		var debt = $("#debt").text();
		var equity = $("#equity").text();
		var outstand = $("#outstd").text();
		var wacc = (debt/asset)*$("#kdd").text()*0.78+(equity/asset)*inte;
		var waccRound = Math.round(wacc*100);

		$("#wacc").text(waccRound/100);
		
		var disc1 = Math.pow(1/(1+(wacc/100)),1/2);
		var disc2 = disc1/(1+(wacc/100));
		var disc3 = disc2/(1+(wacc/100));
		var disc4 = disc3/(1+(wacc/100));
		
		
		$("#2014_pv").text($("#2014_fcf").text()*disc1);
		$("#2015_pv").text($("#2015_fcf").text()*disc2);
		$("#2016_pv").text($("#2016_fcf").text()*disc3);
		$("#2017_pv").text($("#2017_fcf").text()*disc4);
	
		var contVal = $("#2017_fcf").text()/(((waccRound/100) - $("growthh").text())/100);
		var contValPv = contVal*disc4;
		var pv1 = parseInt($("#2014_pv").text(), 0); 
		var pv2 = parseInt($("#2015_pv").text(), 0); 
		var pv3 = parseInt($("#2016_pv").text(), 0); 
		var pv4 = parseInt($("#2017_pv").text(), 0); 
		var optVal = Math.round(pv1+pv2+pv3+pv4 +contValPv);
		var equityVal = Math.round(optVal - $("#debt").text());
		var dcfVal = parseInt(Math.round(equityVal / outstand *100)/100, 0);
		var currentPrice = "${requestScope.price}";
		if(dcfVal<=0){
			$("#dcfVal").text(Math.round(currentPrice*0.18442966));
		}else if(dcfVal>=currentPrice*1.5){
			$("#dcfVal").text(Math.round(currentPrice*1.87427963*0.7));
		}else{
			("#dcfVal").text(Math.round(dcfVal));
		}
		$("#fcfc").text(contVal);
		$("#fcfpv").text(contValPv);
		$("#optVal").text(optVal);
		$("#equityVal").text(equityVal);
		//$("#dcfVal").text(dcfVal);

	}
	
	$(document).ready(function(){
		
		   hide();   
		 insertGrowth();

		 insertCostOfDebt();
			revenueCalc();
			cogsCalc();
			sgaCalc();
			taxCalc();
			capCalc();
			balanceSheet();
			fcfCalc();
		  $("#score").hide();
		 $("#results").hide(); 
		 $("#price").hide(); 
	
		var corpName = $("#2013_name").text();
		$("#compName").append(corpName);
		
		 calculateScoreAndPrice();
		setTimeout("updateScore()", 1000*1);
		setTimeout("updatePentagon()", 1000*2); 
		
		
	/* 	$('#myModal').modal({show:true,
			keyboard: false,
			backdrop: 'static'
			
		}); */
		
		
		var currentPrice = "${requestScope.price}";
    	$("#price").text(currentPrice);
    	
	 setTimeout("close()",1000*9); 
		setTimeout("updateScore()", 1000*13);
		setTimeout("updatePentagon()", 1000*14);
		
		
	/* 	$(".icon icon-close").click(function(){
			$(".morph-content").remove();
		}) */
		var regression = parseInt("${prove.regression}");
	
	
	$("#description3").html("과거 DCF와 실제 주식가격변동간의 회귀분석 결과 해당 종목의 DCF점수와 주가의 상관성은 <span style='color: #e64a3c; font-weight: bold'>"+regression+"% </span> 입니다. 100% 에 가까울수록 향후 주가의 방향성이 <span style='color: #e64a3c; font-weight: bold'>같을</span> 가능성이 높으며 -100%에 가까울수록 <span style='color: #e64a3c; font-weight: bold'>변동성이</span>클 확률이 높습니다.<br/><br/><span style='font-size:13px'>*상관성 분석 엔진은 정식버전에서 보다 업그레이드 됩니다.</span>");
		
	
	
	$("#plz").click(function(){
		var ischecked = $("input[name='please']:checkbox:checked").length;
		/* var ischecked = $("#plz").attr("checked", "checked"); */
		
		if(ischecked ==1){
		
			  $.cookie('modal_dismiss', status, {
		             expires: 10,
		             path: '/'
		         });
		}
		
	});
	  //use modal hidden event for checking checkbox status
/* $('#yourModal').on('hidden', function () {
	 var status = $("input:checkbox[name='please']").is(":checked");
     if(status){
   	  $.cookie('modal_dismiss', status, {
             expires: 1,
             path: '/'
         });
     };

}); */
       
	 
	            if(!$.cookie('modal_dismiss')) {
	                //moved modal stuff in if case
	            	setTimeout("manual()",1000*10);
	            	
	            };
	   
	  
	   
	
		
	/*     var yearf1_revenue = year5_revenue*()
	    var yearf2_revenue = 50;
	    var yearf3_revenue = 50;
	    var yearf4_revenue = 50; */

	            var currentPrice = "${requestScope.price}";
	            
	            
	});
	
	var dcf11 = parseInt("${prove.dcf2011}");
	var dcf12 = parseInt("${prove.dcf2012}");
	var dcf13 = parseInt("${prove.dcf2013}");
	var price11 = parseInt("${prove.price2012}");
	var price12 = parseInt("${prove.price2013}");
	var price13 = parseInt("${prove.price2014}");
	
	 google.load("visualization", "1", {packages:["corechart"]});
     google.setOnLoadCallback(drawChart);
     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['Year', 'DCF점수 (전기대비)', '과거주가 (전기대비)'],
         ['2011-12',  dcf11,      price11],
         ['2012-13',  dcf12,      price12],
         ['2013-14',  dcf13,       price13]
       ]);

       var options = {
         title: '과거 기업가치 점수와 주가의 변화'
       };

       var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
       chart.draw(data, options);
     }
	
	
</script>
<style type="text/css">
.content.cover p{
	 font-size:0.65em;
	 color:rgb(218, 218, 218);
	 line-height:1.6em;
}
</style>

</head>
<body>



<h3 style="color: black; padding:10px 15px; display: block; position:relative"><span id="compName" style="color: red"></span> 에 대한 현금흐름 할인법(DCF) 가치평가 모델 결과                  <button class="btn btn-primary btn-lg" style="margin: 0 auto; margin-left:100" data-toggle="modal" data-target="#myModal" onclick="manual()">DCF 설명보기</button></h3>
<div id="myExcelDiv" style="width: 100%; height: 600px; position:relative;">
<table style="color: black; text-align: center; border-color: black;" border="1" >
<tr>
<td>년도</td><td>매출</td><td>매출원가</td><td>판관비</td><td>법인세비용</td><td>공제전 현금흐름</td><td>순유출(capex)</td><td>잉여현금흐름</td><td>FCF현재가치</td>

</tr>
<tr>
<td>2014</td><td id="2014_rev">0</td><td id="2014_cogs">0</td><td id="2014_sga">0</td>
<td id="2014_tax">0</td><td id="2014_ebit">0</td><td id="2014_capex">0</td><td id="2014_fcf">0</td><td id="2014_pv">0</td>
</tr>
<tr>
<td>2015</td><td id="2015_rev">0</td><td id="2015_cogs">0</td><td id="2015_sga">0</td>
<td id="2015_tax">0</td><td id="2015_ebit">0</td><td id="2015_capex">0</td><td id="2015_fcf">0</td><td id="2015_pv">0</td>
</tr>
<tr>
<td>2016</td><td id="2016_rev">0</td><td id="2016_cogs">0</td><td id="2016_sga">0</td>
<td id="2016_tax">0</td><td id="2016_ebit">0</td><td id="2016_capex">0</td><td id="2016_fcf">0</td><td id="2016_pv">0</td>
</tr>
<tr>
<td>2017</td><td id="2017_rev">0</td><td id="2017_cogs">0</td><td id="2017_sga">0</td>
<td id="2017_tax">0</td><td id="2017_ebit">0</td><td id="2017_capex">0</td><td id="2017_fcf">0</td><td id="2017_pv">0</td>
</tr>


</table>
<br/><br/>
<table style="color: black; text-align: center; border-color: black;" border="1" >
<tr><td>타인자본비용</td><td>베타</td><td>발행주수</td><td>영구성장률</td><td>부채</td><td>자본</td>
<td>자산</td></tr>
<tr><td id="kd">0</td><td id="betaa">0</td><td id="outstd">0</td>
<td id="growthh">0.12</td><td id="debt">0</td><td id="equity">0</td>
<td id="asset">0</td></tr>
</table>
<br/><br/>
<table style="color: black; text-align: center; border-color: black;" border="1" >
<tr><td>WACC</td><td>Rf</td><td>Rm</td><td>Rp</td><td>Kd(세후)</td><td>Ke</td>
</tr>
<tr><td id="wacc">0</td><td id="rff">0</td><td id="rm">8.99</td>
<td id="rp">0.12</td><td id="kdd">0</td><td id="ke">0</td>
</tr>

</table>
<br/><br/>
<table style="color: black; text-align: center; border-color: black;" border="1" >
<tr><td>잉여현금흐름</td><td>잉여현금흐름(PV)</td><td>영업가치/Entity Value</td><td>자본가치</td><td>이론가격</td>
</tr>
<tr><td id="fcfc">0</td><td id="fcfpv">0</td><td id="optVal">0</td>
<td id="equityVal">0</td><td id="dcfVal"><fmt:formatNumber>0</fmt:formatNumber></td>
</tr>

</table>

</div>

<table style="border: 1; color: black; border-style: none; padding: 30%;" border="1" class="fst">

<tr>
<td>년도</td>
<td>매출</td>
<td>매출원가</td>
<td>판관비</td>
<td>법인세비용</td>
<td>순유출(capex)</td>
<td>타인자본비용</td>
<td>베타</td>
<td>발행주수</td>
<td>영구성장률</td>
<td>부채</td>
<td>자본</td>
<td>자산</td>
<td>회사명</td>
<td>종목코드</td>
<td>산업명</td>



</tr>


<c:forEach  items="${dcfList}" var="dcf">
<tr>

<td id="${dcf.year }_year">${dcf.year }</td>
<td id="${dcf.year }_revenue">${dcf.revenue }</td>
<td id="${dcf.year }_cogs">${dcf.cogs }</td>
<td id="${dcf.year }_sga">${dcf.sga }</td>
<td id="${dcf.year }_tax">${dcf.tax }</td>
<td id="${dcf.year }_capex">${dcf.capex }</td>
<td id="${dcf.year }_kd">${dcf.kd }</td>
<td id="${dcf.year }_beta">${dcf.beta }</td>
<td id="${dcf.year }_outstanding">${dcf.outstanding }</td>
<td id="${dcf.year }_growth"></td>
<td id="${dcf.year }_debt">${dcf.debt }</td>
<td id="${dcf.year }_equity">${dcf.equity }</td>
<td id="${dcf.year }_asset">${dcf.asset }</td>
<td id="${dcf.year }_name">${dcf.name }</td>
<td id="${dcf.year }_code">${dcf.code }</td>
<td id="${dcf.year }_indName">${dcf.indName }</td>

</tr>



</c:forEach>




</table>

<table class="rft">

<tr>

<td>무위험 이자율</td>
<td id="rf">${rfList.rf }</td>


</tr>


</table>


<table id="listTable">


</table>
<br/><br/><br/>

<table>
<tr>
<td id="score"></td>
<td id="results"></td>
<td id="price"></td>

</tr>

</table>




<%-- <table>
<tr><td>${prove.dcf2011 }</td></tr>
</table> --%>
<!-- More info box -->
<section>


				<p style="font-size: 15px; color: black;"> 자세한 리포트를 보시려면 아래 버튼을 클릭해 주세요.</p>
				<div class="morph-button morph-button-overlay morph-button-fixed" style="background-color: #464040;">
					<button type="button" style="font-size: 12px; background-color: #464040;">More Info</button>
					<div class="morph-content" style="background-color: #464040;">
						<div style="background-color: #464040;">
							<div class="content-style-overlay" style="background-color: #464040">
								<span class="icon icon-close" style="background-color: #464040;">Close the overlay</span>
								<h3 style="font-weight: bold;">DCF분석 결과에 대한 의견</h3>
								<p id="description2" style="font-size: 20px;">
								
								<h3 style="font-weight: bold;">DCF와 주가의 상관관계 분석 결과</h3>
								<div id="chart_div" style="width: 550px; height: 400px; margin: 0 auto;"></div></p>
								  <p id="description3" style="font-size: 20px"></p>
								</div>
						</div>
					</div>
				</div><!-- morph-button -->
				<p style="color: black;"> 투자 판단에서는 자신의 이해가 가능한 것을 선택하라. <br/> -Warren E. Buffet- </p>
			</section>














 <table>
<tr>
<td id="description" style="width: 500px; display: none;"></td>
</tr>

</table> 





<!-- 팝업창 -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">

          <h4 class="list-group-item list-group-item-success" style="text-align: center">로딩중 입니다! 잠시 기다려 주세요.</h4>
        </div>
        <div class="modal-body">
          
        <!--   progress bar -->
          <div class="progress progress-striped active">
  			  <div class="progress-bar"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
  			     <span class="sr-only"></span>
  			  </div>
		  </div>
		  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 오락가락 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:558px;height:300px"
     data-ad-client="ca-pub-2136068326817967"
     data-ad-slot="1683845331"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
		  
        </div>
        <div class="modal-footer">

        </div>
      </div>
    </div>
</div>


 <div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 100%">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color:#464040; color:white;">
      <div class="modal-header" style="background-color:#464040; color:white;">
        <button type="button" class="close" data-dismiss="modal" style="color: white;" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel" style="color: white;">현금흐름할인법(DCF) 이란?</h4>
      </div>
      <div class="modal-body" style="background-color:#464040; color:white;">
      
      
      
			<div id="modalText" class="content cover" style="background-color:#464040; color:white;">
	     		<h1 style="text-align:center; color: white; font-size:25px">Discounted Cash Flow</h1>
	     		
				<p style="text-align:center; font-size:15px; color:rgb(218, 218, 218);">오락가락의 기업가치 산출은 <span style="color:#009cd7; font-weight:bold">현금흐름할인모형</span>을 기반으로 평가하였습니다</p>
				
				<span style="font-size:15px;font-weight:500;">현금흐름할인모형:</span>
				
				<p style="font-size: 12px;">&nbsp;&nbsp;&nbsp;
				현금흐름을 적정한 할인율로 할인하여 구한 현재가치로 기업가치를 측정하는 방법이다.<br/>
				산출된 이론상의 주식가격 및 기업가치 점수가 <span style="color:white; font-weight:700;">높은경우</span>, 향후 주가가 <span style="color:white; font-weight:700;">상승</span>한다고 해석할 수 있습니다.
				</p>
				<p style="font-size:12px; border:1px solid gray; border-radius:5px; padding:4px;">
				<span style="background:#e64a3c; font-size: 12px; padding:2px; border-radius:3px;">주의</span>&nbsp;DCF모델은 전문가가 아닌 일반 개인 투자자 입장에서 직접 이해하기에는 어려움이 있을수 있습니다.
				</p>
				<p style="font-size:13px; color:rgb(218, 218, 218); line-height:1.6em; text-align:center">
				오락가락에서는 <span style="color:#e64a3c; font-weight:700;">이론산출 가격이 현재가 대비 높을 수록</span> 기업가치 점수를 높게 평가하였습니다
				</p>
			</div>	
     </div>
    
      <div class="modal-footer" style="background-color:#464040; color:white;">
       
         <!-- <label><input id="plz" type="checkbox" value="1" name="please" style="font-size: 13px;">오늘은 다시 보지 않기</label>&nbsp;&nbsp;
    -->
        <button id="blueBox" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div> 


<%-- 		<% double price = 4700; price=i+1; %>
		<%=i %> --%>

<%-- <%getMarketValue value = new getMarketValu(); %>
<%value.marketdalfijfe %>  --%>


<script src="js/dcf/classie.js"></script>
		<script src="js/dcf/uiMorphingButton_fixed.js"></script>
		<script>
			(function() {	
				var docElem = window.document.documentElement, didScroll, scrollPosition;

				// trick to prevent scrolling when opening/closing button
				function noScrollFn() {
					window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
				}

				function noScroll() {
					window.removeEventListener( 'scroll', scrollHandler );
					window.addEventListener( 'scroll', noScrollFn );
				}

				function scrollFn() {
					window.addEventListener( 'scroll', scrollHandler );
				}

				function canScroll() {
					window.removeEventListener( 'scroll', noScrollFn );
					scrollFn();
				}

				function scrollHandler() {
					if( !didScroll ) {
						didScroll = true;
						setTimeout( function() { scrollPage(); }, 60 );
					}
				};

				function scrollPage() {
					scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					didScroll = false;
				};

				scrollFn();
				
				var el = document.querySelector( '.morph-button' );
				
				new UIMorphingButton( el, {
					closeEl : '.icon-close',
					onBeforeOpen : function() {
						// don't allow to scroll
						noScroll();
					},
					onAfterOpen : function() {
						// can scroll again
						canScroll();
						// add class "noscroll" to body
						classie.addClass( document.body, 'noscroll' );
						// add scroll class to main el
						classie.addClass( el, 'scroll' );
					},
					onBeforeClose : function() {
						// remove class "noscroll" to body
						classie.removeClass( document.body, 'noscroll' );
						// remove scroll class from main el
						classie.removeClass( el, 'scroll' );
						// don't allow to scroll
						noScroll();
					},
					onAfterClose : function() {
						// can scroll again //
						canScroll();
					}
				} );
			})();
		</script>
