package kr.spring.disease.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.disease.vo.DiseaInsertVO;

import kr.spring.disease.vo.DiseaseVO;
import kr.spring.disease.vo.Item;

@Mapper
public interface DiseaseMapper {
	
	
	//diseaseCode 
	@Insert("INSERT INTO disease_code(sickcd,sicknm) VALUES(#{sickcd},#{sicknm})")
	public void insertDisCode(Item vo);
	@Delete("DELETE FROM disease_code")
	public void deleteDisCode();
	@Select("select distinct d.sickcd,d.sicknm,dis_department from disease_code d LEFT OUTER JOIN diseasemediclist m ON d.sickcd=m.main_sick LEFT OUTER JOIN (select sickcd, listagg(dis_department,',') within group (order by dis_department) dis_department  from disease_code d LEFT OUTER JOIN (select distinct * FROM diseasemediclist) m ON d.sickcd=m.main_sick JOIN medical_subject s ON m.dsbjt_cd=s.dsbjt_cd  group by sickcd) s ON d.sickcd=s.sickcd")
	public List<DiseaInsertVO> selectDisCodeList();
	
	@Insert("INSERT INTO disease(sickcd,dis_name,dis_symptoms,dis_department) VALUES(#{sickcd},#{dis_name},#{dis_symptoms},#{dis_department})")
	public void insertDis(DiseaseVO vo);
	public void updateDis(DiseaseVO vo);
	public List<DiseaseVO> selectDisList(Map<String,Object> map);
	public Integer selectDisRowCount(Map<String,Object> map);
	@Select("SELECT * FROM disease WHERE sickcd = #{sickcd}")
	public DiseaseVO getDis(String sickcd);
	
	@Update("UPDATE disease SET dis_hit= dis_hit+1 WHERE sickcd Like #{sickcd}")
	public void updateDisHit(String sickcd);
	
	
	public List<DiseaseVO> selectDisListByHit(int itemNum);
	
	@Select("select a.dis_department from ( select dis_department,count(dis_department) as cnt from disease where dis_department != '병의원과 상담' and (dis_name like '%${keyword}%' or dis_symptoms like '%${keyword}%') and dis_department not like '%,%' group by dis_department order by cnt desc)a where rownum<=2")
	public List<String> selectDisListBykeyword(String keyword);
}
