<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ych.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.3/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.3/dist/sweetalert2.min.css" rel="stylesheet">
<!-- MyPage 메뉴 시작 -->
<div class="side-bar">
<ul style="padding: 0 0 !important; margin-top:20px;">
		<li style="font-size:25px; font-weight:bold;">마이페이지</li>
		<li class="fs-17 text-black-5"><span class="fs-20 fw-7 text-black-7" style="color:darkgreen;">${user.mem_name}님</span> 반갑습니다.</li>
		<li>
				<img src="${pageContext.request.contextPath}/doctor/docPhotoView"
				width="150" height="150" class="my-photo border rounded-circle" 
				onclick="location.href='${pageContext.request.contextPath}/schedule/list'">
				<div class="camera" id="photo_btn">
					<img src="${pageContext.request.contextPath}/images/reset.png">
				</div>			

		</li>
		<li>
			<div id="photo_choice" style="display:none;">
				<input type="file" id="upload" accept="image/gif,image/png,image/jpeg"><br>
				<input type="button" value="변경" id="photo_submit"> 
				<input type="button" value="취소" id="photo_reset"> 
			</div>
		</li>
		<div class="nav_align" style="text-align:left; margin-left:85px; padding:10px;">
			<ul>
				<li>
					<h5>이용내역</h5>
				</li>
			 	<li style="margin-bottom:10px; font-size:15px;">
			        <a href="${pageContext.request.contextPath}/schedule/list" class="detail-btn">스케줄 관리</a>
			    </li>
		        <li style="margin-bottom:10px; font-size:15px;">
		        	<c:if test="${user.doc_treat == 1}">
		            <a href="${pageContext.request.contextPath}/reservation/docCompletedList" class="detail-btn">진료기록</a>
		            </c:if>
		        </li>
		        <li style="margin-bottom:10px; font-size:15px;">
		        	<c:if test="${user.doc_treat == 1}">
		            <a href="${pageContext.request.contextPath}/reservation/docResList" class="detail-btn">예약내역</a>
		            </c:if>
		        </li>

			    <li style="margin-bottom:10px; font-size:15px;">
			        <c:if test="${user.doc_treat == 1}">
		            	<a href="${pageContext.request.contextPath}/chat/chatView" class="detail-btn">비대면 진료</a>
		        	</c:if>
		        </li>
		         <li>
					<h5 style="margin-top:30px;">나의 활동</h5>
				</li>
		         <li style="margin-bottom:50px; font-size:15px;">
		            <a href="${pageContext.request.contextPath}/doctor/healthyMydoc" class="detail-btn">내가 쓴 글</a>
		        </li>
				<li style="margin-bottom:10px; font-size:15px;">
		            <a href="${pageContext.request.contextPath}/doctor/modifyDoctor" class="detail-btn">회원정보 수정</a>
		        </li>
		        <li style="margin-bottom:10px; font-size:15px;">
		            <a href="${pageContext.request.contextPath}/doctor/deleteDoctor" class="detail-btn">회원탈퇴</a>
		        </li>
		        <li style="font-size:15px; padding-bottom:10px;">
		            <a href="${pageContext.request.contextPath}/doctor/logout" class="detail-btn">로그아웃</a>
		        </li>
	        </ul>
        </div>
	</ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/doctor.profile.js"></script>
<!-- MyPage 메뉴 끝 -->











