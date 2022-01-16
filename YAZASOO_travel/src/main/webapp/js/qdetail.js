function qcommentWrite(){
	let text= document.getElementById("text").value;
	let id = document.getElementById("id").value;
	let idx = document.getElementById("idx").value;
	if(text.trim()==""){
        alert("내용을 입력하세요");
        text.focus(); 
   }else{
		if (confirm("댓글을 등록하시겠습니까?") == true) {
			location.href="qcommentWrite.do?idx="+idx+"&text="+text+"&id="+id;
	    }
	}
}