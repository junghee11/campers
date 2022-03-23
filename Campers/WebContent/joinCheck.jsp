<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.javalec.*" %>
<%@ page import = "com.javalec.ex.dao.myDao" %>

<jsp:useBean id="dto" class="com.javalec.ex.dto.memberDto" />
<jsp:setProperty name="dto" property="*" />
<%
	dto.setDate(new Timestamp(System.currentTimeMillis()));
	myDao dao = myDao.getInstance();
	int result = dao.joinCheck(dto.getId());
	
	if(result == 1) {
%>
<script>
	alert("이미 사용중인 아이디입니다.")
	history.back()
</script>
<% } else { 
	int one = dao.insertMember(dto);		
	if(one == 1) {
		
		session.setAttribute("id", dto.getId());
	%>
<script>
	alert("Campers 회원이 되신것을 환영합니다!n\로그인페이지로 이동합니다.")
	location.href = "login.jsp"
</script>
		<%
		} else {
			
			%>
			
			<script>
				alert("회원가입실패!")
				location.href="join.jsp"
			</script>
			
			<%
		}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

</body>
</html>