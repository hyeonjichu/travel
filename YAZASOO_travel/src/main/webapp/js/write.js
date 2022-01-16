function boardWrite(){
	if($("#title").val() == ''){
		alert("제목을 입력해주세요");
		$("#title").focus();
	}else if($("#content").val() == ''){
		alert("내용을 입력하세요.");
		$("#content").focus();
	}else{
		if (confirm("글을 등록하시겠습니까?") == true) {
			$("#frm").submit();
        }
	}
}