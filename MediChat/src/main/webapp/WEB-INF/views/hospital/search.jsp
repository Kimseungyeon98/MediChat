<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<div>
<p class="text-lightgray fw-7 fs-13">홈 > 병원 찾기 > 검색 결과</p>
	<!-- 검색 창 시작 -->
	<form id="search_form" method="get" action="/hospitals/search">
		<input type="hidden" id="lat" name="user_lat" value="${user_lat}">
		<input type="hidden" id="lon" name="user_lon" value="${user_lon}">
		<input type="hidden" id="sortType" name="sortType" value="NEAR">
		<input type="hidden" id="commonFilter" name="commonFilter" value="">

		<div class="d-flex justify-content-center align-items-center">
			<img id="search_back" src="/images/back.png" width="20" height="20">
			<input type="text" id="h-search" class="form-control" placeholder="병원 이름, 지역 + 과목, 증상" name="keyword" value="${keyword}">
			<i id="h-search-icon" class="bi bi-search"></i>
		</div>
		<!-- 검색 모드 시작 -->
		<div class="d-flex justify-content-start align-items-center m-3">
			<div id="filter-img-box">
				<img src="/images/filter.png" width="20" height="20">
			</div>
			<div class="border-end" style="height: 40px;"></div>
			<!-- SortType -->
			<div id="moreSortType" class="filter-item"><c:if test="${sortType=='NEAR'}">가까운 순</c:if>
														<c:if test="${sortType=='REVIEW'}">리뷰 순</c:if>
														<c:if test="${sortType=='SCORE'}">평점 순</c:if>
														<c:if test="${sortType=='HIT'}">조회 순</c:if>
														&nbsp;<img src="/images/down.png" width="10" height="10"></div>
			<div class="overlay" id="overlay"></div>
			<div id="more_box" class="p-5 rounded-top-3 border bg-white" style="display: none; height: 300px;">
				<h5 class="fw-8">어떤 기준으로 정렬할까요?</h5>
				<div class="sortType-item" data-sortType="NEAR">
					거리 가까운 순
				</div>
				<div class="sortType-item" data-sortType="REVIEW">
					리뷰 많은 순
				</div>
				<div class="sortType-item" data-sortType="SCORE">
					평점 높은 순
				</div>
				<div class="sortType-item" data-sortType="HIT">
					조회수 높은 순
				</div>
			</div>
			<!-- commonFilter -->
			<div class="filter-item filter-item-selected" data-commonFilter="${user_lat},${user_lon}">내 위치</div>
			<div class="filter-item" data-commonFilter="NONFACE">비대면 진료</div> <!-- NONFACE -->
			<div class="filter-item" data-commonFilter="ING">진료 중</div> <!-- ING -->
			<div class="filter-item" data-commonFilter="NIGHTTIME">야간 진료</div> <!-- NIGHTTIME -->
			<div class="filter-item" data-commonFilter="WEEKEND">주말 진료</div> <!-- WEEKEND -->
		</div>
		<!-- 검색 모드 끝 -->
	</form>
	<!-- 검색 창 끝 -->
	
	<!-- 병원 리스트 시작 -->
	<div id="hospitalListBox">
		<c:forEach items="${hosList}" var="hospital">
		
			<div class="hospital-box" data-hosNum="${hospital.hos_num}">
				<div class="hospital-name fs-17 fw-8 text-black-6">${hospital.hos_name}</div>
				<div class="hospital-around fs-11 fw-9 text-gray-7">${hospital.around}m</div>
				
				<!-- 진료시간이 있으면-->
				<div class="hospital-open fs-13 fw-7 text-black-4 d-flex align-items-center">
					<c:if test="${day==1}">
						<c:if test="${hospital.hos_time1S<=time and time<hospital.hos_time1C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time1S>time and hospital.hos_time1C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time1S!='null' or hospital.hos_time1C!='null'}">
					    	&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time1S<=time and time<hospital.hos_time1C}">
						    	${fn:substring(hospital.hos_time1C,0,2)}:${fn:substring(hospital.hos_time1C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time1S>time and hospital.hos_time1C>=time}">
					    		${fn:substring(hospital.hos_time1S,0,2)}:${fn:substring(hospital.hos_time1S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==2}">
						<c:if test="${hospital.hos_time2S<=time and time<hospital.hos_time2C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time2S>time and hospital.hos_time2C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time2S!='null' or hospital.hos_time2C!='null'}">
						    &nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time2S<=time and time<hospital.hos_time2C}">
						    	${fn:substring(hospital.hos_time2C,0,2)}:${fn:substring(hospital.hos_time2C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time2S>time and hospital.hos_time2C>=time}">
					    		${fn:substring(hospital.hos_time2S,0,2)}:${fn:substring(hospital.hos_time2S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==3}">
						<c:if test="${hospital.hos_time3S<=time and time<hospital.hos_time3C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time3S>time and hospital.hos_time3C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time3S!='null' or hospital.hos_time3C!='null'}">
	   						&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time3S<=time and time<hospital.hos_time3C}">
						    	${fn:substring(hospital.hos_time3C,0,2)}:${fn:substring(hospital.hos_time3C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time3S>time and hospital.hos_time3C>=time}">
					    		${fn:substring(hospital.hos_time3S,0,2)}:${fn:substring(hospital.hos_time3S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==4}">
						<c:if test="${hospital.hos_time4S<=time and time<hospital.hos_time4C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time4S>time and hospital.hos_time4C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time4S!='null' or hospital.hos_time4C!='null'}">
					    	&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time4S<=time and time<hospital.hos_time4C}">
						    	${fn:substring(hospital.hos_time4C,0,2)}:${fn:substring(hospital.hos_time4C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time4S>time and hospital.hos_time4C>=time}">
					    		${fn:substring(hospital.hos_time4S,0,2)}:${fn:substring(hospital.hos_time4S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==5}">
						<c:if test="${hospital.hos_time5S<=time and time<hospital.hos_time5C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time5S>time and hospital.hos_time5C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time5S!='null' or hospital.hos_time5C!='null'}">
					    	&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time5S<=time and time<hospital.hos_time5C}">
						    	${fn:substring(hospital.hos_time5C,0,2)}:${fn:substring(hospital.hos_time5C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time5S>time and hospital.hos_time5C>=time}">
					    		${fn:substring(hospital.hos_time5S,0,2)}:${fn:substring(hospital.hos_time5S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==6}">
						<c:if test="${hospital.hos_time6S<=time and time<hospital.hos_time6C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time6S>time and hospital.hos_time6C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time6S!='null' or hospital.hos_time6C!='null'}">
   							&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time6S<=time and time<hospital.hos_time6C}">
						    	${fn:substring(hospital.hos_time6C,0,2)}:${fn:substring(hospital.hos_time6C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time6S>time and hospital.hos_time6C>=time}">
					    		${fn:substring(hospital.hos_time6S,0,2)}:${fn:substring(hospital.hos_time6S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
					<c:if test="${day==7}">
						<c:if test="${hospital.hos_time7S<=time and time<hospital.hos_time7C}">
							<div class="greenCircle"></div>진료중
						</c:if>
						<c:if test="${hospital.hos_time7S>time and hospital.hos_time7C>=time}">
							<div class="redCircle"></div>진료종료
						</c:if>
					    <c:if test="${hospital.hos_time7S!='null' or hospital.hos_time7C!='null'}">
					    	&nbsp;                           
						    <div class="vr"></div>
						    &nbsp;
						    <c:if test="${hospital.hos_time7S<=time and time<hospital.hos_time7C}">
						    	${fn:substring(hospital.hos_time7C,0,2)}:${fn:substring(hospital.hos_time7C,2,4)} 마감
					    	</c:if>
					    	<c:if test="${hospital.hos_time7S>time and hospital.hos_time7C>=time}">
					    		${fn:substring(hospital.hos_time7S,0,2)}:${fn:substring(hospital.hos_time7S,2,4)} 오픈
					    	</c:if>
				    	</c:if>
					</c:if>
			    </div>
				
				<div class="hospital-address fs-12 fw-7 text-black-3">${hospital.hos_addr}</div>
				<div class="hospital-docCnt fs-11 fw-8 text-black-3">전문의 ${hospital.doc_cnt}명</div>
			</div>
			<hr width="100%">
		</c:forEach>
		<div id="loadingImg" style="display:none;"><img src="/images/loading.gif"></div>
	</div>
	<!-- 병원 리스트 끝 -->
</div>

<script>
const searchBack = document.getElementById('search_back');
searchBack.onclick = function(){
	location.href='/hospitals';
};

const hSearchIcon = document.getElementById('h-search-icon');
const searchForm = document.getElementById('search_form');
hSearchIcon.onclick = function(){
	searchForm.submit();
};

const filterItem = document.getElementsByClassName('filter-item');
const commonFilter = document.getElementById('commonFilter');
for(let i=1; i < filterItem.length; i++){
	filterItem[i].onclick = function(){
		// 클래스가 있는지 확인
        if (this.classList.contains('filter-item-selected')) {
            // 클래스가 있으면 제거
            this.classList.remove('filter-item-selected');
        } else {
            // 클래스가 없으면 추가
            this.classList.add('filter-item-selected');
        }
		
        var commonFilterNames = '';
        var filterItemSelected = document.getElementsByClassName('filter-item-selected');
		for(let j=1; j < filterItemSelected.length; j++){
			commonFilterNames += filterItemSelected[j].getAttribute('data-commonFilter')+',';
		}
		commonFilter.value = commonFilterNames;
		searchForm.submit();
	};
}

if(typeof '${commonFilter}' !== 'undefined' && '${commonFilter}' !== null && '${commonFilter}' !== ''){
	const commonFilterArray = '${commonFilter}'.split(',');
	for(let i=1; i<filterItem.length; i++){
		for(let j=0; j<commonFilterArray.length; j++){
			if(filterItem[i].getAttribute('data-commonFilter') == commonFilterArray[j]){
				filterItem[i].classList.add('filter-item-selected');
			}
		}
	}
}


//위치 정보 가져오기
if(${empty user_lat} || ${empty user_lon} || '${user_lat}'=='37.4981646510326' || '${user_lon}'=='127.028307900881'){
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(
			function(position) {
				const lat = position.coords.latitude;
			    const lon = position.coords.longitude;
			    document.getElementById('lat').value = lat;
			    document.getElementById('lon').value = lon;
			    searchForm.submit();
			}
		);
	}
}

document.getElementById('moreSortType').addEventListener('click', function() {
    document.getElementById('more_box').style.display = 'block';
    document.getElementById('overlay').style.display = 'block';
});

document.getElementById('overlay').addEventListener('click', function() {
    document.getElementById('more_box').style.display = 'none';
    document.getElementById('overlay').style.display = 'none';
});
const sortTypeItem = document.getElementsByClassName('sortType-item');
const sortType = document.getElementById('sortType');
for(let i=0; i<sortTypeItem.length; i++){
	sortTypeItem[i].onclick = function(){
		sortType.value = sortTypeItem[i].getAttribute('data-sortType');
		searchForm.submit();
	};
}
$(document).ready(function() {
    const hospitalListBox = $('#hospitalListBox');
    let pageNum = 2;
    const pageItemNum = 15;
    const maxItems = 120;
    const keyword = '${keyword}';
    const sortType = '${sortType}';
    const commonFilter = '${commonFilter}';
    const user_lat = '${user_lat}';
    const user_lon = '${user_lon}';
    
    let totalItemsLoaded = 0;
    let loading = false;
    
    function loadHospitals() {
        if (totalItemsLoaded >= maxItems || loading) {
            return;
        }
        loading = true;
        $.ajax({
            url: '/hospitals/search-json',
            type: 'GET',
            dataType:'json',
            data: {
            	pageNum: pageNum,
            	pageItemNum: pageItemNum,
            	keyword: keyword,
            	sortType: sortType,
            	commonFilter: commonFilter,
            	user_lat: user_lat,
            	user_lon: user_lon
            },
            success: function(param) {
                if(param.length==0){
                	return;
                }
            	pageNum++;
                let output = '';
                
                for(let i=0; i<param.length; i++){
                	output += '<div class="hospital-box" data-hosNum="'+param[i].hos_num+'">';
                	output += '<div class="hospital-name fs-17 fw-8 text-black-6">'+param[i].hos_name+'</div>';
                	output += '<div class="hospital-sub fs-11 fw-9 text-gray-7">'+param[i].around+'m</div>';
                	output += '<div class="hospital-open fs-13 fw-7 text-black-4 d-flex align-items-center">';
                	if(param[i].hos_time${day}S<=${time} && ${time}<param[i].hos_time${day}C){
                		output += '<div class="greenCircle"></div>'+'진료중';
                	} else {
                		output += '<div class="redCircle"></div>'+'진료종료';
                	}
                	if(param[i].hos_time${day}S!='null' || param[i].hos_time${day}C!='null'){
                    	output += '&nbsp;'
                       	output += '<div class="vr"></div>';
                       	output += '&nbsp;'
                		if(param[i].hos_time${day}S<=${time} && ${time}<param[i].hos_time${day}C){
                    		output += param[i].hos_time${day}C.substr(0,2)+':'+param[i].hos_time${day}C.substr(2,4)+' 마감';
                    	} else {
                    		output += param[i].hos_time${day}S.substr(0,2)+':'+param[i].hos_time${day}S.substr(2,4)+' 오픈';
                    	}
                	}
                	output += '</div>';
                	output += '<div class="hospital-address fs-12 fw-7 text-black-3">'+param[i].hos_addr+'</div>';
                	output += '<div class="hospital-docCnt fs-11 fw-8 text-black-3">'+'전문의'+param[i].doc_cnt+'명'+'</div>';
                	output += '</div>'
                	output += '<hr width="100%">';
                }
                hospitalListBox.append(output);
                totalItemsLoaded += param.length;
                loading = false;
            },
            error: function(){
            	loading = false;
            }
        });
    }
    function onScroll() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 10) {
            $('#loadingImg').show();
        	loadHospitals();
        }
        $('#loadingImg').hide();
    }

    $(window).on('scroll', onScroll);
    
    const hosBox = document.getElementsByClassName('hospital-box');
    for(let i=0; i<hosBox.length; i++){
    	hosBox[i].onclick = function(){
    		let hosNum = hosBox[i].getAttribute('data-hosNum');
    		location.href = '/hospitals/search/detail/'+hosNum;
    	}
    }
});
</script>