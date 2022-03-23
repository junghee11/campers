<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>리뷰</title>
<style>
        #writeContent table {width:700px; 
            border: 1px solid rgb(92, 92, 92);
                     border-collapse: collapse;
                     margin:20px; 
                     height:400px;
                     color:rgb(92, 92, 92);
                     background-color:rgb(182, 202, 248);}
        #writeContent table td {margin:15px;
                    border: 1px solid rgb(92, 92, 92);}
        #writeContent table tr td:first-child {height:30px; 
                    line-height: 30px; 
                    width: 110px; text-align: center; 
                    font-weight: 600;}
        #writeContent table tr td:last-child {width:450px;}
        
        #writeContent table td select {width: 150px;}
        #writeContent table td textarea {width: 500px;}
        #submitReview input {width:120px; height:40px;
                            background-color:midnightblue;
                            border:none; color:white;
                            margin: 0 150px 10px 0;
                            text-decoration: none;}
        #submitReview a {margin-right:15px; 
                line-height:50px; color:rgb(92, 92, 92);
                text-decoration: none;}
    </style>
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
	          	
	          	<script>
					alert("로그인 후에 이용 가능합니다.")
					document.location.href="login.jsp" //정보수정 성공 후 메인으로 이동
				</script>
	          <% } else { 
	          	String name =(String)session.getAttribute("name");
	          	id =(String)session.getAttribute("id");
	          %>
	          	<li><b><%=name %></b>님</li>
	          	<li><a href="logout.do">로그아웃</a></li>
	          <% } %> 
              <li><a href="mypage.jsp?id=<%=id %>">장바구니</a></li>
              <li><a href="mypage.jsp?id=<%=id %>">마이페이지</a></li>
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
        <div style="margin-top : 5px;">
            <form id="writeContent" name="myForm" action="reply_view.do">
            <input type="hidden" id="review_idx" name="review_idx" value="${content_view.review_idx}">
                <table>
                    <tr>
                        <td>No.</td>
                        <td>&nbsp;${content_view.review_idx }</td>
                    </tr>  
                    <tr>
                        <td>조회수</td>
                        <td>&nbsp;${content_view.rHit}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>&nbsp;${content_view.rName}</td>
                    </tr>
                    <tr>
                        <td >제품명</td>
                        <td>&nbsp;${content_view.rTitle}</td>
                    </tr>
                    
                        <%
                        String writerCheck = (String)request.getAttribute("writerCheck");
		               	if(id.equals(writerCheck)) {
			          	%>
			          	<tr sytle="height:350px;">
                        <td >후기</td>
                        <td style="height:180px;"><textarea id="rContent" name="rContent">${content_view.rContent}</textarea></td>
                    	</tr>
			          	<tr style="text-align: right; height:55px;">
                        <td style="border:none;"></td>
                        <td style="border:none;" id="submitReview"  colspan="2">
			          	<input type="button" onclick="submitModify(1)" style="margin: 0 0 10px 0;" value="답변">
			          	&nbsp;&nbsp;<input type="button" style="margin: 0 0 10px 0; background-color: rgb(73, 73, 73);" onclick="submitModify(2)" value="수정">
			          	<script>
			          	function submitModify(index){
			          		if(index == 1){
			          			document.myForm.action = "reply_view.do"
			          		} else if(index == 2){
			          			document.myForm.action = "modify_review.do"
			          		}
			          		document.myForm.submit()
			          	}
			          	</script>
                        &nbsp;&nbsp;<a href="delete_review.do?review_idx=${content_view.review_idx}">삭제</a>
			          	<%} else { %>
			          	<tr sytle="height:350px;">
                        <td >후기</td>
                        <td style="height:180px;">&nbsp;${content_view.rContent}</td>
                    	</tr>
			          	<tr style="text-align: right; height:55px;">
                        <td style="border:none;"></td>
                        <td style="border:none;" id="submitReview"  colspan="2">
			          	<input type="submit" value="답변하기">
			          	<% } %>
                        <a href="review_list.do">목록으로 돌아가기</a>
                        </td>
                    </tr>
                </table>
            </form>
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
</html>