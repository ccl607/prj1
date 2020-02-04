<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="90%">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="15%"></td>
			<td>
				<table>
					<tr>
						<td width="100%">
							<div class="progress progress-striped">
								<font style="font-size: 8pt; color: orange;">&nbsp;※판매
									건수가 없습니다.</font>
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
									style="width: 0%">
									<span class="sr-only">0%</span>
								</div>
							</div>
						</td>
						<td></td>
						<td width="20%"><div class="percent">40%</div></td>
					</tr>
				</table> <!-- <div width="100%" id="monthlyBookRegChart"></div> -->
			</td>
		</tr>
		<tr>
			<td width="10%"></td>
			<td></td>
		</tr>
		<tr height="50%">
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="15%"></td>
			<td>
				<!-- <div class="task-info">
		                    <div class="desc">Dashio Admin Panel</div>
		                    <div class="percent">40%</div>
		                  </div> --> <c:if test="${empty returnStat}">
					<font style="font-size: 8pt; color: orange;">판매 건수가 없습니다.</font>
					<div class="progress progress-striped">
						<div class="progress-bar progress-bar-danger" role="progressbar"
							aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
							style="width: 0%">
							<span class="sr-only">0%</span>
						</div>
					</div>
				</c:if> <!-- <div width="100%" id="monthlyBookRegChart"></div> -->
			</td>
		</tr>
	</table>






</body>
</html>