<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/_header.jsp"/>
<main id="user">
    <section class="find findId">
        <form action="#">
            <table border="0">
                <caption>아이디 찾기</caption>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" placeholder="이름 입력"/></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <div>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                            <button type="button" class="btnAuth">인증번호 받기</button>
                        </div>
                        <div>
                            <input type="text" name="auth" disabled placeholder="인증번호 입력"/>
                            <button type="button" class="btnConfirm">확인</button>
                        </div>
                    </td>
                </tr>                        
            </table>                                        
        </form>
        
        <p>
            회원가입시 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
            인증번호를 입력 후 확인 버튼을 누르세요.
        </p>

        <div>
            <a href="./login.html" class="btn btnCancel">취소</a>
            <a href="./findIdResult.html" class="btn btnNext">다음</a>
        </div>
    </section>
</main>
<jsp:include page="/WEB-INF/_footer.jsp"/>