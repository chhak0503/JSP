<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="write">
        <form action="/jboard2/write.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="writer" value="${sessUser.uid}" />
            <table border="0">
                <caption>글쓰기</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                    	<p style="margin-bottom:6px;color:grey;">최대 2개 파일 첨부 가능</p>
                        <input type="file" name="fname" multiple="multiple" pl/><br>
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="/jboard2/list.do" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>
<%@ include file="./_footer.jsp" %>