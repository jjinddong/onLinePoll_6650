<%@page import="java.text.DecimalFormat"%>
<%@page import="onLinePoll_6650.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1; url='?'">
<title>투표 결과</title>
<link rel="icon" href="./favicon-16x16.png">
</head>
<body>
<%
	String filepath = application.getRealPath("/") + "poll.txt";
	ArrayList<String> poll = PollRead.pollRead(filepath);
	int itemCount = (poll.size() - 1) / 2;
	
	int sum = 0;
	for (int i=itemCount + 1; i<poll.size(); i++) {
		sum += Integer.parseInt(poll.get(i));
	}

	DecimalFormat df1 = new DecimalFormat("#,##0표");
	DecimalFormat df2 = new DecimalFormat("0.0%");

%>

	<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
			<tr> 
				<th colspan="2"> 
					<%=poll.get(0)%> 
				</th>
			</tr>
			<tr> 
				<td align="right"  colspan="2"> 
					<%=df1.format(sum)%> 
				</td>
			</tr>
	<%
		for (int i=1; i<=itemCount; i++) {
			int pyo = Integer.parseInt(poll.get(i + itemCount));
			double per = (double) pyo /sum;
	%>
			<tr> 
				<td width="1000">
					<%=poll.get(i)%>(<%=df1.format(pyo)%>)
					<%-- <%=poll.get(i)%>(<%=df2.format(per)%>) --%>
				</td>
				<td width="400">
					<hr color="red" size="12" width="<%=350 * per%>" align="left">
				</td>
			</tr>
	<%
		}
	%>	
	
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="투표하기로 가기" onclick="location.href='pollRead.jsp'">
				</td>	
			</tr>
</body>
</html>