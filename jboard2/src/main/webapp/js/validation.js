//유효성 검사에 사용할 상태변수
let isUidOk   = false;
let isPassOk  = false;
let isNameOk  = false;
let isNickOk  = false;
let isEmailOk = false;
let isHpOk    = false;

// 유효성 검사에 사용할 정규표현식
const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName  = /^[가-힣]{2,10}$/ 
const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;


window.onload = function(){
	
	// 문서객체 생성
	const form = document.formRegister;
	const btnCheckUid  = document.getElementById('btnCheckUid');
	const btnCheckNick = document.getElementById('btnCheckNick');
	const btnSendEmail = document.getElementById('btnSendEmail');
	const btnAuthEmail = document.getElementById('btnAuthEmail');
	const fieldAuth = document.getElementsByClassName('auth')[0];
	
	const btnCheckHp   = document.getElementById('btnCheckHp');
	const btnZip = document.getElementById('btnZip');
	
	const resultUid = document.getElementsByClassName('resultUid')[0];
	const resultPass = document.getElementsByClassName('resultPass')[0];
	const resultName = document.getElementsByClassName('resultName')[0];
	const resultNick = document.getElementsByClassName('resultNick')[0];
	const resultEmail = document.getElementsByClassName('resultEmail')[0];
	const resultHp = document.getElementsByClassName('resultHp')[0];
	
	
	// 1) 아이디 유효성 검사(중복체크 포함)
	btnCheckUid.onclick = function(){
		
		const value = form.uid.value;
		
		// 유효성 검사
		if(!value.match(reUid)){
			resultUid.innerText = '아이디 형식이 맞지 않습니다.';
			resultUid.style.color = 'red';
			isUidOk = false;
			return;
		}
		
		// 중복체크
		fetch('/jboard2/user/checkUser.do?type=uid&value='+value)
		.then((response) => response.json())
		.then((data)=>{
			console.log(data);
			
			if(data.result > 0){
				resultUid.innerText = '이미 사용중인 아이디 입니다.';
				resultUid.style.color = 'red';
				isUidOk = false;
			}else{
				resultUid.innerText = '사용 가능한 아이디 입니다.';
				resultUid.style.color = 'green';
				isUidOk = true;
			}
		}).catch((err)=>{
			console.log(err);
		});
		
	}
	
	// 2) 비밀번호 유효성 검사
	form.pass2.addEventListener('focusout', ()=>{
		
		const pass1 = form.pass1.value;
		const pass2 = form.pass2.value;
		
		if(pass1 == pass2){
			
			if(!pass1.match(rePass)){
				resultPass.innerText = '비밀번호 형식에 맞지 않습니다.';
				resultPass.style.color = 'red';
				isPassOk = false;
			}else{
				resultPass.innerText = '사용 가능한 비밀번호 입니다.';
				resultPass.style.color = 'green';
				isPassOk = true;
			}
		}else{
			resultPass.innerText = '비밀번호가 일치하지 않습니다.';
			resultPass.style.color = 'red';
			isPassOk = false;
		}
	});
	
	// 3) 이름 유효성 검사
	form.name.addEventListener('focusout', ()=>{
		
		const value = form.name.value;
		
		if(!value.match(reName)){
			resultName.innerText = '이름 형식에 맞지 않습니다.';
			resultName.style.color = 'red';
			isNameOk = false;
		}else{
			resultName.innerText = '';				
			isNameOk = true;
		}
	});
	
	// 4) 별명 유효성 검사(중복체크 포함)
	btnCheckNick.onclick = function(){
		
		const value = form.nick.value;
		
		// 유효성 검사
		if(!value.match(reNick)){
			resultNick.innerText = '이름 형식이 맞지 않습니다.';
			resultNick.style.color = 'red';
			isNickOk = false;
			return;
		}
		
		// 중복체크
		fetch('/jboard2/user/checkUser.do?type=nick&value='+value)
		.then((response) => response.json())
		.then((data)=>{
			console.log(data);
			
			if(data.result > 0){
				resultNick.innerText = '이미 사용중인 닉네임 입니다.';
				resultNick.style.color = 'red';
				isNickOk = false;
			}else{
				resultNick.innerText = '사용 가능한 닉네임 입니다.';
				resultNick.style.color = 'green';
				isNickOk = true;
			}
		}).catch((err)=>{
			console.log(err);
		});
		
	}
	
	// 5) 이메일 유효성 검사(인증번호 처리)
	btnSendEmail.onclick = function(){
		
		const value = form.email.value;
		
		// 유효성 검사
		if(!value.match(reEmail)){
			resultEmail.innerText = '이메일 형식이 맞지 않습니다.';
			resultEmail.style.color = 'red';
			isEmailOk = false;
			return;
		}
		
		resultEmail.innerText = '이메일 인증코드 전송 중...';
		
		// 중복체크 & 인증코드 전송
		fetch('/jboard2/user/checkUser.do?type=email&value='+value)
		.then((response) => response.json())
		.then((data)=>{
			console.log(data);
			
			if(data.result > 0){
				resultEmail.innerText = '이미 사용중인 이메일 입니다.';
				resultEmail.style.color = 'red';
				isEmailOk = false;
			}else{
				// 인증코드 입력필드 활성화
				fieldAuth.style.display = 'block';
				resultEmail.innerText = '이메일 인증코드 6자리 입력하세요.';
			}
		}).catch((err)=>{
			console.log(err);
		});
	}
	
	// 이메일 인증코드 전송 버튼 클릭
	btnAuthEmail.onclick = function(){
		
		const value = form.auth.value;
		
		fetch('/jboard2/user/checkUser.do', {
			method: 'POST',
			body: JSON.stringify({"code": value}) 
		})
		.then((response) => response.json())
		.then((data)=>{
			console.log(data);
			
			if(data.result > 0){					
				fieldAuth.style.display = 'none';
				resultEmail.innerText = '이메일이 인증 되었습니다.';
				resultEmail.style.color = 'green';
				isEmailOk = true;
			}else{
				resultEmail.innerText = '이메일이 인증코드가 일치 않습니다.';
				resultEmail.style.color = 'red';
				isEmailOk = false;
			}
			
		}).catch((err)=>{
			console.log(err);
		});
	}
	
	// 6) 휴대폰 번호 유효성 검사(중복체크 포함)
	btnCheckHp.onclick = function(){
		
		const value = form.hp.value;
		
		// 유효성 검사
		if(!value.match(reHp)){
			resultHp.innerText = '휴대폰 형식이 맞지 않습니다.';
			resultHp.style.color = 'red';
			isHpOk = false;
			return;
		}
		
		// 중복체크
		fetch('/jboard2/user/checkUser.do?type=hp&value='+value)
		.then((response) => response.json())
		.then((data)=>{
			console.log(data);
			
			if(data.result > 0){
				resultHp.innerText = '이미 사용중인 휴대폰번호 입니다.';
				resultHp.style.color = 'red';
				isHpOk = false;
			}else{
				resultHp.innerText = '사용 가능한 휴대폰번호 입니다.';
				resultHp.style.color = 'green';
				isHpOk = true;
			}
		}).catch((err)=>{
			console.log(err);
		});
		
	}
	
	// 최종 전송하기
	form.onsubmit = function(){
		
		if(!isUidOk){
			alert('아이디가 유효하지 않습니다.');
			return false; // 폼 전송 취소
		}
		
		if(!isPassOk){
			alert('비밀번호가 유효하지 않습니다.');
			return false;
		}
		
		if(!isNameOk){
			alert('이름이 유효하지 않습니다.');
			return false;
		}
		
		if(!isNickOk){
			alert('별명이 유효하지 않습니다.');
			return false;
		}
		
		if(!isEmailOk){
			alert('이메일이 유효하지 않습니다.');
			return false;
		}
		
		if(!isHpOk){
			alert('휴대폰이 유효하지 않습니다.');
			return false;
		}
		
		return true; // 폼 전송 시작
	} 
}