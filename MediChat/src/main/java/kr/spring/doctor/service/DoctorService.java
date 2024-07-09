package kr.spring.doctor.service;

import java.util.List;
import java.util.Map;

import kr.spring.doctor.vo.DoctorVO;
import kr.spring.hospital.vo.HospitalVO;


public interface DoctorService {
	//==========의사 회원============
	//회원가입
	public void insertDoctor(DoctorVO doctor);
	//병원 목록
	public List<HospitalVO> getHosList(Map<String,Object> map);
	public Integer selectRowCount(Map<String,Object> map);
	public List<HospitalVO> getHosListByKeyword(String keyword);
	//회원상세정보
	public DoctorVO selectDoctor(Long doc_num);
	//회원정보 수정
	public void updateDoctor(DoctorVO doctor);
	//비밀번호 수정
	public void updateDocPasswd(DoctorVO doctor);
	//프로필 사진 수정
	public void uploadDocProfile(DoctorVO doctor);
	//회원탈퇴
	public void deleteDoctor(Long doc_num);

	//아이디 중복확인
	public DoctorVO checkId(String mem_id);
	//아이디 찾기
	public void findId(DoctorVO doctor);
	//비밀번호 찾기
	public void findPasswd(DoctorVO doctor);
}