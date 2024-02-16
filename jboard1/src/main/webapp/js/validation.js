// 유효성 검사에 사용할 상태변수
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

// 한 문서에 하나의 onload 이벤트만 실행됨
window.onload = function(){
		
	// 문서객체 생성
	const form = document.querySelector('.register > form');
	const btnCheckUid   = document.getElementById('btnCheckUid');
	const btnCheckNick  = document.getElementById('btnCheckNick');
	const btnCheckEmail = document.getElementById('btnCheckEmail');
	const btnCheckHp    = document.getElementById('btnCheckHp');
	const resultUid     = document.getElementsByClassName('resultUid')[0];		
	const resultPass    = document.getElementsByClassName('resultPass')[0];		
	const resultName    = document.getElementsByClassName('resultName')[0];		
	const resultNick    = document.getElementsByClassName('resultNick')[0];		
	const resultEmail   = document.getElementsByClassName('resultEmail')[0];		
	const resultHp      = document.getElementsByClassName('resultHp')[0];
	const url = './proc/checkCountUserProc.jsp';
	
	// 아이디 중복체크
	btnCheckUid.onclick = function(e){
		e.preventDefault();
		
		const uid = form.uid.value;
		
		// 아이디 유효성 검사
		if(!uid.match(reUid)){
			resultUid.innerText = '아이디 형식에 맞지 않습니다.';
			resultUid.style.color = 'red';
			isUidOk = false;
			return;	
		}
		
		console.log('isUidOk1 : ' + isUidOk);
		
		// 서버 전송
		const params = '?type=uid&value='+uid;
		getCheckResult(url+params, resultUid)
			.then((result)=>{				
				console.log('result : ' + result);
				isUidOk = true;
			})
			.catch((err)=>{
				console.error('err : ', err);
			});
		
		console.log('isUidOk2 : ' + isUidOk);
		
	}// 아이디 중복체크 끝
	
	// 닉네임 중복체크
	btnCheckNick.onclick = function(e){
		e.preventDefault();
		const nick = form.nick.value;
		
		// 닉네임 유효성 검사
		if(!nick.match(reNick)){
			resultNick.innerText = '닉네임 형식에 맞지 않습니다.';
			resultNick.style.color = 'red';
			isNickOk = false;
			return;	
		}	
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=nick&value='+nick;
		isNickOk = getCheckResult(url+params, resultNick);
		
	}// 닉네임 중복체크 끝
	
	
	// 이메일 중복체크
	btnCheckEmail.onclick = function(e){
		e.preventDefault();
		
		const email = form.email.value;
		
		// 닉네임 유효성 검사
		if(!email.match(reEmail)){
			resultEmail.innerText = '이메일 형식에 맞지 않습니다.';
			resultEmail.style.color = 'red';
			isEmailOk = false;
			return;	
		}
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=email&value='+email;
		isEmailOk = getCheckResult(url+params, resultEmail);
		
	}// 이메일 중복체크 끝
	
	// 휴대폰 중복체크
	btnCheckHp.onclick = function(e){
		e.preventDefault();
		
		const hp = form.hp.value;
		
		// 휴대폰 유효성 검사
		if(!hp.match(reHp)){
			resultHp.innerText = '휴대폰 형식에 맞지 않습니다.';
			resultHp.style.color = 'red';
			isHpOk = false;
			return;	
		}
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=hp&value='+hp;
		isHpOk = getCheckResult(url+params, resultHp);
		
	}// 휴대폰 중복체크 끝
	
	// 비밀번호 유효성 검사
	form.pass2.addEventListener('focusout', function(){
		
		const pass1 = form.pass1.value;
		const pass2 = form.pass2.value;

		if(pass1 == pass2){
			
			if(!pass1.match(rePass)){
				resultPass.innerText = '비밀번호 형식에 맞지 않습니다.';
				resultPass.style.color = 'red';
				isPassOk = false;
				return;	
			}else{
				resultPass.innerText = '사용 가능한 비밀번호 입니다.';
				resultPass.style.color = 'green';
				isPassOk = true;
				return;
			}
			
		}else{
			resultPass.innerText = '비밀번호가 일치하지 않습니다.';
			resultPass.style.color = 'red';
			isPassOk = false;
			return;	
		}		
	});
	
	// 이름 유효성 검사
	form.name.addEventListener('focusout', function(){
		
		const name = form.name.value;

		if(!name.match(reName)){
			resultName.innerText = '이름 형식에 맞지 않습니다.';
			resultName.style.color = 'red';
			isNameOk = false;
			return;	
		}else{
			resultName.innerText = '';
			isNameOk = true;
			return;
		}	
	});
	
	// 최종 유효성 검사
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
	
	
	// 공통 커스텀 fetch 함수
	async function getCheckResult(url, target) {
		
		let result = false;
		console.log('result1 : ' + result);
		
		try {
			const response = await fetch(url);
			const data = await response.json();
			
			if(response.ok){
				
				if(data.result > 0){
					target.innerText = '이미 사용 중인 ' + data.type + ' 입니다.';
					target.style.color = 'red';
					result = false;
					console.log('result2 : ' + result);
				}else {
					target.innerText = '사용 가능한 ' + data.type + ' 입니다.';
					target.style.color = 'green';
					result = true;
					console.log('result3 : ' + result);
				}
				
				console.log('result4 : ' + result);
				return result;
			}
			
		}catch(err){
			throw err;
		}
	}
	
	
}