'use strict';

function beforeUnloadHandler(event) {
    event.returnValue = "변경사항이 저장되지 않을 수 있습니다"
 }

// host handler
function hostHandler() {
   start.classList.add('hidden')
   category.classList.remove('hidden')
   hostBtn.classList.add('hidden')
   categoryBtn.classList.remove('hidden') 
}

//category handler
function preCategoryHandler() {
   category.classList.add('hidden')
   start.classList.remove('hidden')
   categoryBtn.classList.add('hidden')
   hostBtn.classList.remove('hidden')
}

function categoryItemHandler(event) {
    let target = event.target
    while(target.classList.contains('categoryItem') == false) {
       target = target.parentNode
    }
    const categorySelected = document.querySelector('.categorySelected')
    
    if(categorySelected == null) {
       target.classList.add('categorySelected')
    }
    else if(categorySelected == target) {
       categorySelected.classList.remove('categorySelected')
    }
    else {
       categorySelected.classList.remove('categorySelected')
       if(target != null) {
          target.classList.add('categorySelected')
       }
    }
}
 
function categoryHandler() {
    const categorySelected = document.querySelector('.categorySelected')
    
    if(categorySelected == null) {
       alert('숙소의 종류를 선택해주세요 ~ ')
       return
    }
    
    if(formData.get("category") != null) {
       formData.delete("category")
    }
    formData.append("category", categorySelected.children[1].innerText)
    
    category.classList.add('hidden')
    roomType.classList.remove('hidden')
    categoryBtn.classList.add('hidden')
    roomTypeBtn.classList.remove('hidden')
}

//roomType handler
function preRoomTypeHandler() {
	roomType.classList.add('hidden')
	category.classList.remove('hidden')
	roomTypeBtn.classList.add('hidden')
	categoryBtn.classList.remove('hidden')
}

function roomTypeItemHandler(event) {
	let target = event.target
	while(target.classList.contains('roomTypeItem') == false) {
		target = target.parentNode
	}
	const roomTypeSelected = document.querySelector('.roomTypeSelected')
	   
	if(roomTypeSelected == null) {
		target.classList.add('roomTypeSelected')
	}
	else if(roomTypeSelected == target) {
		roomTypeSelected.classList.remove('roomTypeSelected')
	}
	else {
		roomTypeSelected.classList.remove('roomTypeSelected')
		if(target != null) {
			target.classList.add('roomTypeSelected')
		}
	}
}

function roomTypeHandler() {
	const roomTypeSelected = document.querySelector('.roomTypeSelected')
	   
	if(roomTypeSelected == null) {
		alert('숙소 유형을 선택해주세요 ~ ')
	
		return
	}

	if(formData.get("roomType") != null) {
		formData.delete("roomType")
	}
	formData.append("roomType", roomTypeSelected.children[0].children[0].innerText)
	   
	roomType.classList.add('hidden')
	rentCount.classList.remove('hidden')
	roomTypeBtn.classList.add('hidden')
	rentCountBtn.classList.remove('hidden')
	   
	const roomCount = document.querySelector('.roomCount')
	const bathCount = document.querySelector('.bathCount')
	   
	if(roomTypeSelected.children[0].children[0].innerText == '원룸') {
		roomCount.classList.add('hidden')
		bathCount.classList.add('hidden')
	}
	else {
		roomCount.classList.remove('hidden')
		bathCount.classList.remove('hidden')
	}
}

//rentCount handler
function preRentCountHandler() {
	rentCount.classList.add('hidden')
	roomType.classList.remove('hidden')
	rentCountBtn.classList.add('hidden')
	roomTypeBtn.classList.remove('hidden')
}

function minusHandler(event) {
	let target = event.target
	if(target.classList.contains('minus') == false) {
		target = target.parentNode
	}
	   
	const value = target.parentNode.children[1]
	   
	if(+value.innerText - 1 >= 0) {
		value.innerText = +value.innerText - 1
	}
}

function plusHandler(event) {
	let target = event.target
	if(target.classList.contains('plus') == false) {
		target = target.parentNode
	}
	   
	const value = target.parentNode.children[1]
	   
	value.innerText = +value.innerText + 1
}

function rentCountHandler() {
	const roomCountValue = document.querySelector('.roomCountValue')
	const bathCountValue = document.querySelector('.bathCountValue')
	const guestCountValue = document.querySelector('.guestCountValue')
	const bedCountValue = document.querySelector('.bedCountValue')
	   
	if(formData.get("roomCount") != null) {
		formData.delete("roomCount")
		formData.delete("bathCount")
		formData.delete("guestCount")
		formData.delete("bedCount")
	}
	formData.append("roomCount", +roomCountValue.innerText)
	formData.append("bathCount", +bathCountValue.innerText)
	formData.append("guestCount", +guestCountValue.innerText)
	formData.append("bedCount", +bedCountValue.innerText)
	   
	rentCount.classList.add('hidden')
	rentInformation.classList.remove('hidden')
	rentCountBtn.classList.add('hidden')
	rentInformationBtn.classList.remove('hidden')
}

//rentInformation handler
function preRentInformationHandler() {
	rentInformation.classList.add('hidden')
	rentCount.classList.remove('hidden')
	rentInformationBtn.classList.add('hidden')
	rentCountBtn.classList.remove('hidden')
}

function rentInformationItemHandler() {
	let target = event.target
	let isEqual = false
	while(target.classList.contains('rentInformationItem') == false) {
		target = target.parentNode
	}
	const rentInformationSelectedList = document.querySelectorAll('.rentInformationSelected')
	   
	rentInformationSelectedList.forEach(rentInformationSelected => {
		if(rentInformationSelected == target) {
			rentInformationSelected.classList.remove('rentInformationSelected')
			isEqual = true
		}
	})
	   
	if(isEqual == false) {
		target.classList.add('rentInformationSelected')
	}
}

function rentInformationHandler() {
	const rentInformationSelectedList = document.querySelectorAll('.rentInformationSelected')
	const listLength = rentInformationSelectedList.length
	let rentInformationValue = ''
	let count = 1
	   
	rentInformationSelectedList.forEach(rentInformationSelected => {
		if(count != listLength) {
			rentInformationValue += rentInformationSelected.children[1].innerText + ','
		}
		else {
			rentInformationValue += rentInformationSelected.children[1].innerText
		}
		count++
	})
	   
	if(formData.get("information") != null) {
		formData.delete("information")
	}
	formData.append("information", rentInformationValue)
	   
	rentInformation.classList.add('hidden')
	rentImg.classList.remove('hidden')
	rentInformationBtn.classList.add('hidden')
	rentImgBtn.classList.remove('hidden')
}

//rentImgHandler
function preRentImgHandler() {
	rentImg.classList.add('hidden')
	rentInformation.classList.remove('hidden')
	rentImgBtn.classList.add('hidden')
	rentInformationBtn.classList.remove('hidden')
}

function rentImgInputHandler(event) {
    const target = event.target
    const selectedFile = target.files[0]
   
    if(selectedFile != null) {
       const reader = new FileReader()
   
       reader.readAsDataURL(selectedFile)
       reader.onload = function(e) {
          const inputSpace = target.parentNode
          const imgSpace = inputSpace.parentNode
          const img = imgSpace.children[1]
         
          inputSpace.classList.add('hidden')
          img.classList.remove('hidden')
          img.children[1].src = e.target.result
       };
    }
}

function rentImgHandler() {
	const fileInputs = document.querySelectorAll('.fileImg')
	let index = 0
	const mainImgSpace = document.querySelector('.mainImgSpace')
   
	for(let i = 0; i > 5; i++) {
		if(formData.get('files['+ i +']') != null) {
			formData.delete('files['+ i +']')
		}
	}
   
	fileInputs.forEach(fileInput => {
		if(fileInput.files[0] != null) {
			formData.append('files[' + index + ']', fileInput.files[0])
			index++
		}
	})
   
	if(index == 0) {
		alert('숙소를 표현할 사진 하나 이상은 꼭 등록해주세요 ~~')
		return
	} 
   
	rentImg.classList.add('hidden')
	rentContent.classList.remove('hidden')
	rentImgBtn.classList.add('hidden')
	rentContentBtn.classList.remove('hidden')
}

function imgDeleteHandler(event) {
	const target = event.target
	const img = target.parentNode
	const inputSpace = target.parentNode.parentNode.children[0]
	const input = inputSpace.querySelector('input[type="file"]')
	const createInput = document.createElement('input')
	createInput.type = 'file'
	createInput.className = input.className
	createInput.addEventListener("change", rentImgInputHandler)
	   
	inputSpace.removeChild(input)
	inputSpace.appendChild(createInput)
	inputSpace.classList.remove('hidden')
	img.classList.add('hidden')
}

//rentContent handler
function preRentContentHandler() {
	rentContent.classList.add('hidden')
	rentImg.classList.remove('hidden')
	rentContentBtn.classList.add('hidden')
	rentImgBtn.classList.remove('hidden')
}

function rentContentHandler() {
   const title = document.querySelector('input[name="title"]')
   const price = document.querySelector('input[name="price"]')
   const content = document.querySelector('textarea[name="content"]')
   const contactNum = document.querySelector('input[name="contactNum"]')
   
   if(title.value == '') {
      alert('숙소 이름을 꼭 입력해주세요 ~~')
      return
   }
   if(price.value == '') {
      alert('숙소 가격을 꼭 입력해주세요 ~~')
      return
   }
   if(contactNum.value == '') {
      alert('숙소 대표 전화번호를 꼭 입력해주세요 ~~')
      return
   }
   if(content.value == '') {
      alert('숙소 소개를 꼭 입력해주세요 ~~')
      return
   }
   
   if(formData.get("title") != null) {
      formData.delete("title")
   }
   if(formData.get("price") != null) {
      formData.delete("price")
   }
   if(formData.get("contactNum") != null) {
      formData.delete("contactNum")
   }
   if(formData.get("content") != null) {
      formData.delete("content")
   }
   
   formData.append('title', title.value)
   formData.append('price', price.value)
   formData.append('contactNum', contactNum.value)
   formData.append('content', content.value)
   
   rentContent.classList.add('hidden')
   rentLocation.classList.remove('hidden')
   rentContentBtn.classList.add('hidden')
   rentLocationBtn.classList.remove('hidden')
   
   map.relayout()
}

// rentLocation handler
function preRentLocationHandler() {
   rentLocation.classList.add('hidden')
   rentContent.classList.remove('hidden')
   rentLocationBtn.classList.add('hidden')
   rentContentBtn.classList.remove('hidden')
}

function finishHandler() {
   let address = '';
   const url = cpath + '/rent/createRent'
   const sido = document.querySelector('select[name="sido"]')
   const sigugun = document.querySelector('input[name="sigugun"]')
   const gueup = document.querySelector('input[name="gueup"]')
   const road = document.querySelector('input[name="road"]')
   const detailAddress = document.querySelector('input[name="detailAddress"]')
   address = sido.value + ' ' + sigugun.value + ' ' + gueup.value + ' ' + road.value
   
   if(sido.value == '') {
      alert('시·도를 꼭 선택해주세요 !')
      return
   }
   if(sigugun.value == '') {
      alert('시·구·군을 꼭 입력해주세요 !')
      return
   }
   if(road.value == '') {
      alert('도로명 주소를 꼭 입력해주세요 !')
      return
   }
   if(detailAddress.value == '') {
      alert('상세주소를 꼭 입력해주세요 !')
      return
   }
   
   if(formData.get('address') != null) {
      formData.delete("address")
   }
   if(formData.get('detailAddress') != null) {
      formData.delete("detailAddress")
   }
   if(formData.get('member') != null) {
      formData.delete("member")
   }
   
   formData.append('address', address)
   formData.append('detailAddress', detailAddress.value)
   formData.append('member', idx)
   
   opt.body = formData
   
   fetch(url, opt)
   .then(resp => resp.json())
   .then(json => {
      window.removeEventListener("beforeunload", beforeUnloadHandler)
      alert(json.msg)
      location.href = cpath + json.url + '/' + idx
   })
}

function searchLocationHandler() {
    const inputLocation = document.querySelector('.inputLocation')
    const geocoder = new kakao.maps.services.Geocoder()
    
    geocoder.addressSearch(inputLocation.value, function(result, status) {
       const select = document.querySelector('select[name="sido"]')
       const sigugun = document.querySelector('input[name="sigugun"]')
       const gueup = document.querySelector('input[name="gueup"]')
       const road = document.querySelector('input[name="road"]')
       
       select.options[0].selected = true
       sigugun.value = ""
       gueup.value = ""
       road.value = ""
       
       if(status === kakao.maps.services.Status.OK) {
          const lng = result[0].x
          const lat = result[0].y
          
          geocoder.coord2Address(lng, lat, function(result, status) {
             var resultDiv = document.getElementById('clickLatlng'); 
             
             if(status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(lat, lng);
                const roadAddress = result[0].road_address.address_name
                var message = roadAddress
                
                console.log(coords)
                
                // 결과값으로 받은 위치를 마커로 표시합니다
                marker.setPosition(coords)
                
                console.log(event.target.innerText, coords)
                map.setCenter(coords);
             }
             
             resultDiv.innerText = message
             
             const addressParts = message.split(' ')
             
             for(let i = 0; i < addressParts.length; i++) {
                 if(i == 0) {
                   const option = document.querySelector('option[value="' + addressParts[i] + '"]')
                    option.selected = true
                 }
                 else if(i == 1) {
                    sigugun.value = addressParts[i]
                 }
                 else if('구/읍'.includes(addressParts[i].charAt(addressParts[i].length - 1))) {
                    gueup.value = addressParts[i]
                 }
                 else {
                    road.value += addressParts[i] + " "
                 }
             }
          })
       }
    })
 }