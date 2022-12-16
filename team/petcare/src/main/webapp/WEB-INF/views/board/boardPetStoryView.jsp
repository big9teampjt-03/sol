<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<center>
<div class="container">
<input type="hidden" id="petstory_id" value="${bpsboard.petstory_id} " />
	<br/>
	<h3>${bpsboard.username}님의글</h3>
	<hr size="5" noshade>
	<br />
	<div class="container row" style="width:500px; margin: 100 auto;">
		<div class="col align-self-center">
			<div class="card" style="border:4px solid;">
				<h4 class="card-title">${bpsboard.title }</h4>
				<img class="card-img-top"
					src="/resources/img/${bpsboard.petstoryimage }" alt="Card image"
					style="width: 100%; height: 100%">
				<div class="card-body">
					<p class="card-text">${bpsboard.username}님</p>
					<p class="card-text">${bpsboard.content }</p>
					<button type="button" style ="border:0"> <img src="https://cdn-icons-png.flaticon.com/512/105/105220.png" id="btnLikes" height ="20" width="20" /></button>
					<span id="likes">${bpsboard.likes}</span>
					 <img src="https://cdn-icons-png.flaticon.com/512/159/159078.png" width="20" height="20"> ${bpsboard.hitcount}
						 <img src="https://cdn-icons-png.flaticon.com/512/5338/5338282.png" width="20" height="20">${bpsboard.replycnt}
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
		<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정</button>
		<button type="button" class="btn btn-danger btn-sm" id="btnDelete">삭제</button>
	</div>

	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
	</div>
	<button type=button class="btn btn-secondary btn-sm" id="btnComment">댓글쓰기</button>
	<hr />
	<div id="replyResult">aa</div>
</div>
</center>

<script>
 var init = function(){
	$.ajax({
		type:"get",
		url:"/reply/list/"+$("#petstory_id").val()
	})
	.done(function(resp){
		alert(resp)
		var str ="<table class = 'table table-hover'>"
		$.each(resp, function(key, val){
			str+="<tr>"
			str+="<td>" +val.username+"</td>"
			str+="<td>" +val.content+"</td>"
			str+="<td>" +val.regdate+"</td>"
			
			//username?id? 같을 시 삭제 가능 추가
			
			str+="</tr>"
		})
		str+="</table>"
		alert(str)
		$("#replyResult").html(str)
	})//done
}//init

$("#btnComment").click(function(){
	if($("#msg").val()==""){
		alert("댓글을 입력하세요")
		return;
	}
	var data={
			"petstory_id": $("#petstory_id").val(),
			"content":$("#msg").val()
	}
	$.ajax({
		type: "POST",
		url:"/reply/insert/" +$("#petstory_id").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp,status){
		alert("댓글 추가 성공")
		init();
	})
	.fail(function(){
		alert("댓글추가실패")
		})

})

$("#btnUpdate").click(function(){
	if(confirm("정말 수정할까요?")){
		location.href ="/board/update/${bpsboard.petstory_id}"
	}
})


$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?")) return
	$.ajax({
		type:"delete",
		url:"/board/delete/${bpsboard.petstory_id}",
		success:function(resp){
			if(resp=="success"){
				alert("삭제성공")
				location.href="/board/list"
			}
		},
		error:function(e){
			alert("삭제 실패: "+ e)
		}
	})//ajax
}) //btnDelete

$("#btnLikes").click(function(){
	//alert($("#likes").text())
	data ={
			"petstory_id":$("#petstory_id").val(),
			"likes":$("#likes").text()
	}
	$.ajax({
		type:"put",
		url:"/board/updateLikes",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success:function(resp){
			//alert("좋아요 성공")
			//location.href="/board/view/${bpsboard.petstory_id}"
			$("#likes").text(resp)
		},
		error:function(e){
			alert("종아요 실패" + e)
		}
	})
	
})

init();

</script>

