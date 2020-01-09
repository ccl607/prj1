<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>직원별 휴가현황</title>
	<style type="text/css" media="screen">
 		.ko_day { text-indent : -9999px; background: #eee url(/imgs/korea.png) no-repeat center;}
	</style>


	<script>
	

		$(document).ready(function(){

			headerSort("dayOffList", 0);

			$('[name=rowCntPerPage]').change(function(){
				goDayoffSearch();
			});
			
			//var dat2 =
			//var diff = dat2 - dat1;
			//var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

			$(".pagingNumber").html(
				getPagingNumber(
					"${getDayOffListCnt}"					//검색 결과 총 행 개수
					,"${hrListSearchDTO.selectPageNo}"		//선택된 현재 페이지 번호
					,"${hrListSearchDTO.rowCntPerPage}"		//페이지 당 출력행의 개수
					,"10"									//페이지 당 보여줄 페이지번호 개수
					,"goDayoffSearch();"					//페이지 번호 클릭 후 실행할 자스 코드
				)
			);

			setTableTrBgColor(
					"dayOffList",			//테이블 class 값
					"${headerColor}",		//헤더 tr 배경색
					"${oddTrColor}",		//홀수행 배경색
					"${evenTrColor}",		//짝수행 배경색
					"${mouseOverColor}"		//마우스 온 시 배경색
			);

			inputData('[name=rowCntPerPage]',"${hrListSearchDTO.rowCntPerPage}");
			inputData('[name=selectPageNo]',"${hrListSearchDTO.selectPageNo}");
			inputData("[name=dy_keyword]", "${hrListSearchDTO.dy_keyword}");
			inputData("[name=sort]", "${hrListSearchDTO.sort}");
			<c:forEach items="${hrListSearchDTO.dayoff_state}" var="dy_state">
				inputData( "[name=dayoff_state]", "${dy_state}" );
			</c:forEach>
			
		});

	
		function goDayoffSearch(){
			document.empDayoffSearch.submit();
		}

		function goDayoffSearchAll(){
			document.empDayoffSearch.reset();
			$("[name=empDayoffSearch] [name=selectPageNo]").val(1)
			$("[name=empDayoffSearch] [name=rowCntPerPage]").val(10);
			goDayoffSearch();
		}

		/* function getNowtime() {
			var today = new Date();
			var year = today.getFullYear(); 
			var month = today.getMonth()+1; 
			var date = today.getDate();
			var week = getWeek(today);

			if(month < 10 ) {month = "0"+month;}
			if (date<10){date = "0" + date;}

			//alert( document.write(year) );
			//return 'abc';
			var result = year + "년 " +month + "월 " + date + "일 ("+ week +") ";
			$("#nowtime").text('2019-09-09');			
			//return year + "년 " +month + "월 " + date + "일 ("+ week +") " + hour + "시 " + minute + "분 " +second + "초 ";
		} */

		var cd = null;
		var dateS = null;
		var dateE = null;
		var empNo = null;
		var remainD = null;
		var realDy = null;
		var updatedata = null;


		function addUpdelTr(ele, emp_no){
			//console.log(ele);
			//console.log($(ele));
			//alert($(ele).children().eq(1).text());
			var addhtmlTr = "<tr name='addTr'><td align=center></td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(1).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(2).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(3).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(4).text()+"</td>";
			//addhtmlTr += "<td align=center><input type='text' name='dayoff_name' size=5 value='"+$(ele).children().eq(4).text()+"'></td>";
			addhtmlTr += "<td align=center><select name='dayoff_cd' value='"+$(ele).children().eq(5).text()+"'><option value='1'>연차</option>"
			addhtmlTr += "<option value='2'>월차</option><option value='3'>생리</option><option value='4'>출산</option>"
			addhtmlTr += "<option value='5'>반차</option><option value='6'>보상</option></select>"
				
			var dtfrom = $(ele).children().eq(6).text();
			var dtfromval = dtfrom.replace(dtfrom.substr(11,2),"").trim();
			addhtmlTr += "<td align=center><input type='text' name='start_dayoff' id='dateFrom' size='8' value='"+dtfromval+"'></td>";

			var dttill = $(ele).children().eq(7).text();
			var dttillval = dttill.replace(dttill.substr(11,2),"").trim();
			addhtmlTr += "<td align=center><input type='text' name='end_dayoff' id='dateTill' size='8' value='"+dttillval+"'><input type='hidden' name='emp_no' value='"+emp_no+"'>"
			addhtmlTr += "<td align=center><input type='text' style='background-color:#EBEBE4; box-shadow:none; border: 1px solid lightgray' name='using_dayoff' size='1' value='"+$(ele).children().eq(8).text()+"'readonly/></td>";
			addhtmlTr += "<td align=center><input type='text' style='background-color:#EBEBE4; box-shadow:none; border: 1px solid lightgray' name='remain_dayoff' size='1' value='"+$(ele).children().eq(9).text()+"'readonly/></td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(10).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(11).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(12).text()+"</td>";
			addhtmlTr += "<td align=center>"+$(ele).children().eq(13).text()+"<input type='hidden' name='emp_no' value="+emp_no+"></td></tr>";
			
			addhtmlTr += "<tr><td style='border-top:0px' colspan=13 align=center><input type='button' value='수정' onClick='dayoffUpdate(this);'>&nbsp;&nbsp;<input type='button' value='닫기' onClick='dayoffClose(this);'></td><tr>";
			//<input type='button' value='삭제' onClick='dayoffDelete(this);'>
			
			$(ele).after(addhtmlTr);

 	   		/*
	        var natDays =  [
	            [new Date(2020,01,01),'신정'],
	            [new Date(2020,1,24),'설날휴일'],
	            [new Date(2020,1,25),'설날'],
	            [new Date(2020,1,26),'설날휴일'],
	            [new Date(2020,1,27),'대체휴일'],
	            [new Date(2020,3,1),'3.1절'],
	            [new Date(2020,4,15),'국회의원선거'],
	            [new Date(2020,4,30),'부처님오신날'],
	            [new Date(2020,5,5),'어린이날']
	            [new Date(2020,6,6),'현충일'],
	            [new Date(2020,8,15),'광복절'],
	            [new Date(2020,9,30),'추석연휴'],
	            [new Date(2020,10,1),'추석'],
	            [new Date(2020,10,2),'추석연휴'],
	            [new Date(2020,10,3),'개천절'],
	            [new Date(2020,10,9),'한글날'],
	            [new Date(2020,12,25),'크리스마스'],
//	            [2020,1,1,'ko','신정'],[2012,1,22,'ko','설'],[2012,1,23,'ko','설'],[2012,1,24,'ko','설'],     
//	            [2020,1,1,'ko','3.1절'],
//	            [2020,1,1,'ko','어린이날'],[2012,5,28,'ko','석가탄신일'],
//	            [2020,1,1,'ko','현충일'],
//	            [2020,1,1,'ko','광복절'],
//	            [2020,1,1,'ko','추석'],[2012,9,30,'ko','추석'],
//	            [2020,1,1,'ko','추석'],[2012,10,3,'ko','개천절'],
//	            [2020,1,1,'ko','크리스마스']
	           ];

	        //datepicker에 공휴일 표시 및 클릭 비활성화    
	        function nationalDays(date) {
		         for (i = 0; i < natDays.length; i++) {
		          if (date.getFullYear() == natDays[i][0] && date.getMonth() == natDays[i][1] - 1
		                            && date.getDate() == natDays[i][2]) {       
		           return [false, natDays[i][3] + '_day',natDays[i][4]];
		          }
		         }
		         return [true, ''];
		        }

		        function noWeekendsOrHolidays(date) {
		            var noWeekend = $.datepicker.noWeekends(date);
		            if (noWeekend[0]) {
		                return nationalDays(date);
		            } else {
		                return noWeekend;
		            }
		        } */
	        $("#dateFrom").datepicker({ 
		    	        dateFormat: 'yy-mm-dd'
			    	    ,defaultDate : dtfromval
			    	    ,minDate : 'today'
		        		,onClose: function( selectedDate ) {   
							//$("#dateTill").datepicker({minDate:selectedDate});
			        		$("#dateTill").datepicker( "option", "minDate", selectedDate );
						}       
						,onSelect: function() { 
							var dateObject = $(this).datepicker('getDate');
							cd = $("[name=addTr]").find("[name=dayoff_cd]").val();
							dateS = $("[name=addTr]").find("[name=start_dayoff]").val();
							dateE = $("[name=addTr]").find("[name=end_dayoff]").val();
							empNo = $("[name=addTr]").find("[name=emp_no]").val();
							remainD = $("[name=addTr]").find("[name=remain_dayoff]").val();
					        
							var realDy = finalDayoff(dateS, dateE, remainD); 
							//alert("realDy => "+realDy);
							
				 			if(realDy > remainD){
								alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
								return;
							}
							if(realDy > 5){
								alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
								return;
							} 
				
							$("[name=addTr]").find("[name=using_dayoff]").val(realDy);
							var usingD = $("[name=addTr]").find("[name=using_dayoff]").val();
							updatedata = "dayoff_cd="+cd+"&start_dayoff="+dateS+"&end_dayoff="+dateE+"&emp_no="+empNo+"&using_dayoff="+usingD;
							//alert("updatedata => " + updatedata);
					    }
					    ,beforeShowDay:$.datepicker.noWeekends 
			});
			//$( "#dateFrom" ).datepicker().datepicker("setDate", dtfromval);
			//$( "#dateFrom" ).datepicker("setDate", dtfromval);
			
	        $("#dateTill").datepicker({ 
		        		dateFormat: 'yy-mm-dd'
		        		,defaultDate : dttillval
		        		,minDate : dtfromval
			        	,onClose: function( selectedDate ) {
                			//$("#dateFrom").datepicker({maxDate:selectedDate});
			        		// $("#dateFrom").datepicker( "option", "maxDate", selectedDate );
	            		}
						,onSelect: function() { 
					        var dateObject = $(this).datepicker('getDate');
							cd = $("[name=addTr]").find("[name=dayoff_cd]").val();
							dateS = $("[name=addTr]").find("[name=start_dayoff]").val();
							dateE = $("[name=addTr]").find("[name=end_dayoff]").val();
							empNo = $("[name=addTr]").find("[name=emp_no]").val();
							remainD = $("[name=addTr]").find("[name=remain_dayoff]").val();
					        
							var realDy = finalDayoff(dateS, dateE, remainD); 
							//alert("realDy => "+realDy);
							
				 			if(realDy > remainD){
								alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
								$("[name=addTr]").find("[name=end_dayoff]").val("");
								return;
							}
							if(realDy > 5){
								alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
								$("[name=addTr]").find("[name=end_dayoff]").val("");
								return;
							} 
				
							$("[name=addTr]").find("[name=using_dayoff]").val(realDy);
							var usingD = $("[name=addTr]").find("[name=using_dayoff]").val();
							updatedata = "dayoff_cd="+cd+"&start_dayoff="+dateS+"&end_dayoff="+dateE+"&emp_no="+empNo+"&using_dayoff="+usingD;
							//alert("updatedata => " + updatedata);
					        //alert($(this).val()); 
					    } 
					    ,beforeShowDay:$.datepicker.noWeekends
					         
            });

			//var cd = $("[name=addTr]").find("[name=dayoff_cd]").val();
			//var dateS = $("[name=addTr]").find("[name=start_dayoff]").val();
			//var dateE = $("[name=addTr]").find("[name=end_dayoff]").val();
			//var empNo = $("[name=addTr]").find("[name=emp_no]").val();
			//var remainD = $("[name=addTr]").find("[name=remain_dayoff]").val();

			//var changeI = $("[name=addTr]").find("[name=start_dayoff]");
			//alert(changeI);
	        $('#dateFrom').on("change", function() {
		        //console.log('이벤트');
		        //alert('change event 진입');
				var realDy = finalDayoff(dateS, dateE, remainD); 
				//alert(realDy);
				
	 			if(realDy > remainD){
					alert( realDy + " => 사용 가능한 휴가일을 초과하였습니다.");
					return;
				}
				if(realDy > 5){
					alert( realDy + " => 1회 최대 휴가 사용 가능일 수는 5일입니다.");
					return;
				} 
	
				$("[name=addTr]").find("[name=using_dayoff]").val(realDy);
				var usingD = $("[name=addTr]").find("[name=using_dayoff]").val();
				updatedata = "dayoff_cd="+cd+"&start_dayoff="+dateS+"&end_dayoff="+dateE+"&emp_no="+empNo+"&using_dayoff="+usingD;
				//alert(updatedata);
	        });



            

            
			//$("[name=addTr]").find("[name=start_dayoff]").change(function(){
				//alert(2);
				//$("[name=addTr]").find("[name=using_dayoff]").val(realDy); 
			//});
				$("[name=addTr]").find("[name=end_dayoff]").change(function(){
		 			alert(1);
				//$("[name=addTr]").find("[name=using_dayoff]").val(realDy); 
			});
	        
            
		}

		//alert($("[name=addTr]").find("[name=start_dayoff]").val());
		


		

		//var applycnt = 0;

		function dayoffUpdate(up){
			//alert(updatedata);
			//return;
			$.ajax({
                url : "/group4erp/dayoffUpdateProc.do"
                , type: "post"
                , data : updatedata
                , success : function(dayoffUpdateCnt){
	                	if(dayoffUpdateCnt == 1){
		                      alert("수정되었습니다.");
		                      location.replace("/group4erp/viewEmpDayOffList.do");
		                }
		                else{
		                      alert("서버쪽 DB 연동 실패");
		                }
                } 

                , error : function(){
                   alert("서버 접속 실패");
                }
             });
			
		}
		//function dayoffDelete(del){}
		function dayoffClose(close){
			$(close).parent().parent().prev().remove();	
			$(close).parent().remove();
		}

		var holidays = [
			[2020,01,01,'신정'],
            [2020,1,24,'설날휴일'],
            [2020,1,25,'설날'],
            [2020,1,26,'설날휴일'],
            [2020,1,27,'대체휴일'],
            [2020,3,1,'3.1절'],
            [2020,4,15,'국회의원선거'],
            [2020,4,30,'부처님오신날'],
            [2020,5,5,'어린이날'],
            [2020,6,6,'현충일'],
            [2020,8,15,'광복절'],
            [2020,9,30,'추석연휴'],
            [2020,10,1,'추석'],
            [2020,10,2,'추석연휴'],
            [2020,10,3,'개천절'],
            [2020,10,9,'한글날'],
            [2020,12,25,'크리스마스']
//            [2020,1,1,'ko','신정'],[2012,1,22,'ko','설'],[2012,1,23,'ko','설'],[2012,1,24,'ko','설'],     
//            [2020,1,1,'ko','3.1절'],
//            [2020,1,1,'ko','어린이날'],[2012,5,28,'ko','석가탄신일'],
//            [2020,1,1,'ko','현충일'],
//            [2020,1,1,'ko','광복절'],
//            [2020,1,1,'ko','추석'],[2012,9,30,'ko','추석'],
//            [2020,1,1,'ko','추석'],[2012,10,3,'ko','개천절'],
//            [2020,1,1,'ko','크리스마스']
		]

		function dateObj(date){
			var dyarr = [];
			for( var i=0; i<date.length; i++ ){
				var pushdy = new Date(date[i][0],date[i][1]-1,date[i][2]);
				dyarr.push(pushdy);
			}
			if(dyarr.length > 0){
				return dyarr;
			}
			else{
				alert('데이터가 날짜로 변경되지 않았습니다.');
				return;
			}
		}

		function finalDayoff(dateS, dateE, remainD){
			//alert("remainD => " + remainD);
           	var cnt = 0;
           	var arrS = dateS.split("-");
           	var arrE = dateE.split("-");
           	var startD = new Date(arrS[0], arrS[1]-1, arrS[2]);
           	var endD = new Date(arrE[0], arrE[1]-1, arrE[2]);
           	var count = (endD.getTime() - startD.getTime())/1000/(60*60*24);

           	var hldys = dateObj(holidays);
           	//alert((parseInt(arrS[2],10)+1));
           	
           	var applyhldys = [];
           	
            for(var i=0; i <= count; i++){
            	applyhldys.push(new Date(arrS[0],arrS[1]-1,(parseInt(arrS[2],10))+i));
				if( (applyhldys[i].getDay() == 0) || (applyhldys[i].getDay() == 6) ){
					cnt++;
					//alert( applyhldys[i] + " || " + applyhldys[i].getDay());
				}
				else{
					for(var k=0; k < hldys.length; k++){
						if( (applyhldys[i].getTime() == hldys[k].getTime()) ){
							cnt++;
							//alert( "This is hldys[k]" + hldys[k]);
						}
					}
				}

            	
               	//alert( applyhldys[i] );
/* 	        	for(var k=0; k < hldys.length; k++){
					if( (applyhldys[i].getTime() == hldys[k].getTime()) || ( applyhldys[i].getDay() == 0 ) || ( applyhldys[i].getDay() == 6 ) ){
						cnt++;
					}
					if( ( applyhldys[i].getDay() == 0 ) ){
							alert( applyhldys[i] + " || " + applyhldys[i].getDay());
					}
			    } */
	       	} 
	       	//alert("This is cnt =>" + cnt);
	       	realDy = count-cnt+1;
	       	//alert("This is realDy =>" + realDy);
	       	return realDy;
		}

		

		
	</script>
</head>
<body><center>

	<h1 style="font-size:15pt">[직원 휴가 신청 현황]</h1><br>
	<div id="nowtime" onload="getNowtime();">기준일 :</div><br><br>
	
	<form name="empDayoffSearch" method="post" action="/group4erp/viewEmpDayOffList.do">
			<table border="1" bordercolor="#C0C0C0" class="tab2" cellpadding="5" cellspacing="0" align=center>

				<tr>
					<th bgcolor="gray">키워드
					<td style="text-align:left"><input type="text" name="dy_keyword"></td>
				

<!-- 				<tr>
					<th bgcolor="gray">일자
					<td colspan=3 style="text-align:left" ><input type="text" id="dateFrom" name="dateFrom">
						&nbsp;~&nbsp;<input type="text" id="dateTill" name="dateTill">
						&nbsp;&nbsp;
						<a style="cursor:pointer" onclick="goTodaySearch();">[금일 검색]</a>
				</tr> -->
				</tr>
				<tr>
					<th bgcolor="gray">구분</th>
					<td style="text-align:left">	
						<input type="checkbox" name="dayoff_state" value="휴가전">휴가전
						<input type="checkbox" name="dayoff_state" value="휴가중">휴가중
						<input type="checkbox" name="dayoff_state" value="휴가후">휴가후
					</td>
				</tr>
			</table>
			<br>
	      <table><tr height=5><td></table>
	      
			<button onClick="goDayoffSearch();">검색</button>
			<button onClick="goDayoffSearchAll();">모두검색</button>
	    
	      <table border=0 width=63%>
				<tr>
					<td width=10%> &nbsp;
					<td class="fontLight" align=right>
						[총 개수] : ${getDayOffListCnt}&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="rowCntPerPage">
							<option value="10">10
							<option value="15">15
							<option value="20">20
							<option value="25">25
							<option value="30">30
						</select> 행보기
					</td>
		  </table>
	      <input type="hidden" name="selectPageNo" value="${hrListSearchDTO.selectPageNo}">
	      <input type="hidden" name="sort" >
      </form>
	 

	<form name="empDayOffList" method="post" action="/group4erp/viewEmpDayOffList.do">
		<table class="dayOffList tab" name="dayOffList" cellpadding="5" cellspacing="5" width="1200">
				<tr class="thset">

				<!-- <tr >
					<th style="cursor:pointer">NO
					<th style="cursor:pointer">소속 부서
					<th style="cursor:pointer">직급
					<th style="cursor:pointer">성명
					<th style="cursor:pointer">휴가 종류
					<th style="cursor:pointer">복귀 예정일
					<th style="cursor:pointer">수정/삭제 

					<th bgcolor="gray" style="cursor:pointer">NO</th>
					<th bgcolor="gray" style="cursor:pointer">소속 부서</th>
					<th bgcolor="gray" style="cursor:pointer">직급</th>
					<th bgcolor="gray" style="cursor:pointer">성명</th>
					<th bgcolor="gray" style="cursor:pointer">휴가 종류</th>
					<th bgcolor="gray" style="cursor:pointer">휴가 시작일</th>
					<th bgcolor="gray" style="cursor:pointer">복귀 예정일</th>-->

					<th bgcolor="black" style="cursor:pointer">NO</th>
					<c:choose>
						<c:when test="${param.sort=='dayoff_apply_no desc'}">
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val(''); goDayoffSearch();">▼ 신청번호</th>
						</c:when>
						<c:when test="${param.sort=='dayoff_apply_no asc'}">
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val('dayoff_apply_no desc'); goDayoffSearch();">▲ 신청번호</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val('dayoff_apply_no asc'); goDayoffSearch();">신청번호</th>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${param.sort=='3 desc'}">
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val(''); goDayoffSearch();">▼ 소속 부서</th>
						</c:when>
						<c:when test="${param.sort=='3 asc'}">
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val('3 desc'); goDayoffSearch();">▲ 소속 부서</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onClick="$('[name=sort]').val('3 asc'); goDayoffSearch();">소속 부서</th>
						</c:otherwise>
					</c:choose>
					
					
					<c:choose>
						<c:when test="${param.sort=='(select j.jikup_cd from code_jikup j, employee e where e.jikup_cd = j.jikup_cd and e.emp_no = da.emp_no) desc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$(''); goDayoffSearch();">▼ 직급</th>
						</c:when>
						<c:when test="${param.sort=='(select j.jikup_cd from code_jikup j, employee e where e.jikup_cd = j.jikup_cd and e.emp_no = da.emp_no) asc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('(select j.jikup_cd from code_jikup j, employee e where e.jikup_cd = j.jikup_cd and e.emp_no = da.emp_no) desc'); goDayoffSearch();">▲ 직급
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('(select j.jikup_cd from code_jikup j, employee e where e.jikup_cd = j.jikup_cd and e.emp_no = da.emp_no) asc'); goDayoffSearch();">직급
						</c:otherwise>
					</c:choose>
					<th bgcolor="black" style="cursor:pointer">성명</th>
					<th bgcolor="black" style="cursor:pointer">휴가 종류</th>
					<c:choose>
						<c:when test="${param.sort=='start_dayoff desc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val(''); goDayoffSearch();">▼ 휴가 시작일</th>
						</c:when>
						<c:when test="${param.sort=='start_dayoff asc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('start_dayoff desc'); goDayoffSearch();">▲ 휴가 시작일</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('start_dayoff asc'); goDayoffSearch();">휴가 시작일</th>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.sort=='end_dayoff desc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val(''); goDayoffSearch();">▼ 복귀 예정일</th>
						</c:when>
						<c:when test="${param.sort=='end_dayoff asc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('end_dayoff desc'); goDayoffSearch();">▲ 복귀 예정일</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('end_dayoff asc'); goDayoffSearch();">복귀 예정일</th>
						</c:otherwise>
					</c:choose>
					<th bgcolor="black" style="cursor:pointer">휴가 신청일수</th>
					
					<c:choose>
						<c:when test="${param.sort=='(select remain_dayoff from emp_dayoff_info where emp_no = da.emp_no) desc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val(''); goDayoffSearch();">▼ 사용가능 휴가일</th>
						</c:when>
						<c:when test="${param.sort=='(select remain_dayoff from emp_dayoff_info where emp_no = da.emp_no) asc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('(select remain_dayoff from emp_dayoff_info where emp_no = da.emp_no) desc'); goDayoffSearch();">▲ 사용가능 휴가일</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('(select remain_dayoff from emp_dayoff_info where emp_no = da.emp_no) asc'); goDayoffSearch();">사용가능 휴가일</th>
						</c:otherwise>
					</c:choose>
					
					<th bgcolor="black" style="cursor:pointer">총 휴가일</th>
					
					<c:choose>
						<c:when test="${param.sort=='dayoff_apply_dt desc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val(''); goDayoffSearch();">▼ 신청일</th>
						</c:when>
						<c:when test="${param.sort=='dayoff_apply_dt asc'}">
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('dayoff_apply_dt desc'); goDayoffSearch();">▲ 신청일</th>
						</c:when>
						<c:otherwise>
							<th bgcolor="black" style="cursor:pointer" onclick="$('[name=sort]').val('dayoff_apply_dt asc'); goDayoffSearch();">신청일</th>
						</c:otherwise>
					</c:choose>
					<th bgcolor="black" style="cursor:pointer">결재</th>
					<th bgcolor="black" style="cursor:pointer">휴가상태</th>
				</tr>

				<c:forEach items="${requestScope.getDayOffList}" var="dayoff" varStatus="loopTagStatus">
					<tr style="cursor:pointer; font-size:11pt;" onclick="addUpdelTr(this,'${dayoff.emp_no}')">
						<td align=center>${loopTagStatus.index+1}</td>
						<td align=center>${dayoff.dayoff_apply_no}</td>
						<td align=center>${dayoff.dep_name}</td>
						<td align=center>${dayoff.jikup}</td>
						<td align=center>${dayoff.emp_name}</td>
						<td align=center>${dayoff.dayoff_name}</td>
						<td align=center>${dayoff.start_dayoff}</td>
						<td align=center>${dayoff.end_dayoff}</td>
						<td align=center>${dayoff.using_dayoff}</td>
						<td align=center>${dayoff.remain_dayoff}</td>
						<td align=center>${dayoff.dayoff_tot}</td>
						<td align=center>${dayoff.dayoff_apply_dt}</td>
						<td align=center>${dayoff.confirm}</td>
						<td align=center>${dayoff.dayoffState}</td>
					</tr>
				</c:forEach>
		</table>
				
		<table><tr height=10><td></table>
		<input type="hidden" name="selectPageNo">
		<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
		<br><br><br>
		<c:if test="${empty getDayOffList}">
			금일은 휴가자가 없습니다.
		</c:if>
	
	</form>
	
</center>
</body>
</html>