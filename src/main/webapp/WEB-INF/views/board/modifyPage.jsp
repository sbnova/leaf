<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});
		
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
		
	});
</script>
</head>
<body>
<div class="container">

<form role="form" action="modifyPage" method="post">
	<input type='hidden' name='page' value="${cri.page }">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">BNO</label>
			<input type="text" name='bno' class="form-control" value="${boardVO.bno}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name='title' class="form-control" value="${boardVO.title}">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label>
			<input type="text" name="writer" class="form-control" vlaue="${boardVO.writer}">
		</div>
	</div>
	<!-- /.box-body -->
</form>

<div class="box-footer">
	<button type="submit" class="btn btn-primary">SAVE</button>
	<button type="submit" class="btn btn-warning">CANCEL</button>
</div>

</div>
</body>
</html>