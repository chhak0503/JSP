/**
 * 등록하기 화면
 */
 
function register(){
	
	$(function(){
		
		$('nav').empty();
		$('#content').empty();
		
		$('nav').append("<h4>user2 등록</h4>");
		$('nav').append("<a href='#' class='list'>user2 목록</a>");
		
		let tags  = "<table border='1'>";
		    tags += "<tr>";
		    tags += "<td>아이디</td>";
		    tags += "<td><input type='text' name='uid' placeholder='아이디 입력'/></td>";
		    tags += "</tr>";
		    tags += "<tr>";
		    tags += "<td>이름</td>";
		    tags += "<td><input type='text' name='name' placeholder='이름 입력'/></td>";
		    tags += "</tr>";
		    tags += "<tr>";
		    tags += "<td>휴대폰</td>";
		    tags += "<td><input type='text' name='hp' placeholder='휴대폰 입력'/></td>";
		    tags += "</tr>";
		    tags += "<tr>";
		    tags += "<td>나이</td>";
		    tags += "<td><input type='text' name='age' placeholder='나이 입력'/></td>";
		    tags += "</tr>";
		    tags += "<tr>";					    
		    tags += "<td colspan='2' align='right'><input type='submit' value='등록'/></td>";
		    tags += "</tr>";
		    tags += "</table>";
		
		$('#content').append(tags);
		
		
	});
	
}