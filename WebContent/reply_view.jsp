<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
    <title>obf.dev</title>

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
					<h1>Community</h1>

				</div>
			</section>



<form action="reply.do" method="post">
	<table width="1300" cellpadding="0" cellspacing="0" border="1" align = "center">
		
		
		
			<input type="hidden" name="bId" value="${reply_view.bId}">
			<input type="hidden" name="bGroup" value="${reply_view.bGroup}">
			<input type="hidden" name="bStep" value="${reply_view.bStep}">
			<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
			
			
			<tr>
				<td align = "center"> 번호 </td>
				<td> ${reply_view.bId} </td>
			</tr>
			
			
			<tr>
				<td align = "center"> 조회수 </td>
				<td> ${reply_view.bHit} </td>
			</tr>
			
			
			<tr>
				<td align = "center"> 이름 </td>
				<td> <input type="text" name="bName" value="${reply_view.bName}"  style="width:1225px;"></td>
			</tr>
			
			
			<tr>
				<td align = "center"> 제목 </td>
				<td> <input type="text" name="bTitle" value="${reply_view.bTitle}"  style="width:1225px;"></td>
			</tr>
			
			
			<tr>
				<td align = "center"> 내용 </td>
				<td> <textarea rows="10"  name="bContent" style="width:1225px;">${reply_view.bContent}</textarea></td>
			</tr>
			
			
			
			
		
	</table>
	<div align="center">
	<input type="submit" value="답변"> 
	<button type="button" onclick="location.href='list.do'">목록으로</button>
	</div>
	
	</form>
	
</body>
</html>