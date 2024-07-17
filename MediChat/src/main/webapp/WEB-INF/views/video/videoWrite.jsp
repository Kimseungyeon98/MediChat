<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>

<div class="page-main">
	<div class="page-one">
		<h4>홈 > 건강 비디오 >  글쓰기</h4> 		
		<h2>&nbsp;&nbsp;&nbsp;건강 비디오 </h2>
		
		<hr size="1" width="80%">
		
		<form:form action="videoWrite" id="register_form" method="post" modelAttribute="videoVO" enctype="multipart/form-data">
				<ul>
					<li>
						<select name="v_category" id="selectinput">
							<option value="a" >건강</option>
							<option value="b">미용</option>
							<option value="c" >홍보</option>
						</select>
					</li>
					<li>
						<form:input path="video_title" placeholder="제목을 입력하세요"/>
						<form:errors path="video_title" cssClass="error-color"/>
					</li>
					<li>
						<form:textarea path="video_content" placeholder="영상링크 맨 상단에 첨부해주세요"/>
						<form:errors path="video_content" cssClass="error-color"/>
						<script>
							 function MyCustomUploadAdapterPlugin(editor) {
								    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
								        return new UploadAdapter(loader);
								    }
								}
							 
							 ClassicEditor
					            .create( document.querySelector( '#video_content' ),{
					            	extraPlugins: [MyCustomUploadAdapterPlugin]
					            })
					            .then( editor => {
									window.editor = editor;
								} )
					            .catch( error => {
					                console.error( error );
					            } );
				    </script> 
					</li>
			</ul>
			<div class="align-center">
				<form:button class="default-btn">글쓰기</form:button>
				<input type="button" class="default-btn" value="목록" onclick="location.href='${pageContext.request.contextPath}/video/videoList'">
			</div>
		
			</form:form>
	</div>
</div>