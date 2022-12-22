<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<br/> <br/>
<div class="container">

	<!--부트스트랩의 기능 css로 따로 하지 않아도 마진을 조절가능-->
	<div class="row my-6">
		<!--utilities colors-->
		<!--7:5 로 나누어짐(부트스트랩은 하나의 행이 12개로 쪼개짐)-->
		<div class="col-5">
			<!--bootraps 기능 class="w-100"으로 사이즈 조절 가능-->
			<h2>Welcome to Pet Care Service </h2>
			<img
				src="https://blog.kakaocdn.net/dn/dUASe6/btrzBI6fiw6/zsUWHDM0TLxbazX3wpReUK/img.png"
				alt="" class="w-100" style="width:450px; height: 210px">
		</div>
		<div class="col-7">
			<h3>로그인</h3>
			<br>
			<form action="/login" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<div class="form-group">
					<label for="username">아이디:</label> <input type="text"
						class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="pass">비밀번호:</label> <input type="password"
						class="form-control" id="password" name="password">
				</div>
				<div>
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
<br/>
<br/>






<!-- /END THE FEATURETTES -->