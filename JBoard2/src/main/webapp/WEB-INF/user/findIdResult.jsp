<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
        <main id="user">
            <section class="find findIdResult">
                <form action="#">
                    <table border="0">
                        <caption>아이디 찾기 결과</caption>
                        <tr>
                            <td>이름</td>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td>honggildong</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>honggildong@gmail.com</td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td>2022-11-16 10:20</td>
                        </tr>
                    </table>                                        
                </form>
                
                <p>
                    고객님의 정보와 일치하는 아이디 입니다.
                </p>

                <div>
                    <a href="./login.html" class="btn btnCancel">로그인</a>
                    <a href="./register.html" class="btn btnNext">비밀번호 찾기</a>
                </div>
            </section>
        </main>
        <jsp:include page="./_footer.jsp"/>