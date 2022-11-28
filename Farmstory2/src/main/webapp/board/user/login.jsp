<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
        </header>
        <main id="user">
            <section class="login">
                <form action="../list.html">
                    <table border="0">
                        <tr>
                            <td><img src="../img/login_ico_id.png" alt="아이디"/></td>
                            <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
                        </tr>
                        <tr>
                            <td><img src="../img/login_ico_pw.png" alt="비밀번호"/></td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin"/>
                    <label><input type="checkbox" name="saveUid">아이디 기억하기</label>
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <div style="text-align: right;">
                        <a href="./findId.html">아이디 |</a>
                        <a href="./findPw.html">비밀번호찾기 |</a>
                        <a href="./terms.html">회원가입</a>
                    </div>                    
                </div>
            </section>
        </main>
        <footer>
            <p>ⓒCopyright chhak.or.kr</p>
        </footer>
    </div>    
</body>
</html>