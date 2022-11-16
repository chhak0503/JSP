<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<main id="user" class="login">
    <form action="/Farmstory1/user/proc/loginProc.jsp" method="post">
        <table border="0">
            <tr>
                <td><img src="./img/login_ico_id.png" alt="로그인"/></td>
                <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
            </tr>
            <tr>
                <td><img src="./img/login_ico_pw.png" alt="비밀번호"/></td>
                <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
            </tr>
        </table>
        <input type="submit" class="btnLogin" value="로그인"/>
    </form>

    <div class="info">
        <h3>회원 로그인 안내</h3>
        <p>
            아직 회원이 아니시면 회원으로 가입하세요.
        </p>
        <a href="./terms.jsp">회원가입</a>
    </div>
</main>
<%@ include file="../_footer.jsp" %>