<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate  = request.getParameter("cate");
%>
<div id="sub">
    <div><img src="../img/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="cate3">
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="<%= cate.equals("story") ? "on" : "off" %>"><a href="./list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
                <li class="<%= cate.equals("grow") ? "on" : "off" %>"><a href="./list.jsp?group=croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="<%= cate.equals("school") ? "on" : "off" %>"><a href="./list.jsp?group=croptalk&cate=school">귀농학교</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_<%= cate %>.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > 
                    <% if(cate.equals("story")){ %>
                    	<em>농작물이야기</em>
                    <% }else if(cate.equals("grow")){ %>
                    	<em>텃밭가꾸기</em>
                    <% }else if(cate.equals("school")){ %>
                    	<em>귀농학교</em>
                    <% } %>
                </p>
            </nav>
            
            