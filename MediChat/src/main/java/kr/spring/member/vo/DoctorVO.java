package kr.spring.member.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = {"mem_photo","doc_license"})
public class DoctorVO {
	private long mem_num;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String mem_id;
	@NotBlank
	private String mem_name;
	@NotEmpty
	private byte[] mem_photo;		//프로필 사진
	private String mem_photoname;	//프로필 사진명
	private int mem_auth;			//권한 등급(0:탈퇴,1:정지,2:일반,3:의사,9:관리자)
	private long doc_num;
	private long hos_num;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String doc_passwd;
	@Email
	@NotBlank
	private String doc_email;
	private Date dec_reg;
	@NotEmpty
	private String doc_license;
	private String doc_history;
	private int doc_treat;
	
	//비밀번호 변경시 현재 비밀번호를 저장하는 용도로 사용
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String now_passwd;
	
	//비밀번호 변경시에만 조건체크
	@Pattern(regexp="^[A-Za-z0-9]+$")
	private String captcha_chars;
	
	//비밀번호 일치 여부 체크
	public boolean checkPasswd(String userPasswd) {
		if(mem_auth > 1 && doc_passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	//이미지 BLOB 처리
	public void setUpload(MultipartFile upload)throws IOException {
		//MultipartFile > byte[]
		setMem_photo(upload.getBytes());
		//파일 이름
		setMem_photoname(upload.getOriginalFilename());
	}
}