<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
}

.header {
	width: 100%;
}

.header_td {
	width: 100%;
	table-layout: fixed;
}
button.submit {
	position : relative;
	left : 92%;
}
</style>
<script>
$(function(){
	$("#qna_write").click(function(){
		let id = '${userinfo.id}';
		console.log($('writePost [name=qna_value]').val());
		let data = JSON.stringify({
			"id" : id,
			"title" : $('#writePost [name=title]').val(),
			"descrip" : $('#writePost [name=qna_value]').val()
		});
		
		$.ajax({
				url :'/post',
				type: 'POST',
				contentType:'application/json;charset=utf-8',
				data : data,
				success: function(data){
					console.log(data);
					location.href = "/qna";
				}
			});
		})
	});
</script>
</head>
<body>
	<c:import url="../include/header.jsp" ></c:import>
	<div class = "container-sm pt-5">
		<h2>글 작성</h2>
		<div class = "container-sm pt-5" id="writePost">
			  <form >
			    <div class="form-group">
			      <label for="title">제목</label>
			      <input type="text" class="form-control" id="title" placeholder="이 곳에 제목을 써주세요" name="title">
			    </div>
			    <div class="form-group">
			      <label for="qna_value">QnA 내용</label>
			      <textarea class="form-control" rows="5" placeholder="이 곳에 글을 써주세요" id="qna_value" name="qna_value"></textarea>
			    </div>
			    <button type="button" id="qna_write" class="btn btn-dark m-3 submit">등록</button>
			  </form>
		</div>
		

	</div>
</body>
</html>