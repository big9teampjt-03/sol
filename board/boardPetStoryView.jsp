<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<center>
<div class="container">
<input type="hidden" id="petstoryID" value="${bpsboard.petstoryID} " />
	<br/>
	<h3>${bpsboard.user.nickname}님의 글</h3>
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
					<p class="card-text">${bpsboard.user.nickname}님</p>
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
	<!-- ${principal.username} /${board.member.username } --> 
	<!-- row -->
	<div class="form-group text-right">
	<c:if test="${principal.user.username==bpsboard.user.username}">
		<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정</button>
		<button type="button" class="btn btn-danger btn-sm" id="btnDelete">삭제</button>
		</c:if>
	</div>

	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
	</div>
	<button type=button class="btn btn-secondary btn-sm" id="btnComment">댓글쓰기</button>
	<div class="mt-5">댓글(${bpsboard.replycnt})</div>
	<div id="replyResult"></div>
</div>
</center>

<script>
 var init = function(){
	$.ajax({
		type:"get",
		url:"/reply/list/"+$("#petstoryID").val()
	})
	.done(function(resp){
		var str ="<table class = 'table table-hover'>"
		$.each(resp, function(key, val){
			str+="<tr>"
			str+="<td>" +val.user.nickname+"</td>"
			str+="<td>" +val.content+"</td>"
			str+="<td>" +val.regdate+"</td>"
			if("${principal.user.username}"==val.user.username){
			str+="<td>"+"<a href='javascript:fdel("+val.competstoryID+")'>삭제</a>"+"</td>"}
			str+="</tr>"
			
		})
		str+="</table>"
		$("#replyResult").html(str)
	})//done
}//init

$("#btnComment").click(function(){
	if(${empty principal.user}){
		alert("로그인하세요")
		location.href="/login";
		return;
	}
	
	if($("#msg").val()==""){
		alert("댓글을 입력하세요")
		return;
	}
	var data={
			"petstoryID": $("#petstoryID").val(),
			"content":$("#msg").val()
	}
	$.ajax({
		type: "POST",
		url:"/reply/insert/" +$("#petstoryID").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp,status){
		alert("댓글 추가 성공")
		init();
		
	})
	.fail(function(){
		alert("댓글 추가 실패")
		})

})



function fdel(competstoryID){
		if(!confirm('정말 댓글을 삭제할까요?')){
			return false;
		}
		$.ajax({
			type:'DELETE',
			url:"/reply/delete/"+competstoryID
		})//ajax
		.done(function(resp){
			alert(resp+"번 댓글 삭제 완료")
			init();
		})
		.fail(function(e){
			alert("댓글 삭제 실패"+e)
			location.href="/login"
		})
	}




$("#btnUpdate").click(function(){
	if(confirm("정말 수정할까요?")){
		location.href ="/board/update/${bpsboard.petstoryID}"
	}
})


$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?")) return
	$.ajax({
		type:"delete",
		url:"/board/delete/${bpsboard.petstoryID}",
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
			"petstoryID":$("#petstoryID").val(),
			"likes":$("#likes").text()
	}
	$.ajax({
		type:"put",
		url:"/board/updateLikes",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success:function(resp){
			//alert("좋아요 성공")
			//location.href="/board/view/${bpsboard.petstoryID}"
			$("#likes").text(resp)
		},
		error:function(e){
			alert("종아요 실패" + e)
		}
	})
	
})

init();

</script>


