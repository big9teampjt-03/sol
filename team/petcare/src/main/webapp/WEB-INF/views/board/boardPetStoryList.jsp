<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
<br/>
	<h3>펫 스토리</h3>
	<p align="right">
		<a href="insert"><button class="btn btn-secondary bt -sm">파일 글쓰기</button></a></p>
	<div class="form-group text-right"></div>
	<h5>인기스토리</h5>
	<hr size="5" noshade>
	<br />
	<div class="row ">
		<c:forEach items="${lists }" var="bpsboard">
			<div class="col-3 mb-3" style="width: 100%; height:100%">
				<div class="card" style="border:1.5px solid;">
					<h4 class="card-title">${bpsboard.title }</h4>
					<img class="card-img-top" style="width: 100%; height: 250px"
						src="/resources/img/${bpsboard.petstoryimage }" alt="Card image" >
					<div class="card-body">
						<p class="card-text">${bpsboard.username }님</p>
						<p class="card-text">${bpsboard.content }</p>
						<img src="https://cdn-icons-png.flaticon.com/512/105/105220.png" id="btnLikes" height ="20" width="20" />${bpsboard.likes}
						<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png"width="20" height="20"> ${bpsboard.hitcount} 
						<a href="/board/view/${bpsboard.petstory_id}" target="_blank">
						<img src="https://cdn-icons-png.flaticon.com/512/5338/5338282.png" width="20" height="20"> </a>${bpsboard.replycnt} 
					</div>
					<!--card-body  -->
				</div>
				<!--card  -->
				<br />
			</div>
			<!-- col -->
		</c:forEach>
	</div>
	<!-- row -->
</div>
