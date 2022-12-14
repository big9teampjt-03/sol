<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>Pet Care Service</title>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<div class="jumbotron text-center bg-light" style="margin-bottom:0">
    <h2>Pet Care Service</h2>
</div>

<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
<div class = "container">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="/">HOME</a>
  
  <!-- Links -->
  <ul class="navbar-nav mr-auto">
    <li class="nav-item"><a class="nav-link" href="/board/boardCounsel">전문의 상담</a></li>
    <li class="nav-item"><a class="nav-link" href="/board/boardDocResearch">전문의 찾기</a></li>
    <li class="nav-item"><a class="nav-link" href="/board/boardQuestion">자유 게시판</a></li>
	<li class="nav-item"><a class="nav-link" href="/board/list">펫 스토리</a></li>
  </ul>
  
  <ul class="navbar-nav">
  <sec:authorize access="isAnonymous()">
    <li class="nav-item"><a class="nav-link"  href="/login">Log In</a></li>
    <li class="nav-item"><a class="nav-link"  href="/register">Sign Up</a></li>
    </sec:authorize>
  <sec:authorize access="isAuthenticated()"> <!-- 일반 회원, 권한명 바꿔야 함 -->
    <li class="nav-item"><a class="nav-link" href="/logout">Log Out(<sec:authentication property="principal.user.username" />)</a></li>
    <li class="nav-item"><a class="nav-link" href="/member/update/${principal.user.id }">Update Profile</a></li>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()"> <!-- 의사, 권한명 바꿔야 함 -->
    <li class="nav-item"><a class="nav-link" href="/logout">Log Out(<sec:authentication property="principal.user.username" />)</a></li>
    <li class="nav-item"><a class="nav-link" href="/doctor/update/${principal.user.id }">Update Profile</a></li>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()"> <!-- 관리자, 권한명 바꿔야 함 -->
    <li class="nav-item"><a class="nav-link" href="/logout">Log Out(<sec:authentication property="principal.user.username" />)</a></li>
    <li class="nav-item"><a class="nav-link" href="/admin/memberList/${principal.user.id }">일반 회원 목록</a></li>
    <li class="nav-item"><a class="nav-link" href="/admin/doctorList/${principal.user.id }">의사 회원 목록</a></li>
    </sec:authorize>
  </ul>
  
  </div>
</nav>