<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<center>
	<div class="container">
		<br />
		<h3>${bpsboard.username}님의글 수정하기</h3>
		<hr size="5" noshade>
		<br />
		<input type="hidden" name="petstory_id" id="petstory_id" value="${bpsboard.petstory_id}" />
		<div class="container row" style="width: 500px; margin: 100 auto;">
			<div class="col align-self-center">
				<div class="card" style="border: 4px solid;">
					<input  type ="text" name= "title" id="title"  value=${bpsboard.title } />
					<img class="card-img-top"
						src="/resources/img/${bpsboard.petstoryimage }" alt="Card image"
						style="width: 100%; height: 100%">
					<div class="card-body">
						<p class="card-text">${bpsboard.username}님</p>
					<textarea class="form-control" rows="5" id="content" name="content">${bpsboard.content }</textarea>
					<div id="content_cnt">(0 /13)</div>
					</div>
					<!--card-body  -->
				</div>
				<!--card  -->
				<br />
			</div>
			<!-- col -->
		</div>
		<!-- row -->
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnModify">수정하기</button>

		</div>
	</div>
</center>

<script>
$("#btnModify").click(function(){

	data ={
			"petstory_id": $("#petstory_id").val(),
			"title": $("#title").val(),
			"content": $("#content").val()
	}
	$.ajax({
		type:"put",
		url:"/board/update",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success:function(resp){
			alert("수정완료")
			location.href = "/board/list"
		},
		error:function(e){
			alert("수정실패" + e)
		}
		
	})//ajax
	
})//btnModify

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