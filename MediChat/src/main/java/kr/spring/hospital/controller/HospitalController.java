package kr.spring.hospital.controller;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.disease.service.DiseaseService;
import kr.spring.disease.vo.DiseaseVO;
import kr.spring.hospital.service.HospitalService;
import kr.spring.hospital.vo.HospitalVO;
import kr.spring.review.service.ReviewService;
import kr.spring.review.vo.ReviewVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HospitalController {
	
	@Value("${API.KSY.KAKAO-API-KEY}")
	private String apiKey;
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private DiseaseService diseaseService;
	
	
	// 병원
	@GetMapping("/hospitals")
	public Model hospital(Model model,HttpSession session,@RequestParam(defaultValue="37.4981646510326") String user_lat, @RequestParam(defaultValue="127.028307900881") String user_lon) {
		
		session.setAttribute("user_lat", user_lat);
		session.setAttribute("user_lon", user_lon);
		
		//카카오맵 api 키
		model.addAttribute("apiKey", apiKey);
		
		// 병원 (진료 과목) 리스트 생성 후 값 넣기
		List<List<String>> subList = new ArrayList<>();
		subList.add(new ArrayList<>(Arrays.asList("가정의학과", "건강증진, 예방, 만성질환 등", "home")));
		subList.add(new ArrayList<>(Arrays.asList("내과","감기, 소화기, 호흡기 등", "physician")));
		subList.add(new ArrayList<>(Arrays.asList("마취통증학과","급성통증, 만성통증 등", "syringe")));
		subList.add(new ArrayList<>(Arrays.asList("비뇨기과","소변 시 통증, 남성 질환 등", "urology")));
		subList.add(new ArrayList<>(Arrays.asList("산부인과","피임상담, 여성질환 등", "gynecology")));
		subList.add(new ArrayList<>(Arrays.asList("성형외과","피부질환, 화상, 상처 등", "beauty")));
		subList.add(new ArrayList<>(Arrays.asList("소아과","소아소화기, 소아호흡기, 알레르기 등", "child")));
		subList.add(new ArrayList<>(Arrays.asList("신경과","두통, 어지럼증, 뇌졸중 등", "brain")));
		subList.add(new ArrayList<>(Arrays.asList("신경외과","요통, 디스크, 신경계 질환 등", "headache")));
		subList.add(new ArrayList<>(Arrays.asList("안과","눈 피로, 결막염, 다래끼 등", "eye")));
		subList.add(new ArrayList<>(Arrays.asList("영상의학과","방사선 촬영, MRI, CT", "x-rays")));
		subList.add(new ArrayList<>(Arrays.asList("외과","갑상선, 유방, 하지정맥 등", "bone")));
		subList.add(new ArrayList<>(Arrays.asList("응급의학과","심한 탈수, 급성처치 등", "ambulance")));
		subList.add(new ArrayList<>(Arrays.asList("이비인후과","비염, 이명, 편도염 등", "ear")));
		subList.add(new ArrayList<>(Arrays.asList("재활의학과","신체회복, 물리치료, 만성통증 등", "medical")));
		subList.add(new ArrayList<>(Arrays.asList("정신건강의학과","수면장애, 스트레스, 중독 등", "mental")));
		subList.add(new ArrayList<>(Arrays.asList("정형외과","관절염, 골절, 척추 측만증 등", "surgical")));
		subList.add(new ArrayList<>(Arrays.asList("치과","치아질환, 잇몸질환, 턱 관절 등", "tooth")));
		subList.add(new ArrayList<>(Arrays.asList("피부과","두드러기, 가려움증, 탈모 등", "skin")));
		subList.add(new ArrayList<>(Arrays.asList("한의원","한방 진료, 다이어트, 경옥고 등", "treatment")));
		
		
		model.addAttribute("subList",subList);

		// 병원 (어떻게 아프신가요) 리스트 생성 후 값 넣기 (미완성)
		List<DiseaseVO> dList = diseaseService.selectDisListByHit(10);
		List<String> dNameList = new ArrayList<>();
		for(DiseaseVO d : dList) {
			dNameList.add(d.getDis_name());
		}
		
		//어떻게 아프신가요?
		List<String> howSick = new ArrayList<>(Arrays.asList("독감","탈모","비염","대상포진","다이어트","아토피"));
		model.addAttribute("howSick", howSick);

		// 병원 (인기 검색어) 리스트 생성 후 값 넣기 (미완성)
		List<String> hotKeyWord = null;
		if(dNameList.size()>=10) {
			hotKeyWord = dNameList;
		} else {
			hotKeyWord = new ArrayList<>(Arrays.asList("여드름","지루성 피부염","감기","두드러기","역류성 식도염","보톡스","발열","백옥주사","당뇨"));
		}
		
		model.addAttribute("hotKeyWord", hotKeyWord);
		
		// 지도에 병원 마커용
		Map<String,Object> map = new HashMap<>();
		map.put("pageNum", 1);
		map.put("pageItemNum", 20);
		map.put("keyword","");
		map.put("sortType", "NEAR");
		map.put("around", 1000);
		map.put("user_lat", user_lat);
		map.put("user_lon", user_lon);

		model.addAttribute("user_lat", user_lat);
		model.addAttribute("user_lon", user_lon);
		
		List<HospitalVO> hosList = hospitalService.selectListHospital(map);
		model.addAttribute("hosList", hosList);
		
		return model;
	}

	// 병원 > 검색 결과
	@GetMapping("/hospitals/search")
	public String search(Model model,HttpSession session,@RequestParam(defaultValue="1") int pageNum,
							@RequestParam(defaultValue="15") int pageItemNum, @RequestParam(defaultValue="") String keyword,
							@RequestParam(required = false) String commonFilter, @RequestParam(defaultValue="NEAR") String sortType,
							@RequestParam(defaultValue="37.4981646510326") String user_lat, @RequestParam(defaultValue="127.028307900881") String user_lon) {
		
		session.setAttribute("user_lat", user_lat);
		session.setAttribute("user_lon", user_lon);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_lat", user_lat);
		map.put("user_lon", user_lon);
		model.addAttribute("user_lat", user_lat);
		model.addAttribute("user_lon", user_lon);
		/* 나중에 위치정보 bean 만들어서 가져다 쓰기 지금은 귀찮... */
		log.debug("<<위치>> : " + user_lat + "," + user_lon);
		
		// 현재 시간 변수 생성 후 값 넣기
		LocalDateTime now = LocalDateTime.now();
		String time = now.format(DateTimeFormatter.ofPattern("HHmm")); //hh:mm
		int day = now.getDayOfWeek().getValue(); //1:월 2:화 3:수 4:목 5:금 6:토 7:일
		map.put("time", time);
		map.put("day", day);
		model.addAttribute("time", time);
		model.addAttribute("day", day);
		log.debug("<<시간>> = " + "day: " + day + ", time: " +time);
		
		// pageNum
		map.put("pageNum", pageNum);
		model.addAttribute("pageNum", pageNum);
		
		// pageItemNum
		map.put("pageItemNum", pageItemNum);
		model.addAttribute("pageItemNum", pageItemNum);

		// keyword
		map.put("keyword", keyword);
		model.addAttribute("keyword", keyword);
		
		// commonFilter
		map.put("commonFilter", commonFilter);
		model.addAttribute("commonFilter", commonFilter);
		
		//sortType
		map.put("sortType", sortType);
		model.addAttribute("sortType", sortType);
		
		Set<String> kSet = null;
		String sub_sql = "";
		if(keyword!=null) {
			if(!keyword.equals("가정의학과")&&
					!keyword.equals("내과")&&
					!keyword.equals("마취통증")&&
					!keyword.equals("비뇨기과")&&
					!keyword.equals("산부인과")&&
					!keyword.equals("성형외과")&&
					!keyword.equals("소아과")&&
					!keyword.equals("신경과")&&
					!keyword.equals("신경외과")&&
					!keyword.equals("안과")&&
					!keyword.equals("영상의학과")&&
					!keyword.equals("외과")&&
					!keyword.equals("응급의학과")&&
					!keyword.equals("이비인후과")&&
					!keyword.equals("재활의학과")&&
					!keyword.equals("정신건강의학과")&&
					!keyword.equals("정형외과")&&
					!keyword.equals("치과")&&
					!keyword.equals("피부과")&&
					!keyword.equals("한의원")) {
				kSet = diseaseService.selectDisListBykeyword(keyword);
				if(kSet!=null) {
					for(String key: kSet) {
						sub_sql += "OR hos_name LIKE '%' || '" + key + "' || '%' ";
					}
				}
				map.put("sub_sql", sub_sql);
			}
		}
		// 병원 리스트 담기
		List<HospitalVO> hosList = new ArrayList<>();
		hosList = hospitalService.selectListHospital(map);
		model.addAttribute("hosList", hosList);
		
		return "search";
	}
	@GetMapping("/hospitals/search-json")
	@ResponseBody
	public List<HospitalVO> searchJson(Model model,HttpSession session,@RequestParam(defaultValue="1") int pageNum,
							@RequestParam(defaultValue="15") int pageItemNum, @RequestParam(defaultValue="") String keyword,
							@RequestParam(required = false) String commonFilter, @RequestParam(defaultValue="NEAR") String sortType,
							@RequestParam(defaultValue="37.4981646510326") String user_lat, @RequestParam(defaultValue="127.028307900881") String user_lon){
		
		Map<String, Object> map = new HashMap<>();

		map.put("user_lat", user_lat);
		map.put("user_lon", user_lon);
		model.addAttribute("user_lat", user_lat);
		model.addAttribute("user_lon", user_lon);
		log.debug("<<위치>> : " + user_lat + "," + user_lon);
		
		// 현재 시간 변수 생성 후 값 넣기
		LocalDateTime now = LocalDateTime.now();
		String time = now.format(DateTimeFormatter.ofPattern("HHmm")); //hh:mm
		int day = now.getDayOfWeek().getValue(); //1:월 2:화 3:수 4:목 5:금 6:토 7:일
		map.put("time", time);
		map.put("day", day);
		model.addAttribute("time", time);
		model.addAttribute("day", day);
		log.debug("<<시간>> = " + "day: " + day + ", time: " +time);
		
		// pageNum
		map.put("pageNum", pageNum);
		model.addAttribute("pageNum", pageNum);
		
		// pageItemNum
		map.put("pageItemNum", pageItemNum);
		model.addAttribute("pageItemNum", pageItemNum);

		// keyword
		map.put("keyword", keyword);
		model.addAttribute("keyword", keyword);
		
		// commonFilter
		map.put("commonFilter", commonFilter);
		model.addAttribute("commonFilter", commonFilter);
		
		//sortType
		map.put("sortType", sortType);
		model.addAttribute("sortType", sortType);
		
		
		// 병원 리스트 담기
		List<HospitalVO> hosList = new ArrayList<>();
		hosList = hospitalService.selectListHospital(map);
		model.addAttribute("hosList", hosList);
		
		return hosList;
	}
	
	// 병원 > 검색 결과 > 상세 페이지
	@GetMapping("/hospitals/search/detail/{hos_num}")
	public String detail(@RequestParam(defaultValue="1") int pageNum,Model model, @PathVariable Long hos_num) {
		model.addAttribute("apiKey", apiKey);
		
		HospitalVO hospital = hospitalService.selectHospital(hos_num);
		model.addAttribute("hospital",hospital);
		
		// 현재 시간 변수 생성 후 값 넣기
		LocalDateTime now = LocalDateTime.now();
		String time = now.format(DateTimeFormatter.ofPattern("HHmm")); //hh:mm
		int day = now.getDayOfWeek().getValue(); //1:월 2:화 3:수 4:목 5:금 6:토 7:일
		model.addAttribute("time", time);
		model.addAttribute("day", day);
		log.debug("<<시간>> = " + "day: " + day + ", time: " +time);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("hos_num", hos_num);
		int reviewCount = service.selectCountByHos(map);
		PagingUtil page = new PagingUtil(pageNum,reviewCount, 3, 3,"/hospitals/search/detail/{hos_num}");
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		List<ReviewVO> list = service.selectReviewListByHos(map);
		model.addAttribute("reviewList",list);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewPage", page.getPage());
		return "detail";
	}
}