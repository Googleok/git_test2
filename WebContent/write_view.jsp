<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
    <title>obf.dev</title>

<script type="text/javascript">

	function validate(){
		if(nameValidate()&&titleValidate()){
		    return true;
		  }
		  else{
		    return false;
		  }
		
	}
	
	// name 유효성검사
	function nameValidate(){
	  var nameCheck =/^[a-zA-Z0-9가-힣]{4,12}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
	  var objName = document.getElementById("bName");
	  var nameOK = nameCheck.exec(objName.value);
	  if(nameOK){
	    return true;
	  }else{
		 alert("작성자를 기입해주십시오.");
	     return false;
	  }
	}

	// title 유효성검사
	function titleValidate(){
	  var titleCheck =/^[a-zA-Z0-9가-힣~!@#$%^&*()-_=+\|[]{};:,.<>/? ] {4,50}$/;  // 소문자, 대문자, 숫자 4~12자리까지 입력가능
	  var objTitle = document.getElementById("bTitle");
	  var titleOK = titleCheck.exec(objTitle.value);
	  if(titleOK){
	    return true;
	  }else{
		 alert("제목을 기입해주십시오.");
	     return false;
	  }
	}
	
	// content 유효성검사
	function contentValidate(){
	  var contentCheck =/^[a-zA-Z0-9가-힣]{4,1000}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
	  var objContent = document.getElementById("bContent");
	  var contentOK = contentCheck.exec(objContent.value);
	  if(contentOK){
	    return true;
	  }else{
		 alert("내용을 입력해주십시오.");
	     return false;
	  }
	}

</script>

   <style>

      /* 바디 */
      body{
        margin-left: 200px;
        margin-right: 200px;
        background-color: #F2F2F2;

      }

      /* 가입 버튼과 로그인 버튼 */
      .top_label{
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: right;
      }


      /* 네비게이션 바 */
      .nav-bar{
        display: flex;
        flex-direction: row;
        width: 100%;
        margin: 0;
        padding: 0;
        background-color: darkslategrey;
        list-style-type: none;
    }

    /* 네비게이션 바 요소 */
    .nav-item{
      padding: 15px;
      cursor: pointer;
    }

    /* 링크 */
    .nav-item a{
      text-align: center;
      text-decoration: none;
      font-size: 20px;
      color: white;
    }

    /* 로고 위치 */
    .logo{
      padding: 60px 5px;
    }

    .header_1 div{
      height: 55px;
    }

    /* 로고 링크 */
    .a_logo{
      text-decoration: none;
      padding: 15px 25px;
      font-family: 'Alfa Slab One', cursive;
      font-weight: lighter;
      font-size: 50px;
      color: black;

    }



    .box {
  		margin-bottom: 2rem;
  		background: #FFF;
  	}

  		.box .content {
  			padding: 3rem;
  		}

      .content p{
        text-align: center;
        font-family: fantasy;
        font-size: 30px;
      }

    .align-center{
      text-align: center;
    }

    .align-center h2{
      font-family: fantasy;
      font-size: 70px;
    }

    .align-center p{
      font-family: fantasy;
      font-size: 50px;
    }

    .blockquote_1{
      margin: 40px;

    }

    .blockquote_1 blockquote{
      font-size: 25px;
      font-family: fantasy;
    }

    #blockquote_p{
      text-align: center;
      font-size: 50px;
    }

    .image {
      border: 0;
      display: inline-block;
      position: relative;
    }
    .image.fit {
			display: block;
			margin: 0 0 2rem 0;
			width: 100%;
		}

			.image.fit img {
				width: 100%;
			}


    .section_1{
      position: relative;
    }

    .section_2{
      background-image: url(bg.jpg);
      background-color: #000;
			color: #bfbfbf;
			background-size: cover;
			background-attachment: fixed;
			background-position: center;
			position: relative;

    }

    .sec2_div div{
      padding-bottom: 20px;
      color: white;
      border-style: solid;
			border-color: rgba(255, 255, 255, 0.25);

			text-align: center;
      background-color: rgba( 0, 0, 0, 0.5 );
    }

    .sec2_div a{
      text-align: center;

    }

    .button.alt{
      color: white;
      text-align: center;
      text-decoration: none;

    }


    .actions{
      list-style-type: none;
    }

    .footer_div{
      margin-top: 80px;
      margin-bottom: 80px;
      text-align: center;
    }

    </style>
</head>
<body>
<%
	if(session.getAttribute("login")==null){

%>
  
 	<!--비로그인시 로그인 버튼과 가입 버튼 -->
    <div class="top_label">
      <span><input type="button" value="Login" align="right" class="btn btn-default" onclick="location='login.jsp'"></span>
      <span><input type="button" value="sign up" align="right" class="btn btn-default" onclick="location='join.jsp'"></span>
    </div>
<%
	}else{
%>
	<%=session.getAttribute("login") %>님 환영합니다.
	<!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
    <div class="top_label">
      <span><input type="button" value="Logout" align="right" class="btn btn-default" onclick="location='logout.jsp'"></span>
      <span><input type="button" value="my_Page" align="right" class="btn btn-default" onclick="location='my_page.jsp'"></span>
    </div>
<%
	}
%>
<!-- 페이지 가장 상단 -->
    <header id="header_1" class="header_1" text-align="center">
      <div class="logo" style="background-color:powderblue" ><a href="index.html" class="a_logo"><span>OBF.DEV</span></a> </div>
    </header>



    <!-- 네비게이션 바 -->
     <nav style="background-color:lightgreen">
        <ul id="nav-bar" class="nav-bar">
          <li class="nav-item"><a href="main_page.jsp">HOME</a></li>
          <li class="nav-item"><a href="list.do">Community</a></li>
          <li class="nav-item"><a href="Book.jsp">BOOK</a></li>
          <li class="nav-item"><a href="study_planning.jsp">Study Planning</a></li>
          <li class="nav-item"><a href="java_api.jsp">API</a></li>
          <li class="nav-item"><a href="">Q&A</a></li>
        <ul>
      </nav>





      <!-- 페이지 섹션 -->
      <section id="section_1" style="background-color:orange">
				<div class="inner" >
					<h1>Community - Create new post</h1>

				</div>
			</section>


<form action="write.do" method="post" onsubmit="return validate();">

	<table width="1300" cellpadding="0" cellspacing="0" border="1" align = "center">
		
		
			<tr>
				<td align="center"> 작성자 </td>
				<td> <input type="text" name="bName" size = "50" style="width:1225px;" value="<%=session.getAttribute("login") %>" id="bName" > </td>
			</tr>
			
			<tr>
				<td align="center"> 제목 </td>
				<td> <input type="text" name="bTitle" size = "50" style="width:1225px;" id="bTitle"> </td>
			</tr>
			
			
			<tr>
				<td align="center"> 내용 </td>
				<td> <textarea name="bContent" rows="20" style="width:1225px;" id="bContent">
				</textarea> </td>
			</tr>
			
			
			
		
	</table>
	
		<div align = "center">
		<input type="submit" value="작성 완료"> &nbsp;&nbsp;
		<button type="button" onclick="location.href='list.do'">목록으로</button>
		</div>
		
	</form>
	
	
				<form method="post" enctype="multipart/form-data" action="imgup.jsp">
				<input type="file" name="filename1" size=40>
				<input type="submit" value="업로드">
				</form>
	
	
</body>
</html>