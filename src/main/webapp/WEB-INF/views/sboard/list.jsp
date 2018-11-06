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
	<script>
		$(document).ready(function(){
			
			$('#searchBtn').on("click", function(event){				
				self.location = "list" 
				+ '${pageMaker.makeQuery(1)}' 
				+ "&searchType="
				+ $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			});	
			
			$('#newBtn').on("click", function(evt){
				self.location = "register";				
			});
			
		});	
	</script>
</head>
<body>

<div class="container">

<div class='box-body'>
	<select name="searchType">
		<option value="n"
		<c:out value="${cri.searchType == null?'selected':'' }"/>>
		---</option>
		<option value="t"
		<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>
		Title</option>
		<option value="c"
		<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>
		Content</option>
		<option value="w"
		<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>
		Writer</option>
		<option value="tc"
		<c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>
		Title OR Content</option>
		<option value="cw"
		<c:out value="${cri.searchType eq 'cw'?'selected':'' }"/>>
		Content OR Writer</option>
		<option value="tcw"
		<c:out value="${cri.searchType eq 'tcw'?'selected':'' }"/>>
		Title OR Content OR Writer</option>		
	</select>
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
	<button id='searchBtn'>Search</button>
	<button id='newBtn'>New Board</button>
</div>
<div class = "text-center">


</div>

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
			<td><a href='/sboard/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${boardVO.bno }'>${boardVO.title }</a></td>
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
				<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<%-- <a href="listPage?page=${idx }">${idx }</a> --%>
					<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<%-- <li><a href="listPage?page=${pageMaker.endPage + 1 }">&raquo;</a></li> --%>
				<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
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