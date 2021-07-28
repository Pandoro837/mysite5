<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="aside">
	<c:set var="servletPath" value="${pageContext.request.servletPath }"/>	<!-- c:set으로 var에 value = servletPath를 입력 -->
	<c:choose>
		<c:when test ="${fn:contains(servletPath, 'user')}">		<!-- fn으로 servletPath내부에 user라는 값이 있는지 비교 -->
			<h2>회원</h2>
			<ul>
				<li>회원정보</li>
				<li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/user/joinForm">회원가입</a></li>
			</ul>
		</c:when>
		<c:when test ="${fn:contains(servletPath, 'guestbook')}">
			<h2>방명록</h2>
			<ul>
				<li><a href="/${pageContext.request.contextPath}/guestbook/addList">일반방명록</a></li>
				<li>ajax방명록</li>
			</ul>		
		</c:when>
		<c:when test ="${fn:contains(servletPath, 'board')}">
			<h2>게시판</h2>
			<ul>
				<li><a href="/${pageContext.request.contextPath}/board/list">일반게시판</a></li>
				<li><a href="">댓글게시판</a></li>
			</ul>	
		</c:when>
	</c:choose>
</div>