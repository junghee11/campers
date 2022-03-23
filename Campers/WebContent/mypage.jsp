<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.javalec.ex.*" %>
<%@ page import="com.javalec.ex.dao.*" %>
<%@ page import="com.javalec.ex.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="mypage.css">
    <link rel="stylesheet" href="common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%
memberDto dto = null;
/* 로그아웃상태에서 modify하려고 하면 500에러 페이지가 나타나므로, ValidMem에 아무것도 없는지 체크 후, 아무것도 없으면 login.jsp로 이동 */
if(session.getAttribute("ValidMem") == null){
%>
<script>
	alert("로그인 후에 이용 가능합니다.")
	document.location.href="login.jsp" //정보수정 성공 후 메인으로 이동
</script>
<%
} else { 
String id = (String)session.getAttribute("id"); 
myDao dao = myDao.getInstance(); //db 읽을 수 있는 정보를 받아옴
dto = dao.getMember(id); //db 접속해서 id로 조회함

%>    
<style>
	#v-pills-messages h4 {line-height: 80px; 
             text-align: center;}
    #v-pills-messages div h6 {font-weight: 600;
             width: 100%;}
    #v-pills-messages div button { width: 70%; height: 50px;
                  border:0;
                  display: block;
                  margin: 0 auto;
                  }
    #v-pills-messages div button a { color:white;
                    /* width: 230px;  */
                    height: 50px;
                    text-align: center;
                    line-height: 50px;
                    font-weight: 600;
                    text-decoration: none;}
    #v-pills-profile h4 {line-height: 80px; 
             text-align: center;}
    #v-pills-profile div h6 {font-weight: 600;
             width: 100%;}
</style>
<title>Insert title here</title>
</head>
<body>
	<header>
        <div id="top-until">
          <div class="container">
            <div id="until-right">
                <ul>
	                <li><b><%=dto.getName() %></b>님</li>
	                <li><a href="logout.do">로그아웃</a></li>
		          	<li><a href="basket.jsp">장바구니</a></li>
		          	<li><a href="mypage.do?id=<%=id %>">마이페이지</a></li>   
	          	<% } %>
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
            <div style="width:100%; height:80px; margin-top:20px;">
                <h4>MyPage</h4>
            </div>
            <!-- <div style="margin-top :20px; display: flex;"> -->
                <!-- <div style="width: 20%; margin-right:100px;"> -->
                    <div class="d-flex align-items-start">
                        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="false">나의정보</button>
                            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">찜한상품</button>
                            <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="true">장바구니</button>
                            <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">내 리뷰</button>
                        </div>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <div style="margin-left: 25px;">
                                    <h5 class='mb-4' style="font-weight:600;">나의정보</h5>
                                </div>
                                <form class="row g-4" action="modify.do" method="post">
                                	<input type="hidden" id="id" name="id" value="<%=dto.getId() %>">
                                    <div class="col-md-12">
                                    <label for="id">ID : </label>
                                    <p style="display:inline;"><%=dto.getId() %></p>
                                    </div>
                                    <div class="col-md-12">
                                    <label for="pw">Password : </label>
                                    <input type="text" id="pw" name="pw" value="<%=dto.getPw() %>">
                                    </div>
                                    <div class="col-12">
                                    <label for="name">Name : </label>
                                    <input type="text" id="name" name="name" value="<%=dto.getName() %>">
                                    </div>
                                    <div class="col-12">
                                    <label for="addr">Address : </label>
                                    <input type="text" id="addr" name="addr" value="<%=dto.getAddr() %>">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="phone">Phone : </label>
                                        <input type="text" name="phone" value="<%=dto.getPhone() %>">
                                    </div>
                                    <div class="col-3">
                                    <input type="submit" class="btn btn-primary form-control" value="정보 수정하기" />
                                    </div>
                                    <div class="col-3">
                                        <button type="button" onclick="location.href='commandDelete.do?id=<%=dto.getId() %>'" class="btn btn-secondary form-control">탈퇴하기</button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            	<div style="width:100%; height:80px; margin-top:20px;">
					                <h4>위시리스트</h4>
					            </div>
					            <div style="margin-top :20px; display: flex;">
					                <div style="width: 100%; margin-right:100px;">
					                    <table class ="table table-hover">
					                        <thead>
					                            <tr>
					                                <th scope="col">Img</th>
					                                <th scope="col">상품명</th>
					                                <th scope="col">가격</th>
					                            </tr>
					                        </thead>
					                        <tbody style="line-height: 100px;">
					                        	<c:forEach items="${myjjim}" var="jjim" >
			                                    <tr>
			                                    <td><img src="${jjim.imgLink }" alt="camping" id="camping" style="width: 100px; height: 100px;"></td>
			                                    <td><a href="item_detail.do?item_idx=${jjim.item_idx }">${jjim.pName }</a></td>
			                                    <td>${jjim.price }</td>
			                                    </tr>
			                                    </c:forEach>
					                        </tbody>
					                    </table>
					                </div>
					            </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            	<div style="width:100%; height:80px; margin-top:20px;">
                                    <h4>장바구니</h4>
                                </div>
                                <div style="margin-top :20px; display: flex;">
                                    <div style="width: 70%; margin-right:100px;">
                                        <table class ="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Img</th>
                                                    <th scope="col">상품명</th>
                                                    <th scope="col">수량</th>
                                                    <th scope="col">가격</th>
                                                </tr>
                                            </thead>
                                            <% int num = 1; 
                                               int ttl = 0;
                                            %>
                                            <tbody style="line-height: 100px;">
                                            	<c:forEach items="${mycart}" var="cart" >
			                                    <tr>
			                                    <th scope="row"><%=num++ %></th>
			                                    <td><img src="${cart.imgLink }" alt="camping" id="camping" style="width: 100px; height: 100px;"></td>
			                                    <td><a href="item_detail.do?item_idx=${cart.item_idx }">${cart.pName }</a></td>
			                                    <td>${cart.amount }</td>
			                                    <td>${cart.price }</td>
			                                    </tr>
			                                    </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div style="width: 20%;">
                                        <h6 >총 상품 금액 &nbsp;&nbsp;&nbsp;47,500원</h6>
                                        <h6>배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,500원</h6>
                                        <hr style="opacity: 0.5;">
                                        <h6 style="text-align: right;">예상결제금액</h6>
                                        <h6 style="text-align: right; color:red; margin-bottom: 30px;">50,000원</h6>
                                        <button style="background-color: red;"><a href="#">전체상품 주문하기</a></button> <br>
                                        <button style="background-color: darkgray;"><a href="shop_list.do?category=">쇼핑계속하기</a></button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            	<table class ="table table-primary table-striped" >
                                    <thead>
                                    <tr>
                                        <td style="width:10%">No.</td>
                                        <td style="width:10%">제품명</td>
                                        <td style="width:55%">후기</td>
                                        <td style="width:20%">날짜</td>
                                        <td style="width:5%">조회수</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${myreview}" var="review" >
                                    <tr>
                                    <td>${review.review_idx }</td>
                                    <td>
                                      <c:forEach begin="1" end="${review.rIndent }">└</c:forEach>
                                      ${review.rTitle }
                                    </td>
                                    <td><a href="review_view.do?review_idx=${review.review_idx }">${review.rContent }</a></td>
                                    <td>${review.rDate }</td>
                                    <td>${review.rHit }</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- <ul>
                        <li><a href="modify.jsp">내 계정</a></li>
                        <li><a href="#">관심상품</a></li>
                        <li><a href="basket.html">장바구니</a></li>
                        <li><a href="#">내가 쓴 리뷰</a></li>
                    </ul> -->
                <!-- </div>
                <div style="width: 80%;">
                    <h4>내정보</h4>
                    <hr>
                    <p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <h4>찜한상품</h4>
                    <hr>
                    <p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <h4>내가쓴리뷰</h4>
                    <hr>
                    <p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

                </div> -->
            <!-- </div> -->
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