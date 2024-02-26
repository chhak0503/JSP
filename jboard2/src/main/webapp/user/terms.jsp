<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script>
	
	window.onload = function(){
		
		const form = document.querySelector('.terms > form');
		const chkTerms   = document.getElementsByName('chkTerms')[0];
		const chkPrivacy = document.getElementsByName('chkPrivacy')[0];		
		
		const btnNext = document.getElementsByClassName('btnNext')[0];
		
		
		btnNext.onclick = function(e){
			e.preventDefault();
			
			if(chkTerms.checked && chkPrivacy.checked){
				// 폼 전송
				form.submit();
			}else {
				alert('필수 동의 체크를 하셔야 합니다.');
			}
		}
	}
</script>
<main id="user">
    <section class="terms">
    	<form action="/jboard2/user/terms.do" method="post">
	        <table border="1">
	            <caption>사이트 이용약관</caption>
	            <tr>
	                <td>
	                    <textarea name="terms">${termsDTO.terms}</textarea>
	                    <label><input type="checkbox" name="chkTerms">&nbsp;동의합니다.</label>
	                </td>
	            </tr>
	        </table>
	
	        <table border="1">
	            <caption>개인정보 취급방침</caption>
	            <tr>
	                <td>
	                    <textarea name="privacy">${termsDTO.privacy}</textarea>
	                    <label><input type="checkbox" name="chkPrivacy">&nbsp;동의합니다.</label>
	                </td>
	            </tr>
	        </table>
	        
	        <table border="1">
	            <caption>마켓팅 수신동의</caption>
	            <tr>
	                <td>
	                    <textarea name="sms">${termsDTO.sms}</textarea>
	                    <label><input type="checkbox" name="chkSms">&nbsp;동의합니다.</label>
	                </td>
	            </tr>
	        </table>
        </form>
        <div>
            <a href="./login.html" class="btn btnCancel">취소</a>
            <a href="./register.html" class="btn btnNext">다음</a>
        </div>

    </section>
</main>
<%@ include file="./_footer.jsp" %>