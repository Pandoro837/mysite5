<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/board.css" rel="stylesheet" type="text/css">
</head>


<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!-- //header -->
		
		<c:import url="/WEB-INF/views/includes/navigator.jsp"></c:import>
		<!-- //nav -->

		<div id="container" class="clearfix">
			
			<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
			<!-- //aside -->


			<div id="content">

				<div id="content-head">
					<h3>게시판</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>게시판</li>
							<li class="last">일반게시판</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- //content-head -->

				<div id="board">
					<div id="modifyForm">
						<form action="${pageContext.request.contextPath }/board/modify" method="get">
							<input type="hidden" name="boardNo" value="${boardModify.boardNo }">
							<!-- 작성자 -->
							<div class="form-group">
								<span class="form-text">작성자</span> 
								<span class="form-value">${boardModify.name }</span>
							</div>

							<!-- 조회수 -->
							<div class="form-group">
								<span class="form-text">조회수</span> 
								<span class="form-value">${boardModify.hit }</span>
							</div>

							<!-- 작성일 -->
							<div class="form-group">
								<span class="form-text">작성일</span> 
								<span class="form-value">${boardModify.regDate }</span>
							</div>

							<!-- 제목 -->
							<div class="form-group">
								<label class="form-text" for="txt-title">제목</label> 
								<input type="text" id="txt-title" name="title" value="${boardModify.title }">
							</div>



							<!-- 내용 -->
							<div class="form-group">
								<textarea id="txt-content" name="content">${boardModify.content }</textarea>
							</div>

							<a id="btn_cancel" href="${pageContext.request.contextPath }/board/list">취소</a>
							<button id="btn_modify" type="submit">수정</button>

						</form>
						<!-- //form -->
					</div>
					<!-- //modifyForm -->
				</div>
				<!-- //board -->
			</div>
			<!-- //content  -->

		</div>
		<!-- //container  -->


		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //wrap -->

</body>

</html>