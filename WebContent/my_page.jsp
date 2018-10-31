<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
    <title>obf.dev</title>
<script type="text/javascript" language="javascript">

// form 액션에서 함수 호출
function validate() {
  if(idValidate()&&pw1Validate()&&pw2Validate()&&mailValidate()&&homeAddressValidate()&&juminValidate()&&checkValidate()&&textValidate()){
    return true;
  }
  else{
    return false;

  }
}
// id 유효성검사
function idValidate(){
  var idCheck =/^[a-zA-Z0-9]{4,12}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
  var objId = document.getElementById("userID");
  var idOK = idCheck.exec(objId.value);
  if(idOK){
    return true;
  }else{
	 alert("ID 형식이 틀립니다.");
     return false;
  }
}
// 비번 유효성검사
function pw1Validate(){
  var pwCheck =/^[a-zA-Z0-9]{4,12}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
  var objPw1 = document.getElementById("passwd1");
  var objId = document.getElementById("userID");
  var pw1OK = pwCheck.exec(objPw1.value);
  if(pw1OK&&objId.value!=objPw1.value){
    return true;
  }else{
    alert("Passwd 형식이 틀립니다.");
    return false;
  }
}
// 비번 유효성검사
function pw2Validate(){
  var pwCheck =/^[a-zA-Z0-9]{4,12}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
  var objPw1 = document.getElementById("passwd1");
  var objPw2 = document.getElementById("passwd2");
  var pw2OK = pwCheck.exec(objPw2.value);
  if(pw2OK&&objPw1.value==objPw2.value){
    return true;
  }else{
    alert("Passwd 형식이 틀립니다.");
    return false;
  }
}
// 이메일 유효성검사
function mailValidate(){
  var mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  var objMail = document.getElementById("email");
  var mailOK = mailCheck.exec(objMail.value);
  if(mailOK){
    return true;
  }else{
    alert("이메일 형식이 틀립니다.");
    return false;
  }
}
// 집주소 유효성검사
function homeAddressValidate(){
  var homeAddressCheck =/^[a-zA-Z0-9가-힣\s]{4,30}$/;  // 소문자, 대문자, 숫자, 한글 4자리에서~30자리까지 입력가능
  var objAddress = document.getElementById("address");
  var addressOk = homeAddressCheck.exec(objAddress.value);
  if(addressOk){
    return true;
  }else{
    alert("집주소 형식이 틀립니다.");
    return false;
  }
}

// 주민번호 유효성검사
function juminValidate(){
  var juminArray = new Array(); // 주민번호 담을 어레이
  var juminCheck1 =/^[0-9]{6}$/; // 숫자만 6자리 입력가능
  var juminCheck2 = /^[0-9]{7}$/; // 숫자만 7자리 입력가능
  var objJumin1 = document.getElementById("jumin1");
  var objJumin2 = document.getElementById("jumin2");
  var juminOK1 = juminCheck1.exec(objJumin1.value);
  var juminOK2 = juminCheck2.exec(objJumin2.value);
  // 숫자만 들어왔을때 true로 돌아감
  if(juminOK1&&juminOK2){
    var juminCheck1 = document.getElementById("jumin1");
   	var juminCheck2 = document.getElementById("jumin2");
    // 주민번호 입력한거 배열에 담아주기
    for(var i=0; i< juminCheck1.value.length; i++){
      juminArray[i] = juminCheck1.value.charAt(i);
    }
    for(var i=juminCheck1.value.length; i<juminCheck1.value.length+juminCheck2.value.length; i++){
        juminArray[i] = juminCheck2.value.charAt(i);
    }

    // 주민번호 유효성 계산해주기
    var tempSum=0;
    for(var i=0; i<6 ; i++){
      tempSum += juminArray[i] * (2+i);
    }

    for(var i=0; i<6; i++){
      if(i>=2){
        tempSum += juminArray[i+6] * i;
      }
      else{
        tempSum += juminArray[i+6] * (8+i);
      }
    }
 	alert(tempsum);
    if(((11-(tempSum%11))%10) == juminArray[12]){

      // 생일에 주민번호 입력한 앞 6자리 넣어주기
      var objYear = document.getElementById("year");
      var objMonth = document.getElementById("month");
      var objDay = document.getElementById("day");

      // 년도 설정
      if(juminArray[0]>2){
        objYear.value = "19"+juminArray[0]+juminArray[1];
      }else{
        objYear.value = "20"+juminArray[0]+juminArray[1];
      }
      // 월 설정
      if(juminArray[2]==0){
        objMonth.value = juminArray[3];
      }else{
        objMonth.value = juminArray[2]+juminArray[3];
      }
      // 일 설정
      if(juminArray[4]==0){
        objDay.value = juminArray[5];
      }else{
        objDay.value = juminArray[4]+juminArray[5];
      }

      return true;
    }else{
      alert("올바른 주민번호가 아닙니다.");
      juminArray="";
      return false;
    }
  }else{
    alert("주민등록번호 형식이 틀립니다.");
    return false;
  }
}

function checkValidate(){
  var objGame = document.getElementsByName("game");
  if(join.game[0].checked||join.game[1].checked||join.game[2].checked||join.game[3].checked||join.game[4].checked){
    return true;
  }
  alert("관심사 체크 해주세요!");
  return false;
}

function textValidate(){
  var objText = document.getElementById("textArea");
  if(objText.value==""){
    alert("자기소개 칸 입력해주세요.");
    return false;
  }else{
    return true;
  }
}
</script>
<style type="text/css">
h2{
	color: #00FFBF;
	font-size: 70px;
}
body{
	background-color: #F2F2F2;
}

input, select{
	font-size: 20px;
	height: 50px;
}
td{
  height: 30px;
	text-align: center;
}

#join{
  color:  #00FFBF;
  background-color: black;
  width: inherit;
  height: inherit;
  font-size: 25px;
}

 #jointd{
   color: #00FFBF;
   background-color: black;
   width: 470px;
 }
 button{
	 color:  #00FFBF;
	 background-color: black;
	 width: inherit;
	 height: inherit;
	 font-size: 15px;
 }
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
<%
	String userid = (String)request.getAttribute("bId");
	String passwd = (String)request.getAttribute("bPasswd");
	String name = (String)request.getAttribute("bName");
	String email = (String)request.getAttribute("bEmail");
	String address = (String)request.getAttribute("bAddress");
	String jumin = (String)request.getAttribute("bJumin");
	String birth = (String)request.getAttribute("bBirth");
%>
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
      <span><input type="button" value="sign up" align="right" class="btn btn-default" onclick="location='join.jsp'"></span>
    </div>
<%
	}
%>
    <!-- 페이지 가장 상단 -->
    <header id="header_1" class="header_1" text-align="center">
      <div class="logo" style="background-color:powderblue" ><a href="main_page.jsp" class="a_logo"><span>OBF.DEV</span></a> </div>
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
<div align="center">
<form action="update.do" method="post" onsubmit="return validate();">
        <table width="567" height="500" border="0" cellspacing="0">
						<tr><td style="text-align:left;">아이디</td></tr>
            <tr>
                <td><input type="text" size=52 maxlength="12" name="userID" value="<%=session.getAttribute("login")%>" id="userID" placeholder=" 4~12자의 영문 대소문자와 숫자로만 입력해주세요."></td>
            </tr>
						<tr><td style="text-align:left;">비밀번호</td></tr>
            <tr>
                <td><input type="password" size=52 maxlength="12" name="passwd" id="passwd1" placeholder=" 4~12자의 영문 대소문자와 숫자로만 입력해주세요."></td>
            </tr>
						<tr><td style="text-align:left;">비밀번호 확인</td></tr>
            <tr>
                <td><input type="password" size=52 maxlength="12" id="passwd2" placeholder="비밀번호 입력해주세요."></td>
            </tr>
						<tr><td style="text-align:left;">이메일주소</td></tr>
            <tr>
                <td><input type="text" size=52 maxlength="20" name="email" id="email" placeholder="예)id@domain.com"></td>
            </tr>
						<tr><td style="text-align:left;">이름</td></tr>
            <tr>
                <td><input type="text" size=52 maxlength="12" name="name" id="name" placeholder="이름 입력해주세요."></td>
            </tr>
						<tr>
							<td style="text-align:left;">주소&emsp;<button id="postcodify_search_button">검색</button></td>
						</tr>
            <tr>
	            <!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
    	        <td>
        	    <input type="text" name="address1" class="postcodify_postcode5" value="" size="52"/>
            	<input type="text" name="address2" class="postcodify_address" value="" size="52"/><br />
            	<input type="text" name="address3" class="postcodify_details" value="" size="52" id="address" placeholder="상세주소 입력해주세요."/><br />
            	<input type="text" name="address4" class="postcodify_extra_info" value="" size="52"/><br />
            	</td>
            <!-- jQuery와 Postcodify를 로딩한다 -->
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

            <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
            <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
            
            </tr>
						<tr><td style="text-align:left;">주민등록번호</td></tr>
            <tr>
                <td>
                <input type="text" size="22" maxlength="6" name="jumin1" id="jumin1" > -
                <input type="password" size="23" maxlength="7" name="jumin2" id="jumin2"></td>
            </tr>
						<tr><td style="text-align:left;">생일</td></tr>
            <tr>
                <td><input type="text" size="36" id="year" name="year" >년 <select id="month" name="month">
                        <option vlaue="1" selected>1</option>
                        <option vlaue="2">2</option>
                        <option vlaue="3">3</option>
                        <option vlaue="4">4</option>
                        <option vlaue="5">5</option>
                        <option vlaue="6">6</option>
                        <option vlaue="7">7</option>
                        <option vlaue="8">8</option>
                        <option vlaue="9">9</option>
                        <option vlaue="10">10</option>
                        <option vlaue="11">11</option>
                        <option vlaue="12">12</option>
                </select>월 <select id="day" name="day" >
                        <option vlaue="1" selected>1</option>
                        <option vlaue="2">2</option>
                        <option vlaue="3">3</option>
                        <option vlaue="4">4</option>
                        <option vlaue="5">5</option>
                        <option vlaue="6">6</option>
                        <option vlaue="7">7</option>
                        <option vlaue="8">8</option>
                        <option vlaue="9">9</option>
                        <option vlaue="10">10</option>
                        <option vlaue="11">11</option>
                        <option vlaue="12">12</option>
                        <option vlaue="13">13</option>
                        <option vlaue="14">14</option>
                        <option vlaue="15">15</option>
                        <option vlaue="16">16</option>
                        <option vlaue="17">17</option>
                        <option vlaue="18">18</option>
                        <option vlaue="19">19</option>
                        <option vlaue="20">20</option>
                        <option vlaue="21">21</option>
                        <option vlaue="22">22</option>
                        <option vlaue="23">23</option>
                        <option vlaue="24">24</option>
                        <option vlaue="25">25</option>
                        <option vlaue="26">26</option>
                        <option vlaue="27">27</option>
                        <option vlaue="28">28</option>
                        <option vlaue="29">29</option>
                        <option vlaue="30">30</option>
                        <option vlaue="31">31</option>
                </select>일</td>
            </tr>

        </table>
				<br>
        <p align="center" style="width: 567px; height: 80px;">
            <input type="submit" value="수정" align=center id="join">
        </p>
				<br>
				<br>
				<br>
				<br>
</form>
</div>

</body>
</html>