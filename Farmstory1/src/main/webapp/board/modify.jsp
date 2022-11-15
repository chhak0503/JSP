<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");

	pageContext.include("./_"+group+".jsp");
%>
        <main id="board" class="modify">
            
            <form action="#">
                <table border="0">
                    <caption>글수정</caption>
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
                        <td><input type="file" name="file"/></td>
                    </tr>
                </table>

                <div>
                    <a href="./view.jsp?group=<%= group %>&cate=<%= cate %>" class="btn btnCancel">취소</a>
                    <input type="submit" value="수정완료" class="btn btnComplete"/>
                </div>
            </form>
        </main>
		</article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>