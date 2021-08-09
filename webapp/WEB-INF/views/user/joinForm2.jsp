<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

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
					<h3>회원가입</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>회원</li>
							<li class="last">회원가입</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- //content-head -->

				<div id="user">
					<div>
						<form id="joinForm" action="${pageContext.request.contextPath}/user/join" method="get">

							<!-- 아이디 -->
							<div class="form-group">
								<label class="form-text" for="input-uid">아이디</label> 
								<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
								<button type="button" id="idChekcBtn">중복체크</button>
							</div>

							<!-- 비밀번호 -->
							<div class="form-group">
								<label class="form-text" for="input-pass">패스워드</label> 
								<input type="text" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요">
							</div>

							<!-- 이메일 -->
							<div class="form-group">
								<label class="form-text" for="input-name">이름</label> 
								<input type="text" id="input-name" name="name" value="" placeholder="이름을 입력하세요">
							</div>

							<!-- //나이 -->
							<div class="form-group">
								<span class="form-text">성별</span> 
								<label for="rdo-male">남</label> 
								<input type="radio" id="rdo-male" name="gender" value="male"> 
								<label for="rdo-female">여</label> 
								<input type="radio" id="rdo-female" name="gender" value="female">

							</div>

							<!-- 약관동의 -->
							<div class="form-group">
								<span class="form-text">약관동의</span> 
								<input type="checkbox" id="chk-agree" value="" name=""> 
								<label for="chk-agree">서비스 약관에 동의합니다.</label>
							</div>

							<!-- 버튼영역 -->
							<div class="button-area">
								<button type="submit" id="btn-submit">회원가입</button>
							</div>

						</form>
					</div>
					<!-- //joinForm -->
				</div>
				<!-- //user -->
			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //footer -->

	</div>
	<!-- //wrap -->

</body>

<script type="text/javascript">
	$("#idChekcBtn").on("click", function(){
		console.log("중복 체크 클릭");
		
		var id = $("#input-uid").val();
		
		console.log(id);
		
		$.ajax({
	        //요청 코드
	        url: "${pageContext.request.contextPath }/user/idCheck",				//데이터를 받을 주소를 입력
	        type: "post",				//get, post 데이터를 보낼 때, 방식을 설정
	        //contentType: "application/json",
	        data: {id : id},				//보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다
	        
	        //데이터를 받는 코드
	        dataType: "json",			//데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다
	        success: function(idCheck) {
	            // TODO : 결과로 받은 resultData로 작업 !
	            if(idCheck == true) {
	            }
	            
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 에러 로그는 아래처럼 확인해볼 수 있다. 
	            alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
	        }
		});
		
	});
	
	//form 전송 버튼을 클릭할 때
	$("#joinForm").on("submit", function(){
		
		//패스워드 8글자 이상 체크
		var password = $("#input-pass").val();
		
		if(password.length <= 8){
			alert("패스워드를 여덟 글자 이상 입력해주세요")
			return false;
			
		//16글자 초과 체크
		} else if (password.length > 16){
			alert("패스워드는 열 여섯 글자를 초과 할 수 없습니다")
			return false;
		}
		
		var name = $("#input-name").val();
		
		if(name.length < 0) {
			alert("이름을 입력해주세요")
			return false;
		}
		
		//약관 동의
		var agree = $("#chk-agree").is("checked")
		console.log(agree);
		
		if(agree == false) {
			alert("약관에 동의해주세요")
			return false;
		}
		
		
		return true;
		
	});
	
	//ajax 방식으로 회원 가입
	$("#")
	
</script>

</html>