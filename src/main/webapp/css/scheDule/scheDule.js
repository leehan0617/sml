function scheDule(form){
	if(form.scheduleType.value=="종류"){
		Alert("일정의 종류를 입력하세요");
		form.scheduleType.focus();
		return false;
		
	}
}