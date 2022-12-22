<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
<br/>


<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>
	<br/>
	<br/>
	<div class="d-flex justify-content-between">
	<h3>인기스토리</h3>
		<a href="/board/insert"><button class="btn btn-secondary bt -sm">파일 글쓰기</button></a>
	</div>
	
	<hr size="5" noshade>
	<br />
	<div class="row ">
		<c:forEach items="${lists.content}" var="bpsboard">
			<div class="col-3 mb-3" style="width: 100%; height:100%">
				<div class="card" style="border:1.5px solid;">
					<h4 class="card-title">${bpsboard.title }</h4>
					<img class="card-img-top" style="width: 100%; height: 250px"
						src="/resources/img/${bpsboard.petstoryimage }" alt="Card image" >
					<div class="card-body">
						<p class="card-text">${bpsboard.user.nickname}님</p>
						<p class="card-text">${bpsboard.content }</p>
						<img src="https://cdn-icons-png.flaticon.com/512/105/105220.png" id="btnLikes" height ="20" width="20" />${bpsboard.likes}
						<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png"width="20" height="20"> ${bpsboard.hitcount} 
						<a href="/board/view/${bpsboard.petstoryID}" target="_blank">
						<img src="https://cdn-icons-png.flaticon.com/512/5338/5338282.png" width="20" height="20"> </a>${bpsboard.replycnt}
						<br/>
						<fmt:formatDate value="${bpsboard.regdate}" pattern="yyyy-MM-dd" />
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
	<div class="d-flex justify-content-between">
		<ul class="pagination mt-3">

			<!-- 이전 -->
			<c:if test="${bpsboard.first==false}">
				<li class="page-item"><a class="page-link"
					href="?page=${bpsboard.number-1}&field=${param.field}&word=${param.word}">이전</a></li><!-- @Param은 굳이 객체에 안담아도 jstl쓸수있음?? -->
				<!-- 페이지 현재 번호는 number -->
			</c:if>

			<!-- 다음 -->
			<c:if test="${bpsboard.last==false}">
				<li class="page-item"><a class="page-link"
					href="?page=${bpsboard.number+1}&field=${param.field}&word=${param.word}">다음</a></li>
			</c:if>
		</ul>
		
		<form class="form-inline" action="/board/list" method="get">
			<select name='field' id="field" class="form-control mr-sm-1">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type='text' name='word' class="form-control"
				placeholder="Search">
			<button class='btn btn-secondary'>Search</button>
		</form>

	</div>
</div>

