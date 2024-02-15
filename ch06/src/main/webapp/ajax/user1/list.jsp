<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user1</title>
		<!-- 
			날짜 : 2024/02/15
			이름 : 김철학
			내용 : JSP AJAX 실습하기
		-->
		<script>
			
			window.onload = function(){
				// 사용자 목록
				const table = document.getElementsByTagName('table')[0];
				
				fetch('./proc/getUser1s.jsp')
					.then(response => response.json())
					.then((data)=>{
						
						for(const user of data){
							console.log(user);
							
							const tr = document.createElement('tr');
							const td1 = document.createElement('td');
							const td2 = document.createElement('td');
							const td3 = document.createElement('td');
							const td4 = document.createElement('td');
							const td5 = document.createElement('td');
							const td6 = document.createElement('td');
							const a1 = document.createElement('a');
							const a2 = document.createElement('a');
							
							td1.innerText = user.uid;
							td2.innerText = user.name;
							td3.innerText = user.birth;
							td4.innerText = user.hp;
							td5.innerText = user.age;
							a1.href = './modify.jsp?uid='+user.uid;
							a1.innerText = '수정';							
							a2.href = './delete.jsp?uid='+user.uid;
							a2.innerText = '삭제';
							a2.onclick = function(e){
								e.preventDefault();
								
								const parent = e.target.closest('tr');
								const url = this.href;
								const params = url.split('?')[1];
								const value = params.split('=')[1];
								console.log(value);
								
								fetch('./proc/deleteUser1.jsp?uid='+value)
									.then(response=>response.json())
									.then((data)=>{
										console.log(data);
										
										if(data.result > 0){
											
											alert('삭제완료');
											
											// 태그 동적 삭제
											parent.remove();											
										}
										
									})
									.catch((err)=>{
										console.log(err);
									});
								
								
								
							}
							
							
							td6.appendChild(a1);
							td6.appendChild(a2);							
							
							tr.appendChild(td1);
							tr.appendChild(td2);
							tr.appendChild(td3);
							tr.appendChild(td4);
							tr.appendChild(td5);
							tr.appendChild(td6);
							
							table.appendChild(tr);							
						}
					})
					.catch((err) => {
						console.log(err);
					});
			}
		</script>
	</head>
	<body>
		<h3>user1 목록</h3>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>휴대폰</th>				
				<th>나이</th>				
				<th>관리</th>
			</tr>
		</table>
		
	</body>
</html>




