<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 비대면 진료 채팅창 목록 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kyj.css" type="text/css">
<div class="nav-body bg-gray-1">
	<table class="nav-item">
		<tr class="nav-title">
			<th class="fs-24 text-black-7">나의 비대면 진료</th>
		</tr>
		<!-- 예약된 비대면 진료 채팅방이 있는 경우(예약 목록대로 채팅방 목록 출력, c:forEach 사용) -->
		<c:forEach var="item" items="${list}">
		<!-- li에 들어가야 할 항목(일반회원)- 진료일시, 의사명 -->
			<c:if test="${user.getMem_auth()==2}">
				<tr>
					<td><a href="/chat/chatRoom" class="chat-room fs-18 text-black-4" data-chat-num="${item.chat_num}" data-res-date="${item.res_date}" data-res-time="${item.res_time}" data-res-num="${item.res_num}">
					${item.res_date} ${item.res_time}
					<br>${item.mem_name} 의사</a></td>
				</tr>
			</c:if>
		<!-- li에 들어가야 할 항목(의사회원)- 진료일시, 환자명 -->
			<c:if test="${user.getMem_auth() ==3}">
			<tr>
				<td><a href="/chat/chatRoom" class="chat-room fs-18 text-black-4" data-chat-num="${item.chat_num}" data-res-date="${item.res_date}" data-res-time="${item.res_time}" data-res-num="${item.res_num}">
				${item.res_date} ${item.res_time}
				<br>${item.mem_name} 환자</a></td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
<!-- 비대면 진료 채팅창 목록 끝 -->