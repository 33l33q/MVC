# ������Ʈ�� : **Java Model1 web application**
> Model2 pattern�� ������� �� web ���� ���α׷� �����

## 1.�������
> - ���� :  ���� �̿��� 100�� ���ܸ� ��������� �� �Խ��� ����
> - ���� :  MODEL2 - MVC pattern�� ���
> - ��� : ����� CRUD(�Է�, ����, ����, ��ü��ȸ, �˻�, like�˻�) �� �Խñ� CRUD(�Է�, ����, ����, ��ȸ)
		��й�ȣ 
> - ���� �Ⱓ : 36�ð�

���̺� ���Ǽ�
 
> 1. ȸ������ ���̺�
�÷�ID		|	������ Ÿ��(ũ��)		|	�÷���
----- 		|	--------		|	---
LMEM		|	VARCHAR2(13 BYTE)	|	ȸ����ȣ	
LNAME		|	VARCHAR2(20 BYTE)	|	����	
LID		|	VARCHAR2(20 BYTE)	|	���̵�	
LPW		|	VARCHAR2(20 BYTE)	|	��й�ȣ	
LHP		|	VARCHAR2(20 BYTE)	|	��ȭ��ȣ	
LBIRTH		|	VARCHAR2(8 BYTE)	|	�������	
LEMAIL		|	VARCHAR2(20 BYTE)	|	�̸���	
LPOSTNO		|	VARCHAR2(5 BYTE)	|	�����ȣ	
LLOADADDR	|	VARCHAR2(300 BYTE)	|	���θ��ּ�	
LADDR		|	VARCHAR2(300 BYTE)	|	���ּ�	
LPHOTO		|	VARCHAR2(500 BYTE)	|	����	
LDELETEYN	|	VARCHAR2(1 BYTE)	|	��������	
LINSERTDATE	|	DATE			|	������	
LUPDATEDATE	|	DATE			|	������	
						
> 2. �Խñ� ���� ���̺� 						
						
�÷�ID		|	������ Ÿ��(ũ��)		|	�÷���
----- 		|	--------		|	---
LNO		|	VARCHAR2(10 BYTE)	|	�۹�ȣ	
LSUBJECT	|	VARCHAR2(1000 BYTE)	|	������	
LNAME		|	VARCHAR2(300 BYTE)	|	�ۼ���	
LPW		|	VARCHAR2(400 BYTE)	|	��й�ȣ	
LMEMO		|	VARCHAR2(4000 BYTE)	|	�۳���	
LPHOTO		|	VARCHAR2(500 BYTE)	|	����	
LDELETEYN	|	VARCHAR2(1 BYTE)	|	��������	
LINSERTDATE	|	DATE			|	������
LUPDATEDATE	|	DATE			|	������



## 2. ����ȯ�� : Eclipse Neon3, jdk 1.8, oracle 11g R2, apach-tomcat 8.0, window10, HMTL5, jsp, cos 20.0, Daum Open API, Servlet 3.1, jQuery
