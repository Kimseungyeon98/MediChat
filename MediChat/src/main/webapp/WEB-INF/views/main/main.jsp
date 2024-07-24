<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<!-- 베너 -->
	<div>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex justify-content-center" style="background-color:#ABCE5F">
						<img src="/images/mainCarousel/001.png" height="360px" width="640px">
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-center" style="background-color:#FFCD4A">
						<img src="/images/mainCarousel/002.png" height="360px" width="640px">
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-center" style="background-color:#FECCBE">
						<img src="/images/mainCarousel/004.png" height="360px" width="640px">
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-center" style="background-color:#CBEFFF">
						<img src="/images/mainCarousel/005.png" height="360px" width="640px">
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-center" style="background-color:#FFCD4A">
						<img src="/images/mainCarousel/006.png" height="360px" width="640px">
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>
	</div>
	<div id="main_container">
		<!-- 검색 시작 -->
		<div id="main-search-form-box" >
			<form id="main-search-form" action="/hospitals/search" method="get">
				<img id="main-search-logo" width="55px" height="35px" src="/images/loginLogo.png">
				<input type="text" id="main-search-input" name="keyword" placeholder="병원 이름, 지역 + 과목, 증상">
				<img id="main-search-icon" width="30px" height="30px" src="/images/search.png">
			</form>
		</div>
		<!-- 검색 끝 -->
		<div style="height:117px;"></div>
		<!-- 실시간 상담 시작 -->
		<div id="main-consult-box">
			<div class="main-titleAndMore">
				<div class="main-titleAndMore-title">실시간 상담</div>
				<div class="main-titleAndMore-more"><a href="#">더보기</a></div>
			</div>
			<div class="row d-flex justify-content-between">
				<c:forEach begin="1" end="4">
				<div class="col-5 main-consult-item">
					<div class="main-consult-item-title">제목</div>
					<div class="main-consult-item-content">내용</div>
					<div class="d-flex align-items-center">
						<div class="rounded-4 bg-success"><img src="/images/doctor.png" width="20px" height="20px"></div>
						<div class="main-consult-item-replyCnt">1개의 답변</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<!-- 실시간 상담 끝 -->
		<div style="height:80px;"></div>
		<!-- 건강 매거진 시작 -->
		<div id="main-magagine-box">
			<div class="main-titleAndMore">
				<div class="main-titleAndMore-title">건강 매거진</div>
				<div class="main-titleAndMore-more"><a href="#">더보기</a></div>
			</div>
			<div class="row d-flex justify-content-between">
				<c:forEach var="healthy" items="${list}">
					<div class="main-magagine-item col-5">
						<div class="row d-flex align-items-center" onclick="location.href='${pageContext.request.contextPath}/health/healthDetail?healthy_num=${healthy.healthy_num}'">
							<div class="col-9">
								<div class="main-magagine-item-title">
									<a href="${pageContext.request.contextPath}/health/healthDetail?healthy_num=${healthy.healthy_num}">${healthy.healthy_title}</a>
								</div>
								<div class="main-magagine-item-date">
									${healthy.h_reg_date}
								</div>
							</div>
							<div class="col-3">
								<div>
									<c:if test="${!empty healthy.h_filename}"><img  width="80" height="80" style="border-radius:10px;" src="${pageContext.request.contextPath}/upload/${healthy.h_filename}"/></c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 건강 매거진 끝 -->
		<div style="height:80px;"></div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>