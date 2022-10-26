<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<main id="board" class="write">
    <form action="/JBoard1/proc/writeProc.jsp" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="uid" value="<%= sessUser.getUid() %>"/>
        <table border="0">
            <caption>글쓰기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content"></textarea></td>
            </tr>
            <tr>
                <th>파일</th>
                <td><input type="file" name="fname"/></td>
            </tr>
        </table>

        <div>
            <a href="./list.jsp" class="btn btnCancel">취소</a>
            <input type="submit" value="작성완료" class="btn btnComplete"/>
        </div>
    </form>
</main>
<%@ include file="./_footer.jsp" %>