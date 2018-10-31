<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h2{
	color: #00FFBF;
	font-size: 70px;
}

body{
	background-color: #F2F2F2;
}

input{
	font-size: 20px;
	height: 50px;
}
td{
 height: 80px;
}
#login{
  color:  #00FFBF;
  background-color: black;
  width: inherit;
  height: inherit;
  font-size: 25px;
}
 a{
   color :  #00FFBF;
   font-size: 15px;
   text-decoration: none;
 }
 #jointd{
   color: #00FFBF;
   background-color: black;
   width: 470px;
 }
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>OBF.DEV</h2>
	<form name="form1" action="login.do" method="post">
		<table width=300 >
			<tr align=center >
				<td><input type="text" NAME="userid" ID="userid" size="40"  maxlength="20" placeholder="아이디"></td>
			</tr>
			<tr align=center >
				<td><input type="password" name="passwd" ID="passwd" size="40" maxlength=20 placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td width="100%" align="center" >
				<input type="submit" value="Login" id="login"></td>
			</tr>
			<tr >
				<td align="center" id="jointd"  >
        <a href="join.jsp">회원가입 |</a>
        <a href="id_search.jsp">아이디 찾기 |</a>
        <a href="pw_search.jsp">비밀번호 찾기</a>
				</td>
			</tr>
		</table>
	</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<hr>
<h6>OBF.DEV_Copylight designed by Eok</h6>
</div>
</body>
</html>
