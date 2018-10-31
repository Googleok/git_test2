<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.ex.dao.BDao" %>
<%@page import="com.javalec.ex.dto.BDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Console console;
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

	int pageSize = 10; // 한 페이지에 출력할 레코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int count = 0;
	
	BDao dao = new BDao();
	count = dao.getCount(); // 데이터베이스에 저장된 총 갯수

	ArrayList<BDto> list = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		list = dao.getList(startRow, endRow);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<body>

	<center>
		<h3>게시판 목록</h3>
		(총 레코드 수 : <%=count %>)
		<table border="1" width="900">
			<tr>
				<td width="10%">번호</td>
				<td width="15%">이름</td>
				<td width="30%">제목</td>
				<td width="20%">작성일</td>
				<td width="10%">조회수</td>
				<td width="15%">ip</td>
			</tr>
			<%
				if (count > 0) { // 데이터베이스에 데이터가 있으면
					int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
					for (int i = 0; i < list.size(); i++) {
						BDto board = list.get(i); // 반환된 list에 담긴 참조값 할당
			%>
			<tr>
				<td><%=number--%></td>
				<td><%=board.getbName()%></td>
				<td>
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%> 
					<a href="content_view.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>"><%=board.getbTitle()%></a>
				</td>
				<td><%=df.format(board.getbDate())%></td>
				<td><%=board.getbHit()%></td>
				<td><%=board.getbIndent()%></td>
			</tr>
			<%
					}
				} else { // 데이터가 없으면
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
				<%
					}
				%>
			<tr>
				<td colspan="6" align="right">
					<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%>
					<input type="button" value="글작성"
					onclick="location.href='write_view.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="list2.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="list2.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="list2.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
