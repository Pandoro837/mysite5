<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/gallery.css" rel="stylesheet" type="text/css">


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

				<div id="file">
					<form method="post" action="${pageContext.request.contextPath }/fileup/upload" enctype="multipart/form-data">
						<table>
							<colgroup>
								<col style="width: 600px;">
								<col style="width: 220px;">
							</colgroup>
							<tr>
								<td class="text-left"><input type="file" name="file"></td>
								<td class="text-right"><button type="submit">파일업로드</button></td>
							</tr>
						</table>
					</form>
				</div>
				<!-- //file -->


			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->


		<!-- 푸터 -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //푸터 -->
	</div>
	<!-- //wrap -->

</body>

</html>


