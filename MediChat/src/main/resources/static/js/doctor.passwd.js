$(function(){
	/*---------------------
		비밀번호 변경체크
	----------------------*/
	$('#doc_passwd').keyup(function(){
		if($('#confirm_passwd').val()!='' && $('#confirm_passwd').val()!=$(this).val() ){
			$('#message_password').text('비밀번호 불일치').css('color','red');
		}else if($('#confirm_passwd').val()!='' && $('#confirm_passwd').val()==$(this).val() ){
			$('#message_password').text('비밀번호 일치').css('color','#000');
		}
	});
	$('#confirm_passwd').keyup(function(){
		if($('#doc_passwd').val()!='' && $('#doc_passwd').val()!=$(this).val() ){
			$('#message_password').text('비밀번호 불일치').css('color','red');
		}else if($('#doc_passwd').val()!='' && $('#doc_passwd').val()==$(this).val() ){
			$('#message_password').text('비밀번호 일치').css('color','#000');
		}
	});
	
	$('#doctor_changePasswd').submit(function(){
		if($('#now_passwd').val().trim()==''){
			alert('현재 비밀번호를 입력하세요.');
			$('#now_passwd').val('').focus();
			return false;
		}
		if($('#confirm_passwd').val().trim()==''){
			alert('새비밀번호 확인을 입력하세요.');
			$('#confirm_passwd').val('').focus();
			return false;
		}
		if($('#doc_passwd').val()!=$('#confirm_passwd').val()){
			$('#message_password').text('비밀번호 불일치').css('color','red');
			return false;
		}
		$.ajax({
	        type:"post",
	        url: "/doctor/changePasswd",
	        data: $('#doctor_changePasswd').serialize(),
	        success: function(response) {
	            alert('비밀번호가 성공적으로 변경되었습니다!');
	            window.location.href = "/main/main";
	        },
	        error: function() {
	            alert('네트워크 오류 발생');
	        }
  		});
	});
});