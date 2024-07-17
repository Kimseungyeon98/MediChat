<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 의사회원가입 시작 -->
<div class="container">
	<h2 class="title">회원가입(의사)</h2>
	<hr size="1" width="100%" noshade="noshade">
	<span style="font-weight:bold;">정보입력</span>
	<br>
	<span class="title2">회원가입에 필요한 정보를 입력합니다.</span>
	<form:form action="registerDoc" id="doctor_register" enctype="multipart/form-data" modelAttribute="doctorVO">
		<div class="form-main">
		<ul>
			<li style="margin-top:20px;">
				<form:label path="mem_id">아이디</form:label>
				<form:input path="mem_id" placeholder="영문or숫자사용하여 4~12자 입력하세요." autocomplete="off" style="width:250px;"/>
				<input type="button" id="confirmId" value="중복확인" class="default-btn" style="margin-left:0px;">
				<form:errors path="mem_id" cssClass="error-color" style="display:inline;"/><br>
				<span id="message_id" style=""></span>
			</li>
			<li>
				<form:label path="doc_passwd">비밀번호</form:label>
				<form:password path="doc_passwd" placeholder="영문,숫자 조합하여 4~12자 입력하세요."/>
				<form:errors path="doc_passwd" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="mem_name">이름</form:label>
				<form:input path="mem_name" placeholder="이름"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="doc_email">이메일</form:label>
				<form:input path="doc_email" placeholder="test@test.com 형식으로 입력하세요."/>
				<form:errors path="doc_email" cssClass="error-color"/>
			</li>
			<li>
				<!-- 병원 목록 검색 -->
				<form:label path="hos_num">병원</form:label>
				<form:hidden path="hos_num"/>
				<input type="search" name="keyword" id="keyword" value="${keyword}">
                <input type="button" id="search_button" value="검색">
                <form:errors path="hos_num" cssClass="error-color"/>
            </li>
            <li style="margin-left:205px;">
            	<form:select path="hos_num">
              	 	<c:forEach var="hos" items="${hosList}">
            			<option value="${hos.hos_num}">${hos.hos_name}/${hos.hos_addr}</option>
            		</c:forEach>
                </form:select>
            </li>
			<li>
				<form:label path="doc_history">연혁</form:label>
				<form:textarea path="doc_history" placeholder="연혁을 입력해주세요." style="height: 150px; vertical-align: top;"/>
			</li>
		</ul>
		</div>
		<hr size="1" width="100%" noshade="noshade">
		<div class="upload-form">
		<ul>
			<li>
				<form:label path="upload">의사 면허증</form:label>
				<input type="file" name="upload" id="upload">
				<form:errors path="upload" cssClass="error-color"/>
			</li>
		</ul>
		</div>
		<!-- 캡챠 시작 -->
		<hr size="1" width="100%" noshade="noshade">
		<div class="captcha">
		<ul>
			<li>
				<span style="font-weight:bold;">인증문자 입력</span>
				<div id="captcha_div">
					<img src="getCaptcha" id="captcha_img" width="200" height="90">
					<input type="button" value="새로고침" id="reload_btn">
				</div>
			</li>
			<li>
				<form:label path="captcha_chars" >인증문자 확인</form:label>
				<form:input path="captcha_chars" placeholder="인증문자를 입력하세요."/>
				<form:errors path="captcha_chars" cssClass="error-color"/>
			</li>
		</ul>
		</div>
		<!-- 캡챠 끝 -->
		<hr size="1" width="80%" noshade="noshade">
		<div style="text-align:right;">
			<input type="button" value="홈으로" id="reload_btn" onclick="location.href='${pageContext.request.contextPath}/main/main'">
			<form:button class="default-btn">가입신청</form:button>
		</div>
	</form:form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/doctor.register.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    $('#search_button').on('click', function() {
	        var keyword = $('#keyword').val();
	
	        $.ajax({
	            url:'${pageContext.request.contextPath}/doctor/hosList',
	            type:'post',
	            dataType:'json',
	            data:{keyword:keyword},
	            success:function(data){
	                if(data.success){
	                   var hosList = data.hosList;
	                   var options = '';
	                   // 기존 옵션 초기화
	                    $('form').find('select[name="hos_num"]').empty();

	                   $.each(hosList, function(index, hospital) {
	                       options += '<option value="' + hospital.hos_num + '">' 
	                                + hospital.hos_name + ' / ' + hospital.hos_addr + '</option>';
	                   });
	                   $('form').find('select[name="hos_num"]').append(options);
	                }else{
	                   alert('병원 목록을 가져오는 중에 오류가 발생하였습니다.');
	                }
	            },
	            error:function(){
	               alert('서버 통신 중 오류가 발생하였습니다.');
	            }
	        });
	    });
	 	// select 태그 값 변경 시
	    $('form').on('change','select[name="hos_num"]',function() {
	        var selectedHosNum = $(this).val();
	        $('form').find('input[name="hos_num"]').val(selectedHosNum); // 숨겨진 input 태그에 선택한 값 할당
	    });
	});
</script>
<script>
	$(function(){
		$('#reload_btn').click(function(){
		 $.get('getCaptcha', function(data) {
	            $('#captcha_img').attr('src', 'getCaptcha?' + new Date().getTime());
	        }).fail(function() {
	            alert('네트워크 오류 발생');
	        });
		});
	});
</script>
</div>
<!-- 의사회원가입 끝 -->