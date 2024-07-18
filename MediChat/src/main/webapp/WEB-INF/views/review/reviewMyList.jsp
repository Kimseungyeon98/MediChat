<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css" type="text/css">

<div class="align-center">
<c:if test="${count  ==0}">
	작성한 후기가 없습니다.
</c:if>
<c:if test="${count > 0}">
		<table class="align-center" id="review-table">
		 	<tr>
			 	<th>번호</th>
			 	<th>리뷰 제목</th>
			 	<th>별점</th>
			 	<th>병원명</th>
			 	<th></th>
			</tr>
	<c:forEach var="r" items="${list}">
			<tr>
				<td>${r.rev_num}</td>
				<td>${r.rev_title}</td>
				<td>${r.rev_grade}</td>
				<td>${r.hos_name}</td>
				<td> 
					<div   style="float:right; margin-right:30px; padding-top:10px;">
				   <input class="checkbox" type="checkbox" id="${r.rev_num}">
				   <label class="toggle" for="${r.rev_num}" data-num="${r.rev_num}">
				        <div id="bar1" class="bars"></div>
				        <div id="bar2" class="bars"></div>
				        <div id="bar3" class="bars"></div>
				   </label>
					</div>
				</td>
			</tr>
			<tr class="${r.rev_num} hide">
				<td colspan="4">
					<div style="margin:0 auto; width:80%; text-align:left;">
							<br>
							${r.rev_title} <br>
							<div class="rating">
								<input type="radio" class="star" id="star5" name="rate" value="5.0" />
							    <label title="Excellent!" for="star5" class="rating__label  half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star4-5" name="rate" value="4.5" />
								   <label title="Excellent!" for="star4-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star4" name="rate" value="4.0" />
								 	 <label title="Excellent!" for="star4"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star3-5" name="rate" value="3.5" />
								  <label title="Excellent!" for="star3-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star3" name="rate" value="3.0" />
							   	 <label title="Excellent!" for="star3"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label> 
								  <input type="radio" class="star" id="star2-5" name="rate" value="2.5" />
								  <label title="Excellent!" for="star2-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
								  <input type="radio" class="star" id="star2" name="rate" value="2.0" />
								   <label title="Excellent!" for="star2"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label> 
								  <input type="radio" class="star"   id="star1-5" name="rate" value="1.5" />
								  <label title="Excellent!" for="star1-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
								  	<input type="radio" class="star"  id="star1" name="rate" value="1.0" />
								   <label title="Excellent!" for="star1"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star"  id="star0-5" name="rate" value="0.5" />
  									<label title="Excellent!" for="star0-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							</div>					
							   <script type="text/javascript">
							   		$('input:radio[value="${r.rev_grade}"]').prop('checked',true);
							   		$('input:radio').prop('disabled',true);
							   		$('input:radio').prop('readonly');
							   </script>
								
							<span >작성일 : ${r.rev_reg} <c:if test="${!empty r.rev_modify}">수정일 : ${r.rev_modify}</c:if></span><br>
							<hr width="100%" size="1">	 
							 ${r.rev_content}
					</div>
				</td>
			</tr>
	</c:forEach>
	</table>
	<div>
		<div class="rating">
								<input type="radio" class="star" id="star5" name="rate" value="5" />
							    <label title="Excellent!" for="star5" class="rating__label  half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star4-5" name="rate" value="4.5" />
								   <label title="Excellent!" for="star4-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star4" name="rate" value="4" />
								 	 <label title="Excellent!" for="star4"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star3-5" name="rate" value="3.5" />
								  <label title="Excellent!" for="star3-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star" id="star3" name="rate" value="3" />
							   	 <label title="Excellent!" for="star3"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label> 
								  <input type="radio" class="star" id="star2-5" name="rate" value="2.5" />
								  <label title="Excellent!" for="star2-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
								  <input type="radio" class="star" id="star2" name="rate" value="2" />
								   <label title="Excellent!" for="star2"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label> 
								  <input type="radio" class="star"   id="star1-5" name="rate" value="1.5" />
								  <label title="Excellent!" for="star1-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
								  	<input type="radio" class="star"  id="star1" name="rate" value="1" />
								   <label title="Excellent!" for="star1"  class="rating__label half">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
							    	<input type="radio" class="star"  id="star0-5" name="rate" value="0.5" />
  									<label title="Excellent!" for="star0-5"  class="rating__label">
								    <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512">
								      <path
								        d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
								      ></path>
								    </svg>
								  </label>
								  
							</div>						    
	</div>
	<script type="text/javascript">
		$('.toggle').click(function(){
			$('.'+$(this).attr('data-num')).toggleClass('hide');
		 });
	</script>
</c:if>
</div>