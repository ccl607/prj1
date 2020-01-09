<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 행사 현황</title>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

 input[type="date"]::-webkit-calendar-picker-indicator,
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
 
 input[type="date"]::-webkit-calendar-picker-indicator {
   color: rgba(0, 0, 0, 0); /* 숨긴다 */
   opacity: 1;
   display: block;
   background: url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png) no-repeat; /* 대체할 아이콘 */
   width: 20px;
   height: 20px;
   border-width: thin;
}
</style>
<script>

	$(document).ready(function() {
		$("#evnt_start_dt").datepicker({
   	 	onSelect: function() { 
   	 		//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
   	    	 var dateObject = $(this).datepicker('getDate');
   	    	 //alert(dateObject.val()); 
   			}
		});

		$("#evnt_end_dt").datepicker({
    		onSelect: function() { 
    			//var date = $('#datepicker').datepicker({ dateFormat: 'yyyy-mm-dd' }).val();
       			var dateObject = $(this).datepicker('getDate');
       		 	//alert(dateObject.val()); 
   			}
		});


		$("[name=tot_est_cost]").keyup(function() {
			//class=money를 가진 입력 양식에서 입력한 데이터를 자바스크립트 영역으로 가져와 변수에 저장
			var money = $(this).val();
			//숫자만 골라서 저장할 변수 선언
			var num = "";
			
			//money 변수 안의 데이터중 숫자만 골라 num 변수에 누적 시킴
			for(var i=0; i<money.length; i++) {
				if("0123456789".indexOf(money.charAt(i)) >=0) {
					num = num + money.charAt(i);
				} 
				
				//num 변수 안의 제일 앞의 숫자가 0이면 제거(ex 024~, 00056~ 등등). 
				//단, 0원일때는 지우지 않는다. 즉 0이 1개일때는 삽입 가능
				while(num.charAt(0)=="0" && num.length>1) {
					num = num.substring(1);
				}
			}

			//콤마를 포함한 최종 문자열을 저장할 변수 선언
			var result="";
			
			var cnt=0;

			var arr = num.split("");
			arr=arr.reverse();
			for(var i=0; i<arr.length; i++) {
				//++cnt;
				if((i%3==2)) {	//if((i+1)%3==0) {
					arr[i] = ","+arr[i];
				}
			}
			arr=arr.reverse();
			result = arr.join("");
			//---------------------------------------------------------------

			//맨 앞이 콤마(,)로 시작하면 그 이후 문자를 낚아채 result에 다시 저장
			if(result.charAt(0)==",") {
				result = result.substring(1);
			}

			if(result.indexOf(",")==0) {
				result = result.substring(1);
			}

			$(this).val(result);	//최종 결과값을 텍스트박스에 저장함
		});		
	});

	function checkForm() {

		var evnt_no = $("#event_no").html();
		//alert(evnt_no);
		inputData("[name=evnt_no]", evnt_no);
		inputData("[name=emp_no]", 5);

		if(is_empty("[name = evnt_title]")) {
			alert("이벤트 타이틀을 입력해주세요.");
			$("[name = evnt_title]").focus();

			return;
		}

		if(is_empty("[name = evnt_start_dt]")) {
			alert("이벤트 시작일을 입력해주세요.");
			$("[name = evnt_start_dt]").focus();

			return;
		}

		if(is_empty("[name = evnt_end_dt]")) {
			alert("이벤트 종료일을 입력해주세요.");
			$("[name = evnt_end_dt]").focus();

			return;
		}

		if(is_empty("[name = tot_est_cost]")) {
			alert("예상경비를 입력해주세요.");
			$("[name = tot_est_cost]").focus();

			return;
		}
		
		if(confirm("정말 저장하겠습니까?")==false) {

			return;
		}

		var money = $("[name=tot_est_cost]").val();
		money = money.replace(/,/gi, "");
		inputData("[name=tot_est_cost]", money);
		//inputData("[name=emp_no]", emp_no);
		
		
		//document.eventScheduleForm.submit();
		$.ajax({
			url : "/group4erp/insertEventProc.do"	//접속할 서버쪽 url 주소 지정
			, type : "post"					//전송 방법 설정
			, data : $("[name = eventScheduleForm]").serialize()	//서버로 보낼 파라미터명과 파라미터값을 설정
			, success : function(insertEvntCnt) {	//서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정. 매개변수 boardRepleCnt에는 입력된 행의 개수가 들어온다.
														//현재 data 매개변수에는 새 글 등록 개수가 들어온다.
				if(insertEvntCnt==1) {			//[게시판 입력 행 적용 개수]가 1개이면(insert가 1회 성공했다는 뜻)
					alert("이벤트 등록 성공");
					location.replace("/group4erp/viewEventList.do");
					} else if(insertEvntCnt==0) {		//글 등록 개수가 0이면 경고
						alert("이벤트 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
					} else {
						alert("서버 오류 발생! 관리자에게 문의 바람!");
					}				
				}

				, error : function() {		//서버의 응답을 못받았을 경우 실행할 익명함수 설정
					alert("서버 접속 실패!");
				}			
		});
	}

	</script>
</head>
<body><center>
<h1>[이벤트 신청 페이지]</h1>
	<form name="eventScheduleForm" method="post" action="/group4erp/reserveEvent.do">
		<table class="tab" cellpadding="5" cellspacing="5">
			<tr>
				<td colspan="2">이벤트 일련번호</td><td colspan="2"> <span id="event_no">EV00-00${eventNo}</span> </td>
			</tr>
			<tr>
				<td colspan="2">담당자 </td><td colspan="2">${emp_name} </td>
			</tr>
			<tr>
				<td>행사종류</td><td><select name="evnt_cd"><option value="1">매대판매행사</option>
										<option value="2">야외판매</option>
										<option value="3">할인전</option>
										<option value="4">기부행사</option>
										<option value="5">온라인 설문조사</option>
										<option value="6">저자강연회</option>
										<option value="7">선착순증정</option>
								</select></td><td>행사명</td><td><input type="text" name="evnt_title"></td>
			</tr>
			<tr>
				<td colspan="2">이벤트 예정 일시 </td><td colspan="2">
								<input type="text" id="evnt_start_dt" name="evnt_start_dt"> ~
								<input type="text" id="evnt_end_dt" name="evnt_end_dt"></td>	   

			</tr>
			<tr>
				<td colspan="2">예상 소요 경비 </td><td colspan="2"><input type="text" name="tot_est_cost">원</td>
			</tr>
			<tr>
				<td colspan="2">첨부자료</td><td colspan="2"><input type="file" name="atchd_data"></td>
			</tr>
			<tr>
				<td colspan="2">비고</td><td colspan="2"><textarea name="evnt_comment"></textarea></td>
			</tr>
		
		</table><br>
		<script>
	    	$("#evnt_start_dt").datepicker({ dateFormat: 'yy-mm-dd' });
	    	$("#evnt_end_dt").datepicker({ dateFormat: 'yy-mm-dd' });
	    </script>
	    
		<input type="button" value="결재" onClick="checkForm();">
		<input type="reset" value="초기화">
		<input type="hidden" name="evnt_no">
		<input type="hidden" name="emp_no" value="${emp_no}">
	</form>


</center>
</body>
</html>