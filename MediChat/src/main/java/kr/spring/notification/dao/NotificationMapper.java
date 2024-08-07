package kr.spring.notification.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.notification.vo.NotificationVO;

@Mapper
public interface NotificationMapper {
	
	//알림 보내기
	public void insertNotification(NotificationVO notificationVO);
	//알림 읽음 처리
	public void readNotification(Long noti_num);
	//알림 보기
	public NotificationVO selectNotification(Long noti_num);
	//알림 갯수
	public int selectCountNotification(Long mem_num);
	//알림 목록
	public List<NotificationVO> selectListNotification(Long mem_num);
	
	//알림 삭제
	public void deleteNotification(Long noti_num);
}
