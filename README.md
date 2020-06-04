# 프로젝트명 : **Java Model1 web application**
> Model2 pattern을 기반으로 한 web 응용 프로그램 만들기

## 1.요건정리
> - 목적 :  예상 이용자 100명 내외를 대상으로한 웹 게시판 구축
> - 구조 :  MODEL2 - MVC pattern을 기반
> - 기능 : 사용자 CRUD(입력, 수정, 삭제, 전체조회, 검색, like검색) 및 게시글 CRUD(입력, 수정, 삭제, 조회)
		비밀번호 
> - 제작 기간 : 36시간

테이블 정의서
 
> 1. 회원정보 테이블
컬럼ID		|	데이터 타입(크기)		|	컬럼명
----- 		|	--------		|	---
LMEM		|	VARCHAR2(13 BYTE)	|	회원번호	
LNAME		|	VARCHAR2(20 BYTE)	|	성명	
LID		|	VARCHAR2(20 BYTE)	|	아이디	
LPW		|	VARCHAR2(20 BYTE)	|	비밀번호	
LHP		|	VARCHAR2(20 BYTE)	|	전화번호	
LBIRTH		|	VARCHAR2(8 BYTE)	|	생년월일	
LEMAIL		|	VARCHAR2(20 BYTE)	|	이메일	
LPOSTNO		|	VARCHAR2(5 BYTE)	|	우편번호	
LLOADADDR	|	VARCHAR2(300 BYTE)	|	도로명주소	
LADDR		|	VARCHAR2(300 BYTE)	|	상세주소	
LPHOTO		|	VARCHAR2(500 BYTE)	|	사진	
LDELETEYN	|	VARCHAR2(1 BYTE)	|	삭제유무	
LINSERTDATE	|	DATE			|	생성일	
LUPDATEDATE	|	DATE			|	수정일	
						
> 2. 게시글 정보 테이블 						
						
컬럼ID		|	데이터 타입(크기)		|	컬럼명
----- 		|	--------		|	---
LNO		|	VARCHAR2(10 BYTE)	|	글번호	
LSUBJECT	|	VARCHAR2(1000 BYTE)	|	글제목	
LNAME		|	VARCHAR2(300 BYTE)	|	작성자	
LPW		|	VARCHAR2(400 BYTE)	|	비밀번호	
LMEMO		|	VARCHAR2(4000 BYTE)	|	글내용	
LPHOTO		|	VARCHAR2(500 BYTE)	|	사진	
LDELETEYN	|	VARCHAR2(1 BYTE)	|	삭제유무	
LINSERTDATE	|	DATE			|	생성일
LUPDATEDATE	|	DATE			|	수정일



## 2. 개발환경 : Eclipse Neon3, jdk 1.8, oracle 11g R2, apach-tomcat 8.0, window10, HMTL5, jsp, cos 20.0, Daum Open API, Servlet 3.1, jQuery
