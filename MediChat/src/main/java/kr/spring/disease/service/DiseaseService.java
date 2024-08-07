package kr.spring.disease.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import kr.spring.disease.vo.DiseaInsertVO;
import kr.spring.disease.vo.DiseaseVO;
import kr.spring.disease.vo.Item;
@Service
public interface DiseaseService {
	//diseaseCode   
	public void insertDisCode(Item vo);
	public void deleteDisCode();
	public List<DiseaInsertVO> selectDisCodeList();
	public void insertDis(DiseaseVO vo);
	public void updateDis();
	public List<DiseaseVO> selectDisList(Map<String,Object> map);
	public Integer selectDisCount(Map<String,Object> map);
	public DiseaseVO getDis(String sickcd);
	public void updateDisHit(String sickcd);
	
	
	public List<DiseaseVO> selectDisListByHit(int itemNum);
	public Set<String> selectDisListBykeyword(String keyword);
}
