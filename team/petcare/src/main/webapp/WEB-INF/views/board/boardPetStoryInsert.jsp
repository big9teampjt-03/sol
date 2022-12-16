<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
<br/>
	<h3>Pet Story 게시글 작성하기</h3> <br/>
	<hr/>
	<form action="fileInsert" method="post" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="title">제목 :</label> <input type="text"
				class="form-control" id="title" placeholder="Enter title"
				name="title">
		</div>
		
		<div class="form-group">
			<label for="uploadpetstory">파일:</label> <input type="file"
				class="form-control" id="uploadpetstory" name="uploadpetstory"   placeholder="Enter File"/>
		</div>
		
		<div class="form-group">
			<label for="username">작성자:</label> <input type="text"
				class="form-control" id="username" name="username"  />
		</div>
		
		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="5" id="content" name="content"></textarea>
			<div id="content_cnt">(0 /13)</div>
		</div>
		<button type="submit" class="btn btn-primary btn-sm">글쓰기</button>
	</form>

</div>

<script>
$(document).ready(function(){
	$('#content').on('keyup', function(){
		$('#content_cnt').html("("+$(this).val().length+"/ 13)");
		
		if($(this).val().length > 13){
			$(this).val($(this).val().substring(0,13));
			$('#test_cnt').html("(13 / 13)");
		}
	});
	
});

</script>