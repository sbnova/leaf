<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<!-- <link href="https://stackpath.bootstrapcdn.com/bootswatch/3.3.7/darkly/bootstrap.min.css" rel="stylesheet">-->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">-->
<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(".pagination li a").on("click", function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(gargetPage);
		jobForm.attr("action", "/board/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>
	<script language="javascript">
		var result = '${msg}';
		
		if(result == 'SUCCESS'){
			alert("처리가 완료되었습니다.");
		}
	</script>
</head>
<body>

<div class="container">
<!-- listAll 내용 첨부 -->
<table class="table table-bordered">
		<th style="width:10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	
<c:forEach items="${list}" var="boardVO" varStatus="status">
	
	<tr>
	<td>${status.index + 1}</td>
	<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
	<td>${boardVO.writer}</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
	<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
	</tr>
	
</c:forEach>
</table>
<!-- list All -->

<table class="table table-borderd">
<thead>
	<tr>
		<th style="width:10px">BNO</th>
		<th>TITLE</th>
		<th>WRITER <i class="fa fa-user"></i></th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>	
</thead>

<tbody>
	<c:forEach items="${list }" var="boardVO" varStatus="status">
		<tr>
		<td>${pageMaker.totalCount - ((pageMaker.cri.page - 1) * pageMaker.cri.perPageNum) - status.index}</td>
				<!-- 전체개수에 대한 번호(글번호 x) -->
		<!-- page전체갯수 -((page cri  - 1) * page cri현재범위(10설정) - status.index 현재위치 -->
		<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${boardVO.bno }'>${boardVO.title }</a></td>
		<td>${boardVO.writer }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }"/></td>
		<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
		</tr>
	</c:forEach>
	

</tbody>
</table>
	<div class="text-center">
	
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<%-- <li><a href="listPage?page=${pageMaker.startPage - 1 }">&laquo;</a></li> --%>
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<%-- <a href="listPage?page=${idx }">${idx }</a> --%>
					<a href="listPage${pageMaker.makeQuery(idx) }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<%-- <li><a href="listPage?page=${pageMaker.endPage + 1 }">&raquo;</a></li> --%>
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
</div>
<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum }>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum }>
</form>
</body>
</html>