<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		var result = '${msg}';
		
		if(result == 'success'){
			alert("처리가 완료되었습니다.");
		}
	</script>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
		<th style="width:10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	
	
<c:forEach items="${list}" var="boardVO">
	
	<tr>
	<td>${boardVO.bno}</td>
	<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
	<td>${boardVO.writer}</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
	<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
	</tr>
	
</c:forEach>
	</table>
</div>
</body>
</html>