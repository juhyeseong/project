'use strict';

function inputProfileHandler(event) {
	const target = event.target
	const selectedFile = target.files[0]
	const profileImg = document.querySelector('.profileImg')
	
	if(selectedFile != null) {
		const reader = new FileReader()
		
		reader.readAsDataURL(selectedFile)
		reader.onload = function(e) {
			profileImg.src = e.target.result
		}
	}
}