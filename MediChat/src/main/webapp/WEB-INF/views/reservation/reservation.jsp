<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>    
#calendar {
	margin: 0 auto;
	width: 80%;
	max-width: 800px;
}

.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

.time-button.selected {
	background-color: blue;
}

#time-buttons {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.time-section {
	margin-bottom: 20px;
	text-align: center;
}

.time-row {
	display: flex;
	justify-content: center;
	margin-bottom: 10px;
}

button {
	width: 90px;
	height: 45px;
	margin: 5px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:disabled {
	opacity: 1;
}

.button-row {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.reserve-btn {
	width: 100px;
}
</style>
<script src="${pageContext.request.contextPath}/js/index.global.min.js"></script>
<script>
function initializeCalendar(hos_num) {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true,
        height: 'auto',
        headerToolbar: {
            left: 'title',
            right: 'today prev,next'
        },
        initialView: 'dayGridMonth',
        locale: 'ko',
        dayCellContent: function(e) {
            var dayNumber = e.date.getDate();
            var html = '<div class="fc-daygrid-day-number">' + dayNumber + '</div>';
            return { html: html };
        },
        fixedWeekCount: false,
        dateClick: function(info){
            displayhosTimes(info.dateStr, info.date.getDay(), hos_num);
        }
    });
    calendar.render();
}

function displayhosTimes(date, day, hos_num) {
    $('#time-buttons').empty();
    const dayMapping = {
        0: { start: 'hos_time7S', end: 'hos_time7C' }, // 일요일
        1: { start: 'hos_time1S', end: 'hos_time1C' }, // 월요일
        2: { start: 'hos_time2S', end: 'hos_time2C' }, // 화요일
        3: { start: 'hos_time3S', end: 'hos_time3C' }, // 수요일
        4: { start: 'hos_time4S', end: 'hos_time4C' }, // 목요일
        5: { start: 'hos_time5S', end: 'hos_time5C' }, // 금요일
        6: { start: 'hos_time6S', end: 'hos_time6C' }  // 토요일
    };
    const fields = dayMapping[day];
    console.log(`Fields: ${JSON.stringify(fields)}`);

    $.ajax({
        url: '/reservation/hosHours',
        method: 'get',
        data: { hos_num: hos_num },
        dataType: 'json',
        success: function(param){
            console.log(param);
            if (param.result === "success") {
                const hospitalVO = param.hospitalVO;
                const startTime = convertTimeFormat(hospitalVO[fields.start]);
                const endTime = convertTimeFormat(hospitalVO[fields.end]);

                if (!startTime || !endTime) {
                    alert('해당 날짜에 대한 진료 시간이 없습니다.');
                    return;
                }
                let times = generateTimesForDay(startTime, endTime);
                let output = '<div class="time-section"><h3>오전</h3><div class="time-row">';
                times.forEach((time, index) => {
                    if (time < "12:00") {
                        if (index > 0 && index % 4 == 0) {
                            output += '</div><div class="time-row">';
                        }
                        output += '<button class="time-button" data-time="' + time + '">' + time + '</button>';
                    }
                });
                output += '</div></div>';

                output += '<div class="time-section"><h3>오후</h3><div class="time-row">';
                times.forEach((time, index) => {
                    if (time >= "12:00") {
                        if (index > 0 && index % 4 == 0) {
                            output += '</div><div class="time-row">';
                        }
                        output += '<button class="time-button" data-time="' + time + '">' + time + '</button>';
                    }
                });
                output += '</div></div>';
                $('#time-buttons').html(output);
            } else if (param.result === "logout") {
                alert("로그인이 필요합니다.");
            }
        },
        error: function(){
            alert('네트워크 오류 발생');
        }
    });
}

function convertTimeFormat(timeStr) {
    console.log(`Converting time: ${timeStr}`);
    if (!timeStr) return null;
    if (timeStr.length != 4) {
        console.error(`Invalid time string: ${timeStr}`);
        return null;
    }
    return timeStr.slice(0, 2) + ':' + timeStr.slice(2);
}

function generateTimesForDay(startTime, endTime) {
    let times = [];
    if (!startTime || !endTime) {
        return times;
    }

    let [startHour, startMinute] = startTime.split(':').map(Number);
    let [endHour, endMinute] = endTime.split(':').map(Number);

    for (let hour = startHour; hour <= endHour; hour++) {
        for (let minute = (hour == startHour ? startMinute : 0); minute < 60; minute += 30) {
            if (hour == endHour && minute >= endMinute) break;
            let time = hour.toString().padStart(2, '0') + ':' + minute.toString().padStart(2, '0');
            times.push(time);
        }
    }

    return times;
}
</script>

<div id="calendar"></div>
<div id="time-buttons"></div>