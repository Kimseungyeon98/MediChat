package kr.spring.doctor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.doctor.vo.DoctorVO;
import kr.spring.hospital.vo.HospitalVO;


@Mapper
public interface DoctorMapper {
	//==========의사 회원============
	@Select("SELECT member_seq.nextval FROM dual")
	public Long selectMem_num();
	//회원가입
	@Insert("INSERT INTO member(mem_num,mem_id,mem_name,mem_auth) VALUES(#{mem_num},#{mem_id},#{mem_name},3)")
	public void insertDoctor(DoctorVO doctor);
	public void insertDoctor_detail(DoctorVO doctor);
	//병원 리스트
	public List<HospitalVO> getHosList(Map<String,Object> map);
	public Integer selectRowCount(Map<String,Object> map);
	public List<HospitalVO> getHosListByKeyword(String keyword);
	//회원상세정보
	@Select("SELECT * FROM member m JOIN doctor_detail d ON m.mem_num=d.doc_num WHERE mem_num=#{mem_num}")
	public DoctorVO selectDoctor(Long mem_num);
	//회원 목록
	@Select("SELECT * FROM member m JOIN doctor_detail d ON m.mem_num=d.doc_num WHERE doc_agree=0")
	public List<DoctorVO> docList(Map<String, Object> map);
	@Select("SELECT * FROM member m JOIN doctor_detail d ON m.mem_num=d.doc_num WHERE hos_num=#{hos_num}")
	public List<DoctorVO> docListByHosNum(long hos_num);
	//회원정보 수정
	@Update("UPDATE member SET mem_name=#{mem_name} WHERE mem_num=#{mem_num}")
	public void updateDoctor(DoctorVO doctor);
	public void updateDoctor_detail(DoctorVO doctor);
	//비밀번호 수정
	@Update("UPDATE doctor_detail SET doc_passwd=#{doc_passwd} WHERE doc_num=#{mem_num}")
	public void updateDocPasswd(DoctorVO doctor);
	//프로필 사진 저장
	@Update("UPDATE member SET mem_photo=#{mem_photo},mem_photoname=#{mem_photoname} WHERE mem_num=#{mem_num}")
	public void uploadDocProfile(DoctorVO doctor);
	//회원탈퇴
	@Update("UPDATE member SET mem_auth=0 WHERE mem_num=#{mem_num}")
	public void deleteDoctor(Long doc_num);
	@Delete("DELETE FROM doctor_detail WHERE doc_num=#{mem_num}")
	public void deleteDoctor_detail(DoctorVO doctor);
	
	//아이디 중복확인
	public DoctorVO checkId(String mem_id);
	//이메일 확인
	@Select("SELECT * FROM member m JOIN doctor_detail d ON m.mem_num=d.doc_num WHERE doc_email=#{doc_email} AND mem_name=#{mem_name}")
	public DoctorVO checkEmailAndName(String doc_email,String mem_name);
	//아이디 찾기
	@Select("SELECT m.mem_id FROM member m JOIN doctor_detail d ON m.mem_num=d.doc_num WHERE mem_name=#{mem_name} AND doc_email=#{doc_email}")
	public DoctorVO findId(DoctorVO doctor);
	//비밀번호 찾기
	@Update("UPDATE doctor_detail SET doc_passwd=#{doc_passwd} WHERE doc_num=#{mem_num}")
	public void findPasswd(DoctorVO doctor);
	
	//비대면 신청
	@Update("UPDATE doctor_detail SET doc_treat=1, doc_stime=#{doc_stime}, doc_etime=#{doc_etime}, doc_off=#{doc_off} WHERE doc_num=#{mem_num}")
	public void updateDoctorTreat(DoctorVO doctor);
	
	
	//==========관리자============
	//의사회원가입신청 관리자 승인
	@Update("UPDATE doctor_detail SET doc_agree=1 WHERE doc_num=#{doc_num}")
	public void updateAgree(DoctorVO doctor);
}
