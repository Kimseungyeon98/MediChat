<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css" type="text/css">
<br><br>
<h4><b>좋아요 리스트</b></h4>
<br><br><br>
<div class="align-center">
<h4><b>건강 매거진 좋아요 리스트</b></h4>
<br><br>
<c:if test="${count==0}">
	좋아요가 없습니다.
	<br><br><br><br>
</c:if>
<c:if test="${count > 0}">
<div style="width:100%; ">
		<table class="align-center" id="review-table" >
		 	<tr style="width:100%;">
			 	<th>번호</th>
			 	<th>제목</th>
			 	<th>작성일</th>
			</tr>
	<c:forEach var="r" items="${list}">
			<tr  style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/health/healthDetail?healthy_num=${r.healthy_num}'">
				<th>${r.healthy_num}</th>
				<th style="col-9" >${r.healthy_title}</th>
				<th>${r.h_reg_date}</th>
			</tr>
	</c:forEach>
	</table>
	
	<br><br>
	<div class="align-center">
		${page}
	</div>
	<br><br>
</div>
</c:if>
<h4><b>건강 매거진 댓글 좋아요 리스트</b></h4>
<br><br>
<c:if test="${recount == 0}">
	좋아요가 없습니다.
	<br><br>
</c:if>
<c:if test="${recount > 0}">
<div style="width:100%; margin:0 auto;">
		<table class="align-center" id="review-table" >
		 	<tr style="width:100%;">
			 	<th>번호</th>
			 	<th>댓글 내용</th>
			 	<th>작성일</th>
			</tr>
	<c:forEach var="re" items="${relist}">
		<tr  style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/health/healthDetail?healthy_num=${re.healthy_num}'">
			<th>${re.healthy_num}</th>
			<th style="col-9" >${re.hre_content}</th>
			<th>${re.hre_reg_date}</th>
		</tr>
	</c:forEach>
	</table>
	<br><br>
	<div class="align-center">
		${repage}
	</div>
</div>
</c:if>
</div>