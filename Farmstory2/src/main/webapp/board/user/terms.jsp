<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main id="user">
            <section class="terms">
                <table border="1">
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea name="terms">약관내용</textarea>
                            <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>

                <table border="1">
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea name="privacy">약관내용</textarea>
                            <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>
                
                <div>
                    <a href="./login.html" class="btn btnCancel">취소</a>
                    <a href="./register.html" class="btn btnNext">다음</a>
                </div>

            </section>
        </main>
        <footer>
            <p>ⓒCopyright chhak.or.kr</p>
        </footer>
    </div>    
</body>
</html>