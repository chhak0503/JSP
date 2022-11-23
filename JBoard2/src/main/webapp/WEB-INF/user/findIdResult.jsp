<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<main id="user">
    <section class="find findIdResult">
        <form action="#">
            <table border="0">
                <caption>아이디 찾기 결과</caption>
                <tr>
                    <td>이름</td>
                    <td>${sessUserForFindId.name}</td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>${sessUserForFindId.uid}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${sessUserForFindId.email}</td>
                </tr>
                <tr>
                    <td>가입일</td>
                    <td>${sessUserForFindId.rdate}</td>
                </tr>
            </table>                                        
        </form>
        
        <p>
            고객님의 정보와 일치하는 아이디 입니다.
        </p>

        <div>
            <a href="/JBoard2/user/login.do" class="btn btnCancel">로그인</a>
            <a href="/JBoard2/user/findPw.do" class="btn btnNext">비밀번호 찾기</a>
        </div>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>