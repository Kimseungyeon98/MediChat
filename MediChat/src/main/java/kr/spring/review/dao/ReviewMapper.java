package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.review.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	@Insert("INSERT INTO review(rev_num,res_num,mem_num,hos_num,rev_grade,rev_title,rev_content) VALUES(review_seq.nextval,#{res_num},#{mem_num},#{hos_num},#{rev_grade},#{rev_title},#{rev_content})")
	public void insertReview(ReviewVO vo);
	@Update("UPDATE review SET rev_grade=#{rev_grade},rev_title=#{rev_title},rev_content=#{rev_content},rev_modify=sysdate WHERE rev_num=#{rev_num}")
	public void updateReview(ReviewVO vo);
	@Delete("DELETE FROM review WHERE rev_num=#{rev_num}")
	public void deleteReview(Long rev_num);
	public Integer selectCountByHos(Map<String,Object> map);
	public List<ReviewVO> selectReviewListByHos(Map<String,Object> map);
	public Integer selectCountByMem(Map<String,Object> map);
	public List<ReviewVO> selectReviewListByMem(Map<String,Object> map);
	public Integer selectCountByDoc(Map<String,Object> map);
	public List<ReviewVO> selectReviewListByDoc(Map<String,Object> map);
	@Select("SELECT * FROM review WHERE rev_num=#{rev_view}")
	public ReviewVO selectReviewDetail(Long rev_num);
	@Update("UPDATE review SET rev_hit=rev_hit+1 WHERE rev_num=#{rev_num}")
	public void clickHitReview(Long rev_num);
	//병원삭제?

	
}
