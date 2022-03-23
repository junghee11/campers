<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.ex.*" %>
<%@ page import="com.javalec.ex.dao.myDao" %>
<%@ page import="com.javalec.ex.dto.memberDto" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	myDao dao = myDao.getInstance();
	int checkNum = dao.loginCheck(id, pw);
	if(checkNum == -1) {
		%>
		
		<script>
			alert("아이디가 존재하지 않습니다.")
			history.go(-1)
		</script>
	<%} else if(checkNum == 0) {%>
    	<script>
    	alert("비밀번호가 틀립니다.")
    	history.go(-1) 
    	
    	</script>
	<%
	} else if(checkNum == 1){
		memberDto dto = dao.getMember(id);
		if(dto == null) {
		%>
		<script>
			alert("존재하지 않는 회원입니다.")
			history.go(-1)
		</script>
		<%	} else {
			%>
			<script>
				alert("로그인성공")
				
			</script>
			<%
			String name = dto.getName();
    		session.setAttribute("id", id);
    		session.setAttribute("name", name);
    		session.setAttribute("ValidMem", "yes");
    		response.sendRedirect("login.jsp");
		}
	} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

</body>
</html>