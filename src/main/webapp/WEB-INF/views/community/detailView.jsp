<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- detailView 전용 스타일 -->
<link rel="stylesheet" href="/css/boardDetailView.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>
.mainContent div{border: 1px solid black;}

</style>

<script>
	$(function(){
		let replyArea = $('<div class="replyArea">');//각 댓글 전체 div
		
		////////댓글 프로필, 닉네임////////
		let replyTopArea = $('<div class="replyTopArea">');//댓글 프로필, 닉네임 전체 영역
		
		let replyProfileArea = $('<div class="replyProfileArea">');//프로필 div
		let replyProfile = $('<img src="/img/normal_profile.png" class="replyProfile">');//프로필
		replyProfileArea.append(replyProfile);//프로필 div에 프로필 삽입
		
		replyTopArea.append(replyProfileArea);//댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
		replyTopArea.append("&nbsp;닉네임");//댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
		
		////////댓글 본문////////
		let replyMiddleArea = $('<div class="replyMiddleArea">');
		replyMiddleArea.append("본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글");

		////////댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션////////
		let replybottomArea = $('<div class="replybottomArea">');
		replybottomArea.append('<b>시간</b>&nbsp;');//시간
		replybottomArea.append('<b>좋아요 수</b>&nbsp;');//좋아요 수
		replybottomArea.append('<b>답댓글 수</b>&nbsp;');//답댓글 수
		replybottomArea.append('<b class="replyOption">⋮</b>');//옵션
		
		replyArea.append(replyTopArea);//각 댓글 전체 div에---댓글 프로필, 닉네임 전체 영역
		replyArea.append(replyMiddleArea);//각 댓글 전체 div에---댓글 본문 영역
		replyArea.append(replybottomArea);//각 댓글 전체 div에---댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 영역

		////////////////////////////////////////////////////////////////////////////////////
	
		
		let reply_reArea = $('<div class="reply_reArea">');//각 답댓글 전체 div
		
		////////답댓글 프로필, 닉네임////////
		let reply_reTopArea = $('<div class="reply_reTopArea">');//답댓글 프로필, 닉네임 전체 영역
		
		let reply_reProfileArea = $('<div class="reply_reProfileArea">');//프로필 div
		let reply_reProfile = $('<img src="/img/normal_profile.png" class="reply_reProfile">');//프로필
		reply_reProfileArea.append(reply_reProfile);//프로필 div에 프로필 삽입
		
		reply_reTopArea.append('<i class="bi bi-arrow-return-right"></i>');//답댓글 프로필, 닉네임 전체 영역에--들여쓰기 기호 삽입
		reply_reTopArea.append(reply_reProfileArea);//답댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
		reply_reTopArea.append("&nbsp;닉네임");//답댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
		
		////////답댓글 본문////////
		let reply_reMiddleArea = $('<div class="reply_reMiddleArea">');
		reply_reMiddleArea.append("본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글");

		////////답댓글 등록한 시간, 좋아요 수 옵션////////
		let reply_rebottomArea = $('<div class="reply_rebottomArea">');
		reply_rebottomArea.append('<b>시간</b>&nbsp;');//시간
		reply_rebottomArea.append('<b>좋아요 수</b>&nbsp;');//좋아요 수
		reply_rebottomArea.append('<b class="reply_reOption">⋮</b>');//옵션
		
		reply_reArea.append(reply_reTopArea);//각 답댓글 전체 div에---답댓글 프로필, 닉네임 전체 영역
		reply_reArea.append(reply_reMiddleArea);//각 답댓글 전체 div에---답댓글 본문 영역
		reply_reArea.append(reply_rebottomArea);//각 답댓글 전체 div에---답댓글 등록한 시간, 좋아요 수, 옵션 영역

		
		
		
		
		$(".replyEntireArea").append(replyArea);//댓글 영역에 댓글 삽입
		$(".replyEntireArea").append("<br>");
		
		$(".replyEntireArea").append(reply_reArea);//댓글 영역에 답대글 삽입
		$(".replyEntireArea").append("<br>");
	})	
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		
		<!-- 카테고리 정보 출력하기 -->
		<c:set var="seqString" value="${dto.board_seq}" /><!-- 게시글 시퀀스 가지고 -->
		<c:set var="category" value="${fn:substring(seqString,0,1)}" /><!-- 앞 한글자 따기 -->
		<c:choose>
			<c:when test="${category eq 'q'}"><div>커뮤니티 > 궁금해요</div></c:when>
			<c:when test="${category eq 'h'}"><div>커뮤니티 > 도와주세요</div></c:when>
			<c:when test="${category eq 's'}"><div>커뮤니티 > 도와드려요</div></c:when>
			<c:when test="${category eq 'd'}"><div>커뮤니티 > 일상</div></c:when>		
		</c:choose>
	
		
		<div id="title">${dto.title}</div>
		<!-- 프로필, 닉네임, 조회수, 마감버튼, 옵션버튼 -->
		<div id="headerArea">
		
			<!-- 프로필 -->
			<div id="profileArea">
				<div class="profile">
					<img class = "imgs" src="/img/normal_profile.png">				
				</div>
			</div>
			
			<!-- 닉네임/ 등록시간, 조회수 -->
			<div id="profileCenterArea">
				<div id="name">
					닉네임
				</div>
				<div id="nicknameUnderArea">	<!-- append로 넣기 -->
<!-- 					<span id="board_reg_date">등록 시간</span> -->
<!-- 					&nbsp;·&nbsp; -->
<!-- 					<span id = "board_viewCount">조회 수</span> -->
				</div>
	
			</div>
			
			
			<!-- 마감 버튼, 옵션 버튼 -->
			<div id="profileRigintArea">
				<span style="float:right; margin-right: 4px;">
					<button id="close">마감</button>&nbsp;
					<b id="option">⋮</b>
				</span>
			</div>	
			
		</div>
		
		<hr>
		
		<!-- 본문 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">
				<p>${dto.contents}</p>
			</div>
			<!-- 사진 영역 -->
			<div class="col-12 picture">
				사진 영역
			</div>
			<!-- 해시태그 영역 -->
			<div class="col-12 hashtag">
				해시태그 영역
			</div>
			<!-- 좋아요, 댓글 수 영역 -->
			<div class="col-12 good_relpyCount">
				좋아요 댓글 수 영역
			</div>
			
			<div class="col-12">
				<hr>
			</div>

			<!-- 댓글 입력창 영역 -->
			<div class="col-12">
				<div class="row replyInputArea">
					<div class="col-9 col-sm-10">
						<div contentEditable=true data-text="댓글을 남겨보세요." id="replyInput"></div>
					</div>
					<div class="col-3 col-sm-2 replyBtnArea">
						<button type="button" id="replyBtn">등록</button>
					</div>
				</div>
			</div>		
			
							
			<!-- 댓글 영역 -->
			<div class="col-12 mt-4 replyEntireArea">
			
<!-- 				각 댓글 전체 div -->
<!-- 				<div class="replyArea"> -->
<!-- 					댓글 프로필, 닉네임 -->
<!-- 					<div class="replyTopArea"> -->
<!-- 						<div class="replyProfileArea"> -->
<!-- 							<img src="/img/normal_profile.png" class="replyProfile"> -->
<!-- 						</div>&nbsp;닉네임 -->
<!-- 					</div> -->
<!-- 					댓글 본문 -->
<!-- 					<div class="replyMiddleArea"> -->
<!-- 						본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글 -->
<!-- 					</div> -->
<!-- 					댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
<!-- 					<div class="replybottomArea"> -->
<!-- 						<b>시간</b>&nbsp; -->
<!-- 						<b>좋아요 수</b>&nbsp; -->
<!-- 						<b>답댓글 수</b>&nbsp; -->
<!-- 						<b class="replyOption">⋮</b> -->
<!-- 					</div> -->
					
					
<!-- 					<br> -->
<!-- 					답댓글 전체 div-----------------------------------		 -->
<!-- 					<div class="reply_reArea"> -->
<!-- 						답댓글 프로필, 닉네임 -->
<!-- 						<div class="reply_reTopArea"> -->
<!-- 							<i class="bi bi-arrow-return-right"></i> -->
<!-- 							<div class="reply_reProfileArea"> -->
<!-- 								<img src="/img/normal_profile.png" class="reply_reProfile"> -->
<!-- 							</div>&nbsp;닉네임 -->
<!-- 						</div> -->
<!-- 						답댓글 본문 -->
<!-- 						<div class="reply_reMiddleArea"> -->
<!-- 							본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글 -->
<!-- 						</div> -->
<!-- 						답댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
<!-- 						<div class="reply_rebottomArea"> -->
<!-- 							<b>시간</b>&nbsp; -->
<!-- 							<b>좋아요 수</b>&nbsp; -->
<!-- 							<b class="reply_reOption">⋮</b> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					
<!-- 				</div> -->


			</div>
			
			
			
			
			
			
									
		</div>
	
	</div>
	








	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	
	
	
	
	
	<script>
	//게시글 등록 시간, 조회 수 넣기
	let board_reg_date_diff = elapsedTime("${dto.write_date}");//등록 시간 차 구하기//함수 호출
	
	let board_reg_date = $('<span id="board_reg_date">'+board_reg_date_diff+'</span>');//등록 시간
	let board_viewCount = $('<span id = "board_viewCount">${dto.view_count}</span>');//조회수
	
	$("#nicknameUnderArea").append(board_reg_date);//게시글 등록 시간 넣기
	$("#nicknameUnderArea").append("&nbsp;·&nbsp;");
	$("#nicknameUnderArea").append(board_viewCount);//게시글 조회 수 넣기

// 	$('document').ready(function(){
// 		let board_reg_date = elapsedTime("${dto.write_date}");//등록 시간 차 구하기
// 		$("#board_reg_date").text(board_reg_date);
// 	})
	


	
	
	
	
	//등록 시간차 구하는 함수
	function elapsedTime(i) {
	   
	      const timeValue = new Date(i);
	        const today = new Date();
	        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        
	        if (betweenTime < 1) {
	           return '방금 전';
	        }
	        
	        if (betweenTime < 60) {
	           return betweenTime + '분 전';
	        }
	 
	        const betweenTimeHour = Math.floor(betweenTime / 60);
	        if (betweenTimeHour < 24) {
	           return betweenTimeHour + '시간 전';
	        }
	 
	        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeDay < 365) {
	           return betweenTimeDay + '일 전';
	        }
	           return Math.floor(betweenTimeDay / 365) + '년 전';
	}	
	
	
	</script>

</body>
</html>