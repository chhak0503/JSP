<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<main id="user" class="terms">
    <table border="0">
        <caption>사이트 이용약관</caption>
        <tr>
            <td>
                <textarea class="terms" readonly>약관내용</textarea>
                <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
            </td>
        </tr>
    </table>

    <table border="0">
        <caption>개인정보 취급방침</caption>
        <tr>
            <td>
                <textarea class="privacy" readonly>개인정보내용</textarea>
                <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
            </td>
        </tr>
    </table>

    <p>
        <a href="/JBoard1/user/login.jsp" class="cancel">취소</a>
        <a href="/JBoard1/user/register.jsp" class="next">다음</a>
    </p>            
</main>

<%@ include file="./_footer.jsp" %>