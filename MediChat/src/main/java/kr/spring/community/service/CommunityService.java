package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import kr.spring.community.vo.CommunityVO;

public interface CommunityService {
	/*-----------------------------게시판글-----------------------------*/
	//게시판
	public List<CommunityVO> selectCommunityList (Map<String, Object> map);//목록
	public Integer selectRowCount(Map<String, Object> map);//개수
	public void insertBoard(CommunityVO community);//등록
	public void selectCommunity(Long cbo_num); //상세
	public void updateCommunity(CommunityVO community);//수정
	public void deleteCommunity(Long cbo_num);//삭제

	//조회수
	public void updateHit(Long cbo_num);

	//게시판 좋아요


	/*-----------------------------댓글-----------------------------*/

	//댓글 좋아요

	/*-----------------------------답글(대댓글)-----------------------------*/
}