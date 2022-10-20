<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 관리자</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/list.js"></script>
		<script src="./js/register.js"></script>
		<script>
			$(function(){
				
				// 처음 user 목록 불러오기
				list();
				
				// user 목록보기
				$(document).on('click', '.list', function(e){
					e.preventDefault();
					list();
				});
				
				// user 등록하기
				$(document).on('click', '.register', function(e){
					e.preventDefault();
					register();
				});
				
				// user 등록(submit)
				$(document).on('click', 'input[type=submit]', function(e){
					e.preventDefault();
					// 데이터 가져오기
					let uid  = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp   = $('input[name=hp]').val();
					let age  = $('input[name=age]').val();
					
					// JSON 데이터 생성
					let jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"age":age
					};
					
					console.log(jsonData);
					
					// 데이터 전송
					$.ajax({
						url: './json/register.jsp',
						method: 'post',
						data: jsonData,
						dataType: 'json',
						success: function(data){
							console.log(data);
							
							if(data.result == 1){
								alert('데이터 입력 성공!');
							}else{
								alert('데이터 입력 실패!');
							}
							
						}
					});
					
				});
				
			});
		
		</script>
		
	</head>
	<body>
		<h3>user2 관리자</h3>
		<nav></nav>					
		<div id="content"></div>
	</body>
</html>