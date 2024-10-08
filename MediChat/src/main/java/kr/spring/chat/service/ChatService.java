package kr.spring.chat.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.chat.vo.ChatFileVO;
import kr.spring.chat.vo.ChatMsgVO;
import kr.spring.chat.vo.ChatPaymentVO;
import kr.spring.chat.vo.ChatVO;
import kr.spring.reservation.vo.ReservationVO;

public interface ChatService {
		public List<ChatVO> selectChatListForMem(long mem_num);
		public List<ChatVO> selectChatListForDoc(long mem_num);
		public void createChat(ChatVO chatVO);
		public long selectMem_num(long res_num);
		public long selectResType(long res_num);
		public ReservationVO selectReservationByChatNum(long chat_num);
		public ChatVO selectChat(long chat_num);
		public List<ChatMsgVO> selectMsg(long chat_num);
		public void insertMsg(ChatMsgVO chatMsgVO);
		public void insertImage(ChatMsgVO chatMsgVO);
		public void insertChatFile(ChatFileVO chatFileVO);
		public ChatFileVO selectFile(long file_num);
		public long selectFileNum(long chat_num, String file_name);
		public void deleteFile(long file_num);
		public void insertChatPayment(ChatPaymentVO chatPaymentVO);
		public List<ChatFileVO> selectFiles(long mem_num);
		public void updateChatStatus(long chat_num);
}
