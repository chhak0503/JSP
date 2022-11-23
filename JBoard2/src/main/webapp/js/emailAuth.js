/**
 * 
 */
let isEmailAuthOk = false;
let preventDoubleClick = false;
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
		
		if(preventDoubleClick){
			console.log('here2');
			return;
		}
		
		preventDoubleClick = true;
		
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
						$('.resultEmail').text('이메일을 확인 후 인증코드를 입력하세요.');
						$('.auth').show();
						receivedCode = data.code;
						
					}else{
						// 메일전송 실패
						console.log('here6');						
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
			isEmailAuthOk = true;
			$('input[name=email]').attr('readonly', true);
			$('.resultEmail').text('이메일이 인증 되었습니다.');				
			$('.auth').hide();
		}else{
			isEmailAuthOk = false;
			alert('인증코드가 틀립니다.\n다시 확인 하십시요.');
		}
	});
});