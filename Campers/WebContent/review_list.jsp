<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="common.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    
<title>사용후기</title>
</head>
<body>
<header>
        <div id="top-until">
          <div class="container">
            <div id="until-right">
                <ul>
	                <%
	                String id = "";
	                if(session.getAttribute("ValidMem") == null) {
		          	%>
		          
		          	<li><a href="login.jsp">로그인</a></li>
		          <% } else { 
		          	String name =(String)session.getAttribute("name");
		          	id =(String)session.getAttribute("id");
		          	
		          %>
		          	<li><b><%=name %></b>님</li>
		          	<li><a href="logout.do">로그아웃</a></li>
		          <% } %>
                    <li><a href="mypage.do?id=<%=id %>">장바구니</a></li>
                    <li><a href="mypage.do?id=<%=id %>">마이페이지</a></li>
                </ul>
            </div>
          </div>
        </div>
        <div id="main-header">
            <div class="container">
                <div class="row" style="height:60px;">
                    <div id="header-logo" style="width: 200px;">
                        <div class="logo">
                            <a href="index.jsp" alt="logo"><img src="img/logo.png" alt="" class="img-hover-zoom"></a>
                        </div>
                    </div>
                    <!-- width 1280 이하로 가면 없앨것 -->
                    <div class="col" id="header-nav">
                        <ul id="main-nav" >
                            <li class="menu-item" onmouseleave="close_menu()">
                                <b><a href="shop_list.do?category=" id="0" onmouseover="sub_menu()" >SHOP</a></b>
                                <div class="sub-menu">
                                    <div class="sub-menu-inner" style="left:70px; display:none;">
                                      <dl>
                                        <a href="shop_list.do?category=tent"><dd>텐트&타프</dd></a>
                                        <a href="shop_list.do?category=furniture"><dd>테이블&체어</dd></a>
                                        <a href="shop_list.do?category=cook"><dd>조리도구</dd></a>
                                        <a href="shop_list.do?category=sleep"><dd>침낭&매트</dd></a>
                                      </dl>  
                                    </div>
                                </div>
                            </li>
                            <li class="menu-item" onmouseleave="close_menu()">
                                <b><a href="review_list.do" id="1" onmouseover="sub_menu()">REVIEW</a></b>
                                <div class="sub-menu">
                                    <div class="sub-menu-inner" style="left:270px; display:none;">
                                      <dl style="font-size: 14px;">
                                        <a href="review_list.do"><dd>사용후기</dd></a>
                                      </dl> 
                                    </div>
                                </div>
                            </li>
                            <li class="menu-item" onmouseleave="close_menu()">
                                <b><a href="place.html" id="2" onmouseover="sub_menu()">PLACE</a></b>
                                <div class="sub-menu">
                                    <div class="sub-menu-inner" style="left:470px; display:none;">
                                        <dl>
                                            <a href="place.html"><dd>전국캠핑장검색</dd></a>
                                        </dl> 
                                    </div>
                              </div>
                            </li>
                        </ul>
                    </div>
                    <div class="col" id="mobile">
                        <div id="header-right">
                            <form action="get">
                                <input type="text" style="width: 190px; border: none; outline:none;">
                                <input id=search-btn type="button">
                            </form>
                            <div id="mobile_menu" onclick="open_modal()">
                                <span class="top"></span>
                                <span class="middle"></span>
                                <span class="bottom"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="mid">
        <div class="container">
            <!-- <img src="img/5.jpg" alt="camping" id="camping" style="max-width:100%;"> -->
            <div style="width:100%; height:50px; margin-top:20px; background-color:cornflowerblue;">
                <h5 style="color:white; line-height: 50px; margin-left:20px;">★☆사용후기☆★</h5>
            </div>
            <div style="margin-top : 5px; text-align: center;">
                <table class ="table table-primary table-striped" >
                    <thead>
                    <tr>
                        <td style="width:10%">No.</td>
                        <td style="width:10%">작성자</td>
                        <td style="width:10%">제품명</td>
                        <td style="width:45%">후기</td>
                        <td style="width:20%">날짜</td>
                        <td style="width:5%">조회수</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="dto" >
                    <tr>
                    <td>${dto.review_idx }</td>
                    <td>${dto.rName }</td>
                    <td>
                      <c:forEach begin="1" end="${dto.rIndent }">└</c:forEach>
					  ${dto.rTitle }
                    </td>
                    <td><a href="review_view.do?review_idx=${dto.review_idx }">${dto.rContent }</a></td>
                    <td>${dto.rDate }</td>
					<td>${dto.rHit }</td>
					</tr>
					</c:forEach>
                    <tr>
                    <td clospan="5"><a href="write_view.jsp">글작성</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id='footer'>
        <div class="container">
            <address>(00000)서울특별시 강남구 ***로 ***길 **, #####(***)</address>
            <dl>
            <dt>대표이사 : 홍길동</dt>
            <dt>사업자등록번호 : 123-45-67890</dt>
            <dt>통신판매업신고번호 : 1234-서울강남-5678</dt>
            </dl>
            <p class='copyright'>VVS VVS. All Right Reserved</p>
        </div>
    </div>
    <script src="campers.js"></script>
</body>
</body>
</html>