<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="kor" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
    <title>obf.dev</title>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("login.jsp");
	}else{
%>
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
  	<%=session.getAttribute("login")%>님 환영합니다.
  
 	<!-- 로그인 버튼과 가입 버튼 -->
    <div class="top_label">
      <span><input type="button" value="Logout" align="right" class="btn btn-default" onclick="location='logout.jsp'"></span>
      <span><input type="button" value="sign up" align="right" class="btn btn-default" onclick="location='join.jsp'"></span>
    </div>

    <!-- 페이지 가장 상단 -->
    <header id="header_1" class="header_1" text-align="center">
      <div class="logo" style="background-color:powderblue" ><a href="main_page_login.jsp" class="a_logo"><span>OBF.DEV</span></a> </div>
    </header>

    <!-- 네비게이션 바 -->
      <nav style="background-color:lightgreen">
        <ul id="nav-bar" class="nav-bar">
          <li class="nav-item"><a href="main_page_login.jsp">HOME</a></li>
          <li class="nav-item"><a href="list.do">Community</a></li>
          <li class="nav-item"><a href="Book.jsp">BOOK</a></li>
          <li class="nav-item"><a href="">Study Planning</a></li>
          <li class="nav-item"><a href="">API</a></li>
          <li class="nav-item"><a href="">Q&A</a></li>
        <ul>
      </nav>

 	<!-- section_1 -->
      <section class="section_1">

						<div class="box">
              <div class="image fit">
								<img src="images/pic01.jpg" alt="" />
							</div>

							<div class="content">
								<header class="align-center">
									<h2>" What is this? "</h2>
									<p>this app provides the fastest way you can be powerful developer  </p>
								</header>
								<hr />

								<p> This Web App is developed for person who want to be developer like you!</p>
                <div class="blockquote_1">
								          <blockquote>
                            <p id="blockquote_p">What you can do</p> </BR>
									           <BIG><BIG>First.</BIG></BIG> You can make a plan in [Study Planning] menu. You can always see the schedule you planned on your computer.</BR>
									           <BIG><BIG>Second.</BIG></BIG> You can ask questions and get feedback on you knowledge through bulletin boards or chat.</br>
									           <BIG><BIG>Third.</BIG></BIG> Many people will help you study in a variety ways like recommending books, answer your questions.
                          </blockquote>
                </div>

							</div>
						</div>

			</section>


      <!-- section_2 -->
			<section class="section_2">
				<div class="inner">
					<div class="sec2_div">

						<div class="sec2_items">
							<header>
								<h3>Recent Post</h3>
							</header>
							<p>
								1. 프로그래밍 공부하려고 하는데 처음에 어떤 언어가 좋을까요? </br>
								2. Web관련 3주 프로젝트로 뭐할지 고민인데 아이디어 좀...
							</p>

								<a href="#" class="button alt">More</a>

						</div>


						<div class="sec2_items">
							<header>
								<h3>Recent Recommended Book</h3>
							</header>
							<p>
								1. 이것이 자바다(신용권) - Basic and Bible</br>
                2. efective Java - Advenced level
							</p>
							<a href="#" class="button alt">More</a>
						</div>


						<div class="sec2_items">
							<header>
								<h3>recent notice</h3>
							</header>
							<p>
								new. 저희 사이트를 많이 이용해 주세요~
							</p>
							<a href="#" class="button alt">More</a>
						</div>


					</div>
				</div>
			</section>


      <!-- footer -->
      <footer class="footer">
        <h2></h2>
        <div class="footer_div">
          <p>©obf.dev.All rights reserved</p>
          <p>developed by Sung uk Park, Eung yeon Lee, Jong won Lee, Jong uk Park</p>
        </div>
      </footer>

	
	<%
	}
	%>
  </body>

</html>