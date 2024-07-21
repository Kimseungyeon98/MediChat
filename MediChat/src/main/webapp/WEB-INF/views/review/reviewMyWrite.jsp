<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/review.css"
	type="text/css">
<div class="align-center" style="padding: 0 auto;">
	<div class="align-left" style="margin: 0 auto; width: 60%;">
		<form:form action="writeReview" method="post" modelAttribute="reviewVO">
		<h4>후기 작성</h4>
		<br>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;병원명 : 병원명이 나오게할거임</h2>
		<br>
		<div class="align-center float-clear" style="position:relative;">
		<div class="align-center" style="width: 330px; margin: 0 auto;">
			<div class="rating" style="zoom: 2; position:absolute; margin: 0 auto;">
				<input type="radio" class="star" id="star5" name="rev_grade" value="5" />
				<label title="Excellent!" for="star5" class="rating__label  half">
					<svg xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star4-5" name="rev_grade"
					value="4.5" /> <label title="Excellent!" for="star4-5"
					class="rating__label"> <svg
						xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star4" name="rev_grade" value="4" />
				<label title="Excellent!" for="star4" class="rating__label half">
					<svg xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star3-5" name="rev_grade"
					value="3.5" /> <label title="Excellent!" for="star3-5"
					class="rating__label"> <svg
						xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star3" name="rev_grade" value="3" />
				<label title="Excellent!" for="star3" class="rating__label half">
					<svg xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star2-5" name="rev_grade"
					value="2.5" /> <label title="Excellent!" for="star2-5"
					class="rating__label"> <svg
						xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star2" name="rev_grade" value="2" />
				<label title="Excellent!" for="star2" class="rating__label half">
					<svg xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star1-5" name="rev_grade"
					value="1.5" /> <label title="Excellent!" for="star1-5"
					class="rating__label"> <svg
						xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star1" name="rev_grade" value="1" />
				<label title="Excellent!" for="star1" class="rating__label half">
					<svg xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label> <input type="radio" class="star" id="star0-5" name="rev_grade"
					value="0.5" /> <label title="Excellent!" for="star0-5"
					class="rating__label"> <svg
						xmlns="http://www.w3.org/2000/svg" height="1em"
						viewBox="0 0 576 512">
								      <path
							d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
								    </svg>
				</label>
			</div>
		</div>
		<br><br><br><br><span style="position:relative;">별점을 클릭하여 선택</span><br><br><br>
				<input type="text" name="rev_title" id="rev_title" placeholder="리뷰 제목을 입력해주세요" style="width:620px; height:40px;  border-radius:5px;" ><br><br>
				<textarea rows="8" cols="80" name="rev_content" id="rev_content"  style="resize:none; border-radius:5px;" placeholder="리뷰 내용은 300자까지 입력가능합니다." ></textarea>
				<br><br>
				<input type="submit" value="후기작성" class="default-btn">
		</div>
		</form:form>
		<br><br><br><br>
	</div>
</div>