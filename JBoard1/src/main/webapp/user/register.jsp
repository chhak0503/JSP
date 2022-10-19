<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<script>

	// 데이터 검증에 사용할 정규표현식
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var regHp	 = /^\d{3}-\d{3,4}-\d{4}$/;
	var regPass  = /^.*(?=^.{5,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	// 폼 데이터 검증 결과 상태변수
	let isUidOk   = false;
	let isPassOk  = false;
	let isNameOk  = false;
	let isNickOk  = false;
	let isEmailOk = false;
	let isHpOk    = false;
	
	
	$(function(){
		
		// 비밀번호 일치여부 확인
		$('input[name=pass2]').focusout(function(){			
			let pass1 = $('input[name=pass1]').val();
			let pass2 = $(this).val();
			
			if(pass1 == pass2){
								
				if(regPass.test(pass2)){
					isPassOk = true;
					$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');	
				}else{
					isPassOk = false;
					$('.resultPass').css('color', 'red').text('영문, 숫자, 특수문자 조합 최소 5자 이상 이어야 합니다.');
				}				
				
			}else{
				isPassOk = false;
				$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			}			
		});
		
		
		
		
		
		
		// 폼 전송이 시작될 때 실행되는 폼 이벤트(폼 전송 버튼을 클릭했을 때) 
		$('.register > form').submit(function(){
			////////////////////////////////////
			// 폼 데이터 유효성 검증(Validation)
			////////////////////////////////////
			// 아이디 검증
			// 비밀번호 검증
			// 이름 검증
			// 별명 검증
			// 이메일 검증
			// 휴대폰 검증
			
			return false;
		});
		
		
		
	});
</script>
<main id="user" class="register">
    <form action="/JBoard1/user/proc/registerProc.jsp" method="post">
        <table border="1">
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="uid" placeholder="아이디 입력"/>
                    <button type="button"><img src="/JBoard1/img/chk_id.gif" alt="중복확인"/></button>
                    <span class="resultUid"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="pass1" placeholder="비밀번호 입력"/>
                    <span class="resultPass"></span>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                </td>
            </tr>
        </table>
        <table border="1">
            <caption>개인정보 입력</caption>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="name" placeholder="이름 입력"/>                        
                </td>
            </tr>
            <tr>
                <th>별명</th>
                <td>
                    <p>공백없이 한글, 영문, 숫자 입력</p>
                    <input type="text" name="nick" placeholder="별명 입력"/>
                    <button type="button"><img src="/JBoard1/img/chk_id.gif" alt="중복확인"/></button>
                    <span class="resultNick"></span>
                </td>
            </tr>                    
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" name="email" placeholder="이메일 입력"/>
                </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" name="hp" placeholder="- 포함 13자리 입력"/>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" name="zip" placeholder="우편번호 검색" readonly/>
                    <button type="button"><img src="/JBoard1/img/chk_post.gif" alt="우편번호 찾기"/></button>
                    <input type="text" name="addr1" placeholder="기본주소 검색" readonly/>
                    <input type="text" name="addr2" placeholder="상세주소 입력"/>
                </td>
            </tr>
        </table>

        <div>
            <a href="/JBoard1/user/login.jsp" class="btnCancel">취소</a>
            <input type="submit" class="btnRegister" value="회원가입"/>
        </div>
    </form>            
</main>

<%@ include file="./_footer.jsp" %>