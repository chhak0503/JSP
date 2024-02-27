<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>jboard2</title>
    <link rel="stylesheet" href="./css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
            <p>
                <span>${sessionScope.sessUser.nick}</span>님 반갑습니다.
                <a href="/jboard2/user/logout.do">[로그아웃]</a>
            </p>
        </header>