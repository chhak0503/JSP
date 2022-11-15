<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>    
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                <span class="nick">길동이</span>님 반갑습니다.
                <a href="#" class="logout">[로그아웃]</a>
            </p>
        </header>

        <main id="board" class="view">
            
            <table>
                <caption>글보기</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="제목입니다." readonly/></td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td><a href="#">2020년 상반기 매출자료.xls</a><span>7</span>회 다운로드</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" readonly>내용 샘플입니다.</textarea></td>
                </tr>
            </table>

            <div>
                <a href="#" class="btn btnRemove">삭제</a>
                <a href="./modify.html" class="btn btnModify">수정</a>
                <a href="./list.html" class="btn btnList">목록</a>
            </div>

            <!-- 댓글목록 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <article>
                    <span class="nick">길동이</span>
                    <span class="date">20-05-13</span>                    
                    <p class="content">댓글 샘플입니다.</p>
                    <div>
                        <a href="#" class="remove">삭제</a>
                        <a href="#" class="modify">수정</a>
                    </div>
                </article>                
                <p class="empty">등록된 댓글이 없습니다.</p>
            </section>

            <!-- 댓글쓰기 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="#">
                    <textarea name="content" placeholder="댓글내용 입력"></textarea>
                    <div>
                        <a href="#" class="btn btnCancel">취소</a>
                        <input type="submit" class="btn btnComplete" value="작성완료"/>
                    </div>
                </form>
            </section>
        </main>

        <footer>
            <p>ⓒCopyleft by chhak.or.kr</p>
        </footer>    
    </div>
</body>
</html>