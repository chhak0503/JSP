<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/JBoard2/js/postcode.js"></script>
<script src="/JBoard2/js/validation.js"></script>
<script>
	
	let isEmailAuthOk = false;
	let receivedCode = 0;

	// 이메일 인증
	$(function(){
		
		// 이메일 인증코드 발송 클릭
		$('#btnEmail').click(function(){
			
			$(this).hide();			
			let email = $('input[name=email]').val();
			console.log('here1 : ' + email);
			
			if(email == ''){
				alert('이미엘을 입력 하세요.');
				return;
			}
			
			if(isEmailAuthOk){
				console.log('here2');
				return;
			}
			
			isEmailAuthOk = true;
			
			$('.resultEmail').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
			console.log('here3');
			
			setTimeout(function(){
				console.log('here4');
				
				$.ajax({
					url: '/JBoard2/user/emailAuth.do',
					method: 'GET',
					data: {"email": email},
					dataType: 'json',
					success: function(data){
						//console.log(data);
						
						if(data.status > 0){
							// 메일전송 성공
							console.log('here5');
							isEmailAuthOk = true;
							$('.resultEmail').text('이메일을 확인 후 인증코드를 입력하세요.');
							$('.auth').show();
							receivedCode = data.code;
							
						}else{
							// 메일전송 실패
							console.log('here6');
							isEmailAuthOk = false;
							alert('메일전송이 실패 했습니다.\n다시 시도 하시기 바랍니다.');
						}
					}
				});
			}, 1000);
		});
		
		
		// 이메일 인증코드 확인 버튼
		$('#btnEmailConfirm').click(function(){
			
			let code = $('input[name=auth]').val();
			
			if(code == ''){
				alert('이메일 확인 후 인증코드를 입력하세요.');
				return;
			}
			
			if(code == receivedCode){
				$('input[name=email]').attr('readonly', true);
				$('.resultEmail').text('이메일이 인증 되었습니다.');				
				$('.auth').hide();
			}else{
				alert('인증코드가 틀립니다.\n다시 확인 하십시요.');
			}
		});
	});
</script>
<main id="user">
    <section class="register">
        <form action="/JBoard2/user/register.do" method="post">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnUidCheck"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="resultUid"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                    	<input type="password" name="pass1" placeholder="비밀번호 입력"/>
                    	<span class="resultPass"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>
                        <span class="resultName"></span>     
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button" id="btnNickCheck"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="resultNick"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <span class="resultEmail"></span>
                        <button type="button" id="btnEmail"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailConfirm"><img src="../img/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                    	<input type="text" name="hp" placeholder="휴대폰 입력"/>
                    	<span class="resultHp"></span>
                    </td>
                </tr>
                <tr>
	                <td>주소</td>
	                <td>
	                    <input type="text" name="zip" id="zip" placeholder="우편번호 검색" readonly/>
	                    <button type="button" onclick="postcode()"><img src="/JBoard2/img/chk_post.gif" alt="우편번호 찾기"/></button>
	                    <input type="text" name="addr1" id="addr1" placeholder="기본주소 검색" readonly/>
	                    <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력"/>
	                </td>
	            </tr>
                
            </table>

            <div>
                <a href="/JBoard2/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<jsp:include page="./_footer.jsp"/>