<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">

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

				<div id="content-head" class="clearfix">
					<h3>ajax방명록</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>방명록</li>
							<li class="last">ajax방명록</li>
						</ul>
					</div>
				</div>
				<div id="guestbook">
					<div id="writeForm">
						<table id="guestAdd">
							<colgroup>
								<col style="width: 70px;">
								<col>
								<col style="width: 70px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label class="form-text" for="input-uname">이름</label></th>
									<td><c:choose>
											<c:when test="${!empty authUser }">
												<input id="input-uname" type="text" name="name" value="${authUser.name }">
											</c:when>
											<c:otherwise>
												<input id="input-uname" type="text" name="name" value="">
											</c:otherwise>
										</c:choose></td>
									<th><label class="form-text" for="input-pass">패스워드</label></th>
									<td><input id="input-pass" type="password" name="password" value=""></td>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
								</tr>
								<tr class="button-area">
									<td colspan="4" class="text-center"><button id="btnSubmit" type="submit">등록</button></td>
								</tr>
							</tbody>

						</table>
						<!-- //guestWrite -->
						<input type="hidden" name="action" value="add">
					</div>

					<div id="listArea">
						<!-- jquery 리스트 그리는 구역 -->
					</div>
				</div>
				<!-- //guestbook -->

			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //wrap -->

	<!-- 삭제 모달창 -->
	<div id="delModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">방명록 삭제</h4>
				</div>
				<div class="modal-body">
					<label for="delPassword">비밀번호</label>
					<input id="delPassword" type="password" name="password">
					<input type="hidden" name="no">
				</div>
				<div class="modal-footer">
					<button id="modalDel" type="button" class="btn btn-primary">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>

<script type="text/javascript">
	//ready	- DOM 생성 후, 화면이 그려지기 전
	$(document).ready(function() {
		console.log("화면 로딩 직전");
		//리스트 가져오기
		fetchList();
	});

	//굳이 로딩 전에 작동할 필요가 없음
	//등록 버튼 눌렀을 때
	$("#btnSubmit").on("click", function() {

		console.log("등록 버튼");
		//event.preventDefault(); //이벤트의 진행을 멈춤

		/* 
		//name 값 읽어오기
		var name = $("[name=name]").val();
		console.log(name)
		//password 값 읽어오기
		var password = $("[name=password]").val();
		console.log(password)
		//content 값 읽어오기
		var content = $("[name=content]").val();
		console.log(content)
		 */

		var guestBookVo = {
			name : $("[name=name]").val(),
			password : $("[name=password]").val(),
			content : $("[name=content]").val()
		};
		//데이터 ajax 방식으로 서버에 전송
		$.ajax({
			url : "${pageContext.request.contextPath }/api/guestbook/write",
			type : "post", //요청만 텍스트로 가기 때문에, 어차피 외부에서 확인할 수 없음
			//contentType: "application/json",
			dataType : "json",
			data : guestBookVo,
			success : function(guestBookVo) {
				// 성공시 처리해야 할 코드 작성
				console.log(guestBookVo);
				render(guestBookVo, "add");
				
				$("[name=name]").val("")
				$("[name=password]").val("")
				$("[name=content]").val("")

			},
			error : function(XHR, Status, error) {
				// 에러 로그
				console.error(status + ":" + error);
			}
		});
	});

	//리스트 - 삭제버튼 클릭 시
	//btnDel은 렌더 함수를 통해 나중에 추가된 태그이므로, 이벤트의 대상이 될 수 없다
	//따라서 기존에 존재하던 listArea div에 이벤트를 준 뒤, 클래스를 통해 대상을 찾아 위임하여야 이벤트가 발생한다
	$("#listArea").on("click", ".btnDel", function() {
		console.log("클릭");

		var tag = $(this);
		
		var no = tag.data("no");
		
		//no값 집어넣기
		$("#delModal [name=no]").val(no);
		
		//password 값 초기화
		$("#delPassword").val("");
		
		//모달 창 보이기
		$("#delModal").modal();
	
		
	});

	//모달창의 삭제 버튼
	$("#modalDel").on("click", function(){
		console.log("modal삭제")
		
		var no = $("[name=no]").val();
		
		var guestBookVo = {
							no : no,
							password : $("#delPassword").val()
						  }
		
		console.log(guestBookVo)
		
		//서버에 삭제요청 (no, password 전달)
		$.ajax({
			url : "${pageContext.request.contextPath }/api/guestbook/remove",
			type : "post", //요청만 텍스트로 가기 때문에, 어차피 외부에서 확인할 수 없음
			//contentType: "application/json",
			//dataType : "json",
			data :	guestBookVo,
			success : function(count) {
				if(count === 1){
					// 성공시 처리해야 할 코드 작성
					
					//모달 창 닫기
					$("#delModal").modal("hide");
					//리스트의 삭제버튼에 해당하는 테이블 삭제
					$("#t-"+ no).remove();
				} else {
					//모달 창 닫기
					$("#delModal").modal("hide");
				}
				
			},
			error : function(XHR, Status, error) {
				// 에러 로그
				console.error(status + ":" + error);
			}
		});
		
	});
	
	//리스트 가져오기
	function fetchList(){
		//ajax로 요청하기
		$.ajax({
			url : "${pageContext.request.contextPath }/api/guestbook/list",
			type : "post", //요청만 텍스트로 가기 때문에, 어차피 외부에서 확인할 수 없음
			//contentType: "application/json",
			//dataType: "json",
			success : function(guestBookList) {
				// 성공시 처리해야 할 코드 작성
				console.log(guestBookList);

				//화면에 그리기
				for (var i = 0; i < guestBookList.length; i++) {
					render(guestBookList[i], "list"); //방명록의 글 한 개씩 추가하기	
				}
			},
			error : function(XHR, Status, error) {
				// 에러 로그
				console.error(status + ":" + error);
			}
		});
	};
	
	
	//렌더 함수(반복문에서 그려질 내용을 정의)
	function render(guestBookVo, type) {
		var htmlTags = '<table id="t-'+guestBookVo.no+'" class="guestRead">';
		htmlTags += '	<colgroup>';
		htmlTags += '		<col style="width: 10%;">';
		htmlTags += '		<col style="width: 40%;">';
		htmlTags += '		<col style="width: 40%;">';
		htmlTags += '		<col style="width: 10%;">';
		htmlTags += '	</colgroup>';
		htmlTags += '	<tr>';
		htmlTags += '		<td>' + guestBookVo.no + '</td>';
		htmlTags += '		<td>' + guestBookVo.name + '</td>';
		htmlTags += '		<td>' + guestBookVo.regDate + '</td>';
		htmlTags += '		<td><button class="btnDel" data-no="'+ guestBookVo.no +'">삭제</button></td>';
		htmlTags += '	</tr>';
		htmlTags += '	<tr>';
		htmlTags += '		<td colspan=4 class="text-left">' + guestBookVo.content
				+ '</td>';
		htmlTags += '	</tr>';
		htmlTags += '</table>';

		//두번째 파라미터로 추가할 방향 선택
		if (type === "list") {
			$("#listArea").append(htmlTags); //어펜드로 해야 list의 인덱스 순서대로 아래쪽으로 붙게된다
		} else if (type === "add") {
			$("#listArea").prepend(htmlTags);
		}
	}
</script>
</html>