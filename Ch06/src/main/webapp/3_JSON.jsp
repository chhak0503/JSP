<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_JSON</title>
		<!-- 
			날짜 : 2022/10/20
			이름 : 김철학
			내용 : JSP JSON 실습하기
		-->		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		
			$(function(){
				
				$('button:eq(0)').click(function(){
					
					$.ajax({
						url: './data/json1.jsp',
						method: 'get',
						dataType: 'json',
						success: function(data){
							console.log(data);
							
							$('p > span:eq(0)').text(data.uid);
	                        $('p > span:eq(1)').text(data.name);
	                        $('p > span:eq(2)').text(data.hp);
	                        $('p > span:eq(3)').text(data.age);							
						}
					});
	
				});
				
				$('button:eq(1)').click(function(){
					
					$.ajax({
						url: './data/json2.jsp',
						method: 'get',
						dataType: 'json',
						success: function(data){
							console.log(data);
							
							for(let user of data){
								
								let tags  = "<tr>";
									tags += "<td>"+user.uid+"</td>";
									tags += "<td>"+user.name+"</td>";
									tags += "<td>"+user.hp+"</td>";
									tags += "<td>"+user.age+"</td>";						
									tags += "</tr>";
								
								$('table').append(tags);								
							}
						}
					});
				});				
				
			});
		</script>
		
	</head>
	<body>
		<h3>JSON 실습하기</h3>
		
		<a href="./data/json1.jsp">JSON 출력하기</a>
		<a href="./data/json2.jsp">JSON Array 출력하기</a>
		
		<h4>AJAX 실습하기</h4>
		<button>데이터 요청하기</button>
		<p>
			아이디 : <span></span><br/>
			이름 : <span></span><br/>
			휴대폰 : <span></span><br/>
			나이 : <span></span><br/>
		</p>
		
		<button>데이터 요청하기</button>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
			</tr>
		</table>
		
		
	</body>
</html>