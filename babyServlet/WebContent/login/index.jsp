<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>		
		<title>MVC INDEX</title>
	</head>
	<body bgcolor="white">
	<section>
		<!-- 헤더  -->
		<!-- 
			inline style
			<태그 style="속성1: 속성값; 속성2: 속성값;"
		 -->
		<header style="display: table; /* 표시형태 */
		               width: 100%;/* 너비 */
		               height: 50px;/* 높이 */
		               background: #798fa8;/* 배경색  */
		               color: white;/* 글자색 */
		               text-align: center;/* 글자의 수평위치 */
		               vertical-align: middle; /* 글자의 수직위치 */ ">
			<h1>홈페이지의 기초를 만들어 보자~!</h1>
		</header>
		<!-- 본문  -->
		<section style = "text-align: center; widht:50%;  height:700px " >
			<br>
			<br>
			<br>
			<h2>본문의 제목을 작성해보자~!</h2>
			<div>
				<p>
				<iframe width="854" height="480" src="https://www.youtube.com/embed/dTwj7PhpY9M" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</p>	
			</div>
			
			<br>
				<a href="/babyServlet/login/login.jsp" >로그인</a>
				<a href="/babyServlet/login/member.jsp">회원가입</a>
			<br>
			
		</section>
		<!-- 푸터  -->
		<footer style="display: table;
		               width: 100%;
		               height: 40px;
		               background: #798fa8;
		               color: white;
		               text-align: center;
		               vertical-align: middle;">
			<h3>여기까지 수고하셨습니다.</h3>
		</footer> 
	</section>			
	</body>
</html>