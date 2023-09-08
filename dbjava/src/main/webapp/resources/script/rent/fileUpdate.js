'use strict';

function rentImgInputHandler(event) {
    const target = event.target
    const selectedFile = target.files[0]
    let formData = new FormData()
    formData.append("files[0]", selectedFile)
    formData.append("idx", idx)
   
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
       
       const url = cpath + '/rent/rentFileInsert'
       const opt = {
             method: 'POST',
             body: formData
      }
       fetch(url, opt)
       .then(resp => resp.text())
       .then(text => {
          if(text != 0 && text != null) {
             location.reload()
          }
          else {
             alert('사진 추가에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
          }
       })
    }
}

function imgDeleteHandler(event) {
   const target = event.target
   const img = target.parentNode.children[1].src
   const inputSpace = target.parentNode.parentNode.children[0]
   const input = inputSpace.querySelector('input[type="file"]')
   const createInput = document.createElement('input')
   createInput.type = 'file'
   createInput.className = input.className
   createInput.addEventListener("change", rentImgInputHandler)
   
   const addMainImgList = document.querySelectorAll('.addMainImg')
   const srcList = []
   
   addMainImgList.forEach(addMainImg => srcList.push(addMainImg.src))
   if(srcList[1] == '') {
      alert('숙소를 대표할 사진은 꼭 한장 이상은 등록해주세요 !!')
      return
   }
   
   const url = cpath + '/rent/rentDeleteFile'
   const opt = {
      method: 'POST',
      headers: {                  
         'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({      
         filePath: img
      })
   }
   
   console.log(img)
   
   fetch(url, opt)
   .then(resp => resp.text())
   .then(text => {
      if(text != 0 && text != null) {
         location.reload()
      }
      else {
         alert('사진 삭제에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
      }
   })
}