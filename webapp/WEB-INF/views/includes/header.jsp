<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header" class="clearfix">
			<h1>
				<a href="${pageContext.request.contextPath}/main">MySite</a>
			</h1>

			<c:if test="${not empty authUser}">
			<ul>
				<li> ${authUser.name} 님 안녕하세요^^</li>
				<li><a href="${pageContext.request.contextPath}/user/logout" class="btn_s">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath}/user/modifyForm" class="btn_s">회원정보수정</a></li>
			</ul>
			</c:if>
			<c:if test="${empty authUser }">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/loginForm" class="btn_s">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/joinForm" class="btn_s">회원가입</a></li>
				</ul>
			</c:if>

		</div>