<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/gallery.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>

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
					<h3>갤러리</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>갤러리</li>
							<li class="last">갤러리</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- //content-head -->

				<div id="gallery">
					<div id="list">

						<c:if test="${!empty authUser}">
							<button id="btnImgUpload">이미지올리기</button>
						</c:if>
						<div class="clear"></div>


						<ul id="viewArea">
							<!-- 이미지반복영역 -->
							<c:if test="${!empty galleryList }">
								<c:forEach items="${galleryList }" var="imgInfo">
									<li>
										<div class="view" data-no="${imgInfo.galleryNo }">
											<img class="imgItem" src="${pageContext.request.contextPath }/upload/${imgInfo.saveName}" >
											<div class="imgWriter" >
												작성자: <strong>${imgInfo.userName }</strong>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
					<!-- //list -->
				</div>
				<!-- //gallery -->


			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->
	
		<!-- 푸터 -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //푸터 -->
	</div>
	<!-- //wrap -->









	<!-- 이미지등록 팝업(모달)창 -->
	<div class="modal fade" id="addModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이미지등록</h4>
				</div>

				<form method="post" action="${pageContext.request.contextPath }/gallery/upload" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group">
							<label class="form-text">글작성</label> <input id="addModalContent" type="text" name="content" value="">
						</div>
						<div class="form-group">
							<label class="form-text">이미지선택</label> <input id="file" type="file" name="file" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn" id="btnUpload">등록</button>
					</div>
				</form>


			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<!-- 이미지보기 팝업(모달)창 -->
	<div class="modal fade" id="viewModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이미지보기</h4>
				</div>
				<div class="modal-body">

					<div class="formgroup">
						<img id="viewModelImg" src="">
						<!-- ajax로 처리 : 이미지출력 위치-->
					</div>

					<div class="formgroup">
						<p id="viewModelContent">콘텐츠</p>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="btnDel">삭제</button>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
<%-- 불필요한 태그를 남기게 된다
	<!-- 유저 확인용 -->
	<c:if test="${!empty authUser }">
		<input class="auth" type="hidden" data-auth="${authUser.no }">
	</c:if>
 --%>
</body>

<script type="text/javascript">
	//업로드 버튼 클릭 시, 모달 팝업
	$("#btnImgUpload").on("click", function(){
		console.log("업로드 버튼 클릭");
		$("#addModal").modal();
	});
	
	//글 보기 모달
	$(".view").on("click", function(){
		
		$.ajax({
	        url: "${pageContext.request.contextPath }/api/gallery/show",
	        type: "post",
	        //contentType: "application/json",
	        data: { galleryNo : $(this).data("no") },
	        
	        //dataType: "json",
	        success: function(showVo) {
	            // TODO : 결과로 받은 resultData로 작업 !
	        	
	            console.log(showVo.userNo);
	           // console.log($(".auth").data("auth"));
	            
	            
	            //작업의 진행 순서는 JAVA>JSTL>HTML>Javscript
//				if($(".auth").data("auth") == null || ($(".auth").data("auth") != showVo.userNo)){
//				if('<c:out value="${sessionScope.authUser.no }" />' == null || ('<c:out value="${sessionScope.authUser.no }" />' != showVo.userNo)){
				if("${sessionScope.authUser.no }" == null || "${sessionScope.authUser.no }" != showVo.userNo){
						 
					console.log("불일치");
					$("#btnDel").hide();
			            
				} else {
					console.log("일치");
					$("#btnDel").show();
				}
	            //null 값을 upload의 리콰이어로 해결
//	        	if(showVo.content === null){
//	        		showVo.content = "";
//	        	}
	        
	        	$("#viewModelImg").attr("src", "${pageContext.request.contextPath}/upload/" + showVo.saveName);
	        	$("#viewModelContent").text(showVo.content);
	        	
	        	$("#viewModal").modal();
	        	
	        	//글 삭제 모달
	        	$("#btnDel").on("click", function(){
	        		console.log("삭제 버튼 클릭");
	        		
	        		$.ajax({
	        	        url: "${pageContext.request.contextPath }/api/gallery/remove",
	        	        type: "post",
	        	        //contentType: "application/json",
	        	        data: { galleryNo : showVo.galleryNo },
	        	        
	        	        //dataType: "json",
	        	        success: function(result) {
	        	            // TODO : 결과로 받은 resultData로 작업 !
	        	            console.log("결과"+result);
	        	        	if(result === 1){
	        	        		 $("[data-no = " + showVo.galleryNo + "]").remove();
	        	        			$("#viewModal").modal("hide");
	        	        		 
	        	        	}
	        	        
	        	        },
	        	        error: function(jqXHR, textStatus, errorThrown) {
	        	            // 에러 로그는 아래처럼 확인해볼 수 있다. 
	        	            alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
	        	        }
	        		});
	        		
	        	});
	        	
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 에러 로그는 아래처럼 확인해볼 수 있다. 
	            alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
	        }
		})
		
	});
	
</script>

</html>

