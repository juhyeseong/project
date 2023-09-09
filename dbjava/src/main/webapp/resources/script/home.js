'use strict';

//찜 handler
async function wishHandler(event) {
	let target = event.target
	while(target.classList.contains('wish') == false) {
		target = target.parentNode
	}
	const wishCount = target.parentNode.parentNode.children[2]
	const rentIdx = target.parentNode.parentNode.children[3]
	const opt = {
			method: 'POST',
			headers:  {
				'CONTENT-TYPE' : 'application/json; charset=utf-8'
			},
			body: JSON.stringify({
				rent: rentIdx.value,
				member: loginIdx
			})
	}
	
	if(wishCount.value == 0 && loginIdx != '') {
		const url = cpath + '/wishList/createWishList'
		
		const response = await fetch(url, opt)
    	
		if(response != 0) {
			location.reload()
		}
	}
	if(wishCount.value != 0 && loginIdx != '') {
		const url = cpath + '/wishList/deleteWishList'
		
		
		const response = await fetch(url, opt)
    	
		if(response != 0) {
			location.reload()
		}
	}
}

//필터를 적용하는 함수
function applyFilter() {
    var roomElements = document.querySelectorAll('.room') // 모든 room클래스를 가져와서 roomElements 에 저장
    var selectedAmenities = getSelectedAmenities()    // 편의시설 요소들을 가져와서 selectedAmenities 에 저장
    var priceSort = getSelectedPriceSort()
    var selectedLocations = getSelectedLocations()
    
    roomElements.forEach(function(room) {
        var amenitiesElement = room.querySelector('.roomInfo')
        var amenities = amenitiesElement.textContent    // .roomInfo 에 있는 텍스트 콘텐트를 amenities 에 저장
        
        // 선택된 편의시설이 있는지 확인
        var hasSelectedAmenities = selectedAmenities.some(function (amenity) {   // some  함수를 이용하여 모든 선택된 편의시설이 해당 시설에 있는 지 확인
        	return amenities.indexOf(amenity) !== -1   // 조건이 맞으면 true, 아니면 false
        })
        
        var locationElement = room.querySelector('.roomLocation')
	    var location = locationElement.textContent
	    
	    // 주소에서 "서울특별시"와 같은 앞부분만 추출
	    var addressPrefix = location.split(' ')[0]; // 공백으로 분리하여 첫 번째 부분 가져옴
        // 선택된 주소 중 하나라도 일치하면 보이기, 그렇지 않으면 숨김
	    var isLocationMatch = selectedLocations.includes(addressPrefix);
	    
	    if(selectedAmenities.length == 0 && selectedLocations.length == 0) {
	    	room.style.display = 'block'
	    }
	    else if(hasSelectedAmenities || isLocationMatch) {
            room.style.display = 'block' // 조건에 맞으면 보임
        }
        else {
            room.style.display = 'none' // 조건에 안 맞으면 숨김
        }
    });

    // 가격 정렬
    if (priceSort === 'low') {
        // 최저가 순으로 정렬
        var sortedRooms = Array.from(roomElements).sort(function (a, b) {
            var priceA = parseInt(a.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
            var priceB = parseInt(b.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
            return priceA - priceB
        });
    } else if (priceSort === 'high') {
        // 최고가 순으로 정렬
        var sortedRooms = Array.from(roomElements).sort(function (a, b) {
            var priceA = parseInt(a.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
            var priceB = parseInt(b.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
            return priceB - priceA
        });
    }

    // 정렬된 방을 다시 추가
    var roomContainer = document.querySelector('.roomBox');
    roomContainer.innerHTML = ''
    sortedRooms.forEach(function (room) {
        roomContainer.appendChild(room)
    });

    // 모달을 닫음
    modal.style.display = "none"
} 

//가격 정렬 방식을 가져오는 함수
function getSelectedPriceSort() {
    var lowPriceRadio = document.getElementById('lowPriceRadio');
    if (lowPriceRadio.checked) {
        return 'low'
    }

    var highPriceRadio = document.getElementById('highPriceRadio');
    if (highPriceRadio.checked) {
        return 'high'
    }

    // 기본값: 최저가 정렬
    return 'low'
}

//선택된 편의시설을 가져오는 함수
// <input type="checkbox" name="information" value="무선 인터넷" class="infoCheckbox">
function getSelectedAmenities(){
	var amenities = document.getElementsByName("information")
	var selectedAmenities = []
	
	for(var i = 0; i < amenities.length; i++){
		if(amenities[i].checked){
			selectedAmenities.push(amenities[i].value)
		}
	}
	return selectedAmenities
}

//선택한 위치 가져오기 함수
function getSelectedLocations() {
	var locations = []
	var locationCheckboxes = document.querySelectorAll('input[name="address"]:checked')
	
	locationCheckboxes.forEach(function (checkbox) {
	  	locations.push(checkbox.value)
	})
	
	return locations
}