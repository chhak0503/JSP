<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Boolean agree = (Boolean) session.getAttribute("agree");
	String sms = (String) session.getAttribute("sms");

	if(agree == null){
		response.sendRedirect("/jboard1/user/terms.jsp");
		return;
	}
%>

<%@ include file="./_header.jsp" %>
<script>
	
	window.onload = function(){
		
		// 문서객체 생성
		const form = document.querySelector('.register > form');
		const btnCheckUid   = document.getElementById('btnCheckUid');
		const btnCheckNick  = document.getElementById('btnCheckNick');
		const btnCheckEmail = document.getElementById('btnCheckEmail');
		const btnCheckHp    = document.getElementById('btnCheckHp');
		const resultUid     = document.getElementsByClassName('resultUid')[0];		
		const resultNick    = document.getElementsByClassName('resultNick')[0];		
		const resultEmail   = document.getElementsByClassName('resultEmail')[0];		
		const resultHp      = document.getElementsByClassName('resultHp')[0];		
		
		// 아이디 중복체크
		btnCheckUid.onclick = function(e){
			e.preventDefault();
			
			// 입력한 아이디 가져오기
			const uid = form.uid.value;
			console.log('uid : ' + uid);
			
			// 입력한 아이디 중복확인을 위해 서버 전송
			fetch('./proc/checkCountUserProc.jsp?uid='+uid)
				.then(response => response.json())
				.then((data)=>{
					console.log('result : ' + data.result);
					
					if(data.result > 0){
						resultUid.innerText = '이미 사용 중인 아이디 입니다.';
						resultUid.style.color = 'red';
					}else {
						resultUid.innerText = '사용 가능한 아이디 입니다.';
						resultUid.style.color = 'green';
					}
					
				})
				.catch((err) => {
					console.log(err);
				});
			
		}// 아이디 중복체크 끝
		
		// 닉네임 중복체크
		btnCheckNick.onclick = function(e){
			e.preventDefault();
			
			// 입력한 닉네임 중복확인을 위해 서버 전송
			fetch('./proc/checkCountUserProc.jsp?nick='+form.nick.value)
				.then(response => response.json())
				.then((data)=>{
					console.log('result : ' + data.result);
					
					if(data.result > 0){
						resultNick.innerText = '이미 사용 중인 닉네임 입니다.';
						resultNick.style.color = 'red';
					}else {
						resultNick.innerText = '사용 가능한 닉네임 입니다.';
						resultNick.style.color = 'green';
					}
					
				})
				.catch((err) => {
					console.log(err);
				});
			
		}// 닉네임 중복체크 끝
		
		
		// 이메일 중복체크
		btnCheckEmail.onclick = function(e){
			e.preventDefault();
			
			// 입력한 닉네임 중복확인을 위해 서버 전송
			fetch('./proc/checkCountUserProc.jsp?email='+form.email.value)
				.then(response => response.json())
				.then((data)=>{
					console.log('result : ' + data.result);
					
					if(data.result > 0){
						resultEmail.innerText = '이미 사용 중인 이메일 입니다.';
						resultEmail.style.color = 'red';
					}else {
						resultEmail.innerText = '사용 가능한 이메일 입니다.';
						resultEmail.style.color = 'green';
					}
				})
				.catch((err) => {
					console.log(err);
				});
			
		}// 이메일 중복체크 끝
		
		// 휴대폰 중복체크
		btnCheckHp.onclick = function(e){
			e.preventDefault();
			
			// 입력한 닉네임 중복확인을 위해 서버 전송
			fetch('./proc/checkCountUserProc.jsp?hp='+form.hp.value)
				.then(response => response.json())
				.then((data)=>{
					console.log('result : ' + data.result);
					
					if(data.result > 0){
						resultHp.innerText = '이미 사용 중인 이메일 입니다.';
						resultHp.style.color = 'red';
					}else {
						resultHp.innerText = '사용 가능한 이메일 입니다.';
						resultHp.style.color = 'green';
					}
				})
				.catch((err) => {
					console.log(err);
				});
			
		}// 휴대폰 중복체크 끝
		
		
	}


</script>


<main>
    <section class="register">
        <form action="/jboard1/user/proc/registerProc.jsp" method="post">
        	<input type="hidden" name="sms" value="<%= sms %>">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" required placeholder="아이디 입력"/>
                        <button id="btnCheckUid"><img src="../images/chk_id.gif" alt=""></button>
                        <span class="resultUid"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="pass1" required placeholder="비밀번호 입력"/>                            
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                        <span class="resultPass"></span>
                    </td>
                </tr>
            </table>
            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" required placeholder="이름 입력"/>                            
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                        <input type="text" name="nick" required placeholder="별명 입력"/>
                        <button id="btnCheckNick"><img src="../images/chk_id.gif" alt=""></button>
                        <span class="resultNick"></span>                            
                    </td>
                </tr>
                <tr>
                    <td>E-Mail</td>
                    <td>
                        <input type="email" name="email" required placeholder="이메일 입력"/>
                        <button id="btnCheckEmail"><img src="../images/chk_id.gif" alt=""></button>
                        <span class="resultEmail"></span>   
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <input type="text" name="hp" required placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                        <button id="btnCheckHp"><img src="../images/chk_id.gif" alt=""></button>
                        <span class="resultHp"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <div>
                            <input type="text" name="zip" placeholder="우편번호" readonly/>                                
                            <button class="btnZip"><img src="../images/chk_post.gif" alt=""></button>
                        </div>                            
                        <div>
                            <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                        </div>
                        <div>
                            <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                        </div>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/jboard1/user/login.jsp" class="btnCancel">취소</a>
                <input type="submit"   class="btnSubmit" value="회원가입"/>
            </div>    
        </form>
    </section>
</main>
<%@ include file="./_footer.jsp" %>