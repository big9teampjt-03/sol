<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
	<h3>펫 스토리</h3>
	<p align="right">
		<a href="insert"><button class="btn btn-secondary bt -sm">파일
				글쓰기</button></a>
	</p>
	<div class="form-group text-right"></div>
	<h5>인기스토리</h5>
	<hr size="5" noshade>
	<br />
	<div class="row ">
		<c:forEach items="${lists }" var="bpsboard">
			<div class="col-3 mb-3" style="width: 400px">
				<div class="card">
				<h4 class="card-title"> ${bpsboard.title }</h4>
				<img class="card-img-top" src="/resources/img/${bpsboard.petstoryimage }"  
						alt="Card image" style="width: 100%; height:100%">
					<div class="card-body">
						<p class="card-text">${bpsboard.username }</p>
						<p class="card-text">${bpsboard.content }</p>
						<img src="https://cdn-icons-png.flaticon.com/512/105/105220.png" width="20" height="20">()
						<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png" width="20" height="20">()
						<img src="https://cdn-icons-png.flaticon.com/512/5338/5338282.png" width="20" height="20">()
					</div>
					<!--card-body  -->
				</div>
				<!--card  -->
				<br/>
			</div>
			<!-- col -->
		</c:forEach>
	</div>
	<!-- row -->
	
	</div>
