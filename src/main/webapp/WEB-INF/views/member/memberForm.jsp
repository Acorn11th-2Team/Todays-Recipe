<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">   
   $(document).ready(function(){
	  $("#userid").on("keyup",function(){
		  $.ajax({
			 url:'idDuplicateCheck',
			 type:'get',
			 data:{
				 id:$("#userid").val(),
			 },
			 dataType:"text",
			 success:function(data,status,xhr){
				 console.log(data);
				 $("#result").text(data);
			 },
			 error:function(xhr,status,error){}
		  });//end ajax
	  });//end on
   });//end ready
  </script> 
<form action="memberAdd" method="get">
	<div class="wrap">
        <div class="login">
            <h2>회원가입</h2>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="userid" id="userid" placeholder="ID">
                <span id="result"></span>
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="text" name="passwd" id="passwd" placeholder="Password">
            </div>
            <div class="login_pw2">
                <h4>비밀번호 확인</h4>
                <input type="text" name="passwd2" id="passwd2" placeholder="Retype Password">
                <span id="result2"></span>
            </div>
            <div class="username">
                <h4>이름</h4>
                <input type="text" name="username" placeholder="Name">
            </div>
            <div class="post" style="display:inline;">
                <h4>우편번호</h4>
                <input type="text" name="post" id="sample4_postcode" placeholder="PostCode">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
            </div>
            <div class="address">
                <h4>주소</h4>
                <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명 주소">
                <input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번 주소">
                <span id="guide" style="color:#999"></span>
            </div>
            <div class="phone">
                <h4>전화번호</h4>
				<select name="phone1">
				  <option value="010">010</option>
				  <option value="011">011</option>
				</select>&nbsp;-&nbsp;
				<input type="text" name="phone2" >&nbsp;-&nbsp;<input type="text" name="phone3" >
            </div>
            <div class="email">
                <h4>이메일</h4>
				<input type="text" name="email1" id="email1">@
		        <input type="text" name="email2" id="email2" placeholder="직접입력">
		        <select  id="emailSelect">
		        	<option value="daum.net">daum.net</option>
		        	<option value="naver.com">naver.com</option>
		        </select>
            </div>
            
            <div class="submit">
                <input type="submit" value="가입">
                <input type="reset" value="취소">
            </div>
            
        </div>
    </div>
</form>
<br>
<br>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>