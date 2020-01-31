<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  google.charts.setOnLoadCallback(drawEmployeeCntChart);
  //google.charts.setOnLoadCallback(drawOnlineChart);
  
  
  
 var cat_online_ajax = [];
 var per_online_ajax = [];
  
  $(document).ready( function() {
	 
	  $('[name=month_choice]').change(function(){
		  alert($(this).val());
		 drwaChartAjax($(this).val()); 
	  });
	  
  });
  
  
  function drwaChartAjax(thisVal){
	  
	  var checkVal = "month_choice="+thisVal;
	  
	  $.ajax({
	         url : "/group4erp/goOnlineOrderProc.do"
	         , type : "post"
	         , data : checkVal
	         , success : function(manyDTO){
	           
	        	 var chartDataOnline = [ "['카테고리', '비율']" ];

	            if(thisVal!=null){
	            	
	            	for(var i=0; i<=10 ; i++){
	            		 //alert(manyDTO[i].cat_name_online);
	            		 chartDataOnline.push("['" + manyDTO[i].cat_name_online + "'," + manyDTO[i].peronlineorder + "]");
	            		 //alert(chartDataOnline[i]);
                	}

	            	$("#onlineOrder").children().remove();
	            	$("#onlineOrder").append("<div id='onlineChart' style='width: 700px; height: 500px;'></div>");
	                
	            	//google.charts.setOnLoadCallback(drawOnlineChart);
	            	drawOnlineChart(chartDataOnline);
	            }
	         }
	         , error : function(){
	            alert("서버 접속 실패");
	         }
	      });
  }
  
  function drawOnlineChart(chartDataOnline){
	  
	  alert(chartDataOnline);
	  
	  var online_data = google.visualization.arrayToDataTable([
		 chartDataOnline
      ]);
	  
	  var online_options8 = {
	      title: '온라인 주문 분야 비율 (월)',
	      width :900,
	      height: 700
	    };
	  
	  var onlineChart = new google.visualization.PieChart(document.getElementById('onlineChart'));

	  onlineChart.draw(online_data, online_options8);
	  
	  
  }
  
  
  function drawChart() {

    var data = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perBookCat}" var="bookcat" varStatus="loopTagStatus">
	  		,['${bookcat.cat_name}', ${bookcat.perNum}]
  	    </c:forEach>
    ]);
    var data2 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perCorpArea}" var="corparea" varStatus="loopTagStatus">
	  		,['${corparea.business_area_name}', ${corparea.perCorp}]
  	    </c:forEach>
    ]);
    var data3 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['온라인', ${perLine.on_line}]
    	,['오프라인', ${perLine.off_line}]
    ]);
    var data4 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['회원', ${perMember.memberY}]
    	,['비회원', ${perMember.memberN}]
    ]);
    var data5 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	,['비휴직', ${perLeave.leaveF}]
    	,['휴직', ${perLeave.leaveT}]
    ]);
    var data6 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perOnlineOrder}" var="onlineorder" varStatus="loopTagStatus">
  			,['${onlineorder.cat_name_online}', ${onlineorder.peronlineorder}]
	    </c:forEach>
    ]);
    var data7 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perOffOrder}" var="offorder" varStatus="loopTagStatus">
  			,['${offorder.cat_name_off}', ${offorder.perofforder}]
	    </c:forEach>
    ]);
    var data8 = google.visualization.arrayToDataTable([
    	['카테고리', '비율']
    	<c:forEach items="${requestScope.perOnlineOrder}" var="onlineorder" varStatus="loopTagStatus">
  			,['${onlineorder.cat_name_online}', ${onlineorder.peronlineorder}]
	    </c:forEach>
    ]);
    
    var options = {
      title: '분야 별 도서 비율',
      width :900,
      height: 700
    };
    var options2 = {
      title: '거래처 분야 비율',
      width :900,
      height: 700
    };
    var options3 = {
      title: '온/오프라인 주문 비율',
      width :900,
      height: 700
    };
    var options4 = {
      title: '회원/비회원 주문 비율',
      width :900,
      height: 700
    };
    var options5 = {
      title: '휴직자 비율',
      width :900,
      height: 700
    };
    var options6 = {
      title: '온라인 주문 분야 비율',
      width :900,
      height: 700
    };
    var options7 = {
      title: '오프라인 주문 분야 비율',
      width :900,
      height: 700
    };
    var options8 = {
      title: '온라인 주문 분야 비율',
      width :900,
      height: 700
    };
    
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
    var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));
    var chart4 = new google.visualization.PieChart(document.getElementById('piechart4'));
    var chart5 = new google.visualization.PieChart(document.getElementById('piechart5'));
    var chart6 = new google.visualization.PieChart(document.getElementById('piechart6'));
    var chart7 = new google.visualization.PieChart(document.getElementById('piechart7'));
    var chart8 = new google.visualization.PieChart(document.getElementById('piechart8'));
    
    chart.draw(data, options);
    chart2.draw(data2, options2);
    chart3.draw(data3, options3);
    chart4.draw(data4, options4);
    chart5.draw(data5, options5);
    chart6.draw(data6, options6);
    chart7.draw(data7, options7);
    chart8.draw(data8, options8);
  }
  
  
  
  function drawEmployeeCntChart() {
      var employee_chart_data = google.visualization.arrayToDataTable([
    	  ['부서명', '인원수']
    	  <c:forEach items="${requestScope.deptEmpCnt}" var="deptEmpCnt" varStatus="loopTagStatus">
				,['${deptEmpCnt.dep_name}', ${deptEmpCnt.depCnt}]
	  	  </c:forEach>
      ]);
      var online_chart_data = google.visualization.arrayToDataTable([
    	  ['날짜', '금액']
    	  <c:forEach items="${requestScope.monthTotMoney}" var="monthTotMoney" varStatus="loopTagStatus">
				,['${monthTotMoney.monthsort}', ${monthTotMoney.totmoneyM}]
	  	  </c:forEach>
      ]);
      var offline_chart_data = google.visualization.arrayToDataTable([
    	  ['날짜', '금액']
    	  <c:forEach items="${requestScope.offMonthTotMoney}" var="offMonthTotMoney" varStatus="loopTagStatus">
				,['${offMonthTotMoney.offmonthsort}', ${offMonthTotMoney.offtotmoney}]
	  	  </c:forEach>
      ]);
      var employee_chart_options = {
         title: '직원 현황(부서별)',
         width :700, 
         height: 500,
         colors:['#FF6464','#FF6464'],
         opacity: 0.5,
         //chartArea:{top:20},
         animation:{
            "startup": true,
              duration: 1000,
              easing: 'out'
            },
         vAxis: {minValue:0,maxValue:20}
      };
      var onlinemonthTotMoney_chart_options = {
    		  title: "온라인 월별 총 매출 액",
    		  width :700,
    		  height: 500
      };
      var offlinemonthTotMoney_chart_options = {
    		  title: "오프라인 월별 총 매출 액",
    		  width :700,
    		  height: 500
      };


      var employee_chart = new google.visualization.ColumnChart(document.getElementById('employeeChart'));
      var onlinemonthTotMoney_chart = new google.visualization.ColumnChart(document.getElementById('onlinemonthTotMoneyChart'));
      var offlinemonthTotMoney_chart = new google.visualization.ColumnChart(document.getElementById('offlinemonthTotMoneyChart'));

      employee_chart.draw(employee_chart_data, employee_chart_options);
      onlinemonthTotMoney_chart.draw(online_chart_data, onlinemonthTotMoney_chart_options);
      offlinemonthTotMoney_chart.draw(offline_chart_data, offlinemonthTotMoney_chart_options);
   }
  
  /*
  ['Task', 'Hours per Day'],
  ['Work',     11],
  ['Eat',      2],
  ['Commute',  2],
  ['Watch TV', 2],
  ['Sleep',    7]
  */
  
  
</script>

</head>
<body>
<center>

<br>
<table>
<tr>
<td>
<div id="piechart" style="width: 700px; height: 500px;"></div>
<td>
<div id="piechart2" style="width: 700px; height: 500px;"></div>

<tr>
<td>
<div id="piechart3" style="width: 700px; height: 500px;"></div>
<td>
<div id="piechart4" style="width: 700px; height: 500px;"></div>

<tr>
<td colspan=2>
<div id="piechart5" style="width: 700px; height: 500px;"></div>
<tr>
<td>
<div id="piechart6" style="width: 700px; height: 500px;"></div>
<td>
<div id="piechart7" style="width: 700px; height: 500px;"></div>

<tr>
<td>
<div id="offlinemonthTotMoneyChart" style="width: 700px; height: 500px;"></div>
<td>
<div id="onlinemonthTotMoneyChart" style="width: 700px; height: 500px;"></div>

<tr>
<td>
<div id="employeeChart" style="width: 700px; height: 500px;"></div>

<tr>
<td colspan=2 align=center>
<select name=month_choice>
	<option value="">----------</option>
	<option value="01">1월</option>
	<option value="02">2월</option>
	<option value="03">3월</option>
	<option value="04">4월</option>
	<option value="05">5월</option>
	<option value="06">6월</option>
	<option value="07">7월</option>
	<option value="08">8월</option>
	<option value="09">9월</option>
	<option value="10">10월</option>
	<option value="11">11월</option>
	<option value="12">12월</option>
</select>
<div id="onlineOrder">
<div id="piechart8" style="width: 700px; height: 500px;">
</div>
</div>
</table>
<input type="button" name="joinBtn" value="저장" onClick="checkLoginInfo();">&nbsp;



</body>
</html>