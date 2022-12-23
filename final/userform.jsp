<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/WEB-INF/views/includes/header.jsp" %>
 <input type="hidden" name="userid" id="userid" value="${user.userid}">
<br>

<style>
*{
margin:0;
padding:0;
}

ul,li{
list-style:none;}

a{
text-decoration:none;
color:white;
}

.menu_wrap .dep1{
font-size:0;
}

.menu_wrap .dep1>li{
display:inline-black;
width:100px;
background:#0080FF; 
text-align:center;
font-size:16px;
}

.menu_wrap .dep1>li:hover>a{
background:#0080FF; 
color:#fff;}

.menu_wrap .dep1>li:hover > .dep2{
display:block}
.menu_wrap .dep1>li>a{
display:block;
padding :10px 0;
}
.menu_wrap .dep2{
display:none;
background:#81BEF7;
}
.menu_wrap .dep2 a{
display:block;
padding:10px 0;}

.menu_wrap .dep2 a:hover{
text-decoration:underline;}


</style>


<div class="container mt-3">
	<div class="row my-6">
		<div class="col-2">
			<div class="menu_wrap">
				<ul class="dep1">
					<li><a href="#">작성한 글 </a>
						<ul class="dep2">
							<li><a href="#">내 반려견</a></li>
							<li><a href="#">상담게시판</a></li>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">펫스토리</a></li>
							<li><a href="#">댓글</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="col-10">
			<div class="form-group">
				<h3>My Story</h3>
				<br>
				<h5>내가 쓴 게시글</h5>
				<div id="cboardResult"></div>
				<div id="qboardResult"></div>
				<hr>
				<h5>내가 쓴 댓글</h5>
				<div id="creplyResult"></div>
				<div id="qreplyResult"></div>
			</div>
			<br />
			<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
			<button type="button" class="btn btn-danger" id="btnDelete">탈퇴</button>
		</div>
	</div>
</div>


<script>
var init = function(){
	$.ajax({
		type:"get",
		url:"/boardcounsel/list/"+$("#userid").val()
	})
	.done(function(resp){
		var str="<table class='table table-hover'>"
		$.each(resp,function(key,val){
			str+="<tr>"
			str+="<td>"+"<a href=/board/boardCounselview/"+val.counselID+">"+val.title
			str+="<td>"+val.content+"</td>"
			str+="<td>"+val.regdate+"</td>"
			str+="</tr>"
			
		})//each
		str+="</table>"
		$("#cboardResult").html(str);
	})//done
}
init();

var init = function(){
	$.ajax({
		type:"get",
		url:"/boardquestion/qlist/"+$("#userid").val()
	})
	.done(function(resp){
		var str="<table class='table table-hover'>"
		$.each(resp,function(key,val){
			str+="<tr>"
			str+="<td>"+"<a href=/board/boardQuestionview/"+val.questionID+">"+val.title
			str+="<td>"+val.content+"</td>"
			str+="<td>"+val.regdate+"</td>"
			str+="</tr>"
			
		})//each
		str+="</table>"
		$("#qboardResult").html(str);
	})//done
}
init();

var init = function(){
	$.ajax({
		type:"get",
		url:"/commentcounsel/clist/"+$("#userid").val()
	})
	.done(function(resp){
		var str="<table class='table table-hover'>"
		$.each(resp,function(key,val){
			str+="<tr>"
			str+="<td>"+val.content+"</td>"
			str+="<td>"+val.regdate+"</td>"
			str+="<td>"+"<a href='javascript:adel("+val.comcounselID+")'>삭제</a>"+"</td>"
			str+="</tr>"
			
		})//each
		str+="</table>"
		$("#creplyResult").html(str);
	})//done
}
init();
	
var init = function(){
	$.ajax({
		type:"get",
		url:"/commentquestion/qrlist/"+$("#userid").val()
	})
	.done(function(resp){
		var str="<table class='table table-hover'>"
		$.each(resp,function(key,val){
			str+="<tr>"
			str+="<td>"+val.content+"</td>"
			str+="<td>"+val.regdate+"</td>"
			str+="<td>"+"<a href='javascript:fdel("+val.comquestionID+")'>삭제</a>"+"</td>"
			str+="</tr>"
			
		})//each
		str+="</table>"
		$("#qreplyResult").html(str);
	})//done
}
init();
function adel(comcounselID){
	if(!confirm('정말 댓글을 삭제할까요?')){
		return false;
	}
	$.ajax({
		type:'DELETE',
		url:"/reply/delete/"+comcounselID
	})//ajax
	.done(function(resp){
		alert("댓글 삭제 완료")
		init();
	})
	.fail(function(e){
		alert("댓글 삭제 실패"+e)
	})
}
init();
function fdel(comquestionID){
	if(!confirm('정말 댓글을 삭제할까요?')){
		return false;
	}
	$.ajax({
		type:'DELETE',
		url:"/reply/qdelete/"+comquestionID
	})//ajax
	.done(function(resp){
		alert("댓글 삭제 완료")
		init();
	})
	.fail(function(e){
		alert("댓글 삭제 실패"+e)
	})
}
init();
</script>