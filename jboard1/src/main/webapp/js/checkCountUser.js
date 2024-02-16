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
		
		// 서버 전송
		const params = '?type=uid&value='+uid;
		getCheckResult(url+params, resultUid);
		
	}// 아이디 중복체크 끝
	
	// 닉네임 중복체크
	btnCheckNick.onclick = function(e){
		e.preventDefault();
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=nick&value='+form.nick.value;
		getCheckResult(url+params, resultNick);
		
	}// 닉네임 중복체크 끝
	
	
	// 이메일 중복체크
	btnCheckEmail.onclick = function(e){
		e.preventDefault();
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=email&value='+form.email.value;
		getCheckResult(url+params, resultEmail);
		
	}// 이메일 중복체크 끝
	
	// 휴대폰 중복체크
	btnCheckHp.onclick = function(e){
		e.preventDefault();
		
		// 입력한 닉네임 중복확인을 위해 서버 전송
		const params = '?type=hp&value='+form.hp.value;
		getCheckResult(url+params, resultHp);
		
	}// 휴대폰 중복체크 끝
	
	
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
	
	
	// 공통 fetch 함수
	function getCheckResult(url, target){
		
		fetch(url)
			.then(response => response.json())
			.then((data)=>{
				//console.log('result : ' + data.result);
				
				if(data.result > 0){
					target.innerText = '이미 사용 중인 ' + data.type + ' 입니다.';
					target.style.color = 'red';
				}else {
					target.innerText = '사용 가능한 ' + data.type + ' 입니다.';
					target.style.color = 'green';
				}
			})
			.catch((err) => {
				console.log(err);
			});
	}
	
	
}