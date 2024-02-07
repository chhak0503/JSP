<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<main>
    <section class="write">
        <h3>글쓰기</h3>
        <article>
            <form action="/jboard1/proc/writeProc.jsp" method="post">
            
            	<!-- 추가 전송을 위해 hidden 필드 사용 -->
            	<input type="hidden" name="writer" readonly="readonly" value="<%= sessUser.getUid() %>">
            	
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content"></textarea>                                
                        </td>
                    </tr>
                    <tr>
                        <td>첨부</td>
                        <td><input type="file" name="file"/></td>
                    </tr>
                </table>
                <div>
                    <a href="/jboard1/list.jsp" class="btnCancel">취소</a>
                    <input type="submit"  class="btnWrite" value="작성완료">
                </div>
            </form>
        </article>
    </section>
</main>
<%@ include file="./_footer.jsp" %>