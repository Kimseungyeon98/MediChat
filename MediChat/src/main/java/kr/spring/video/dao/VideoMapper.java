package kr.spring.video.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.video.vo.VideoVO;

@Mapper
public interface VideoMapper {
	
	@Insert("INSERT INTO video_healthy(video_num,mem_num,video_title,video_content,v_category) VALUES(vh_seq.nextval,#{mem_num},#{video_title},#{video_content},#{v_category})")
	public void insertV(VideoVO vo);
	@Update("UPDATE video_healthy SET video_title=#{video_title}, video_content=#{video_content},v_category=#{v_category},v_modify_date=sysdate WHERE video_num=#{video_num}")
	public void updateV(VideoVO vo);
	@Delete("DELETE FROM video_healthy WHERE video_num=#{video_num}")
	public void deleteV(Long video_num);
	public Integer selectCountV(Map<String,Object> map);
	public  VideoVO selectV(Long video_num);
	public List<VideoVO> selectVList(Map<String,Object> map);
	//조회수
	@Update("UPDATE video_healthy SET video_hit=video_hit+1 WHERE video_num=#{video_num}")
	public void updateVhit(Long video_num);
}
