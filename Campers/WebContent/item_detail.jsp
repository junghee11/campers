<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.ex.dao.*" %>
<%@ page import="com.javalec.ex.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="common.css">
<link rel="stylesheet" href="shop.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.navbar ul {width:100%; 
				border-bottom:1px solid rgb(80, 80, 80);
				text-align:center;}
.nav ul li {margin: 0 auto;
            text-align: center;
            width:33.3%;}
.navbar ul li a {color:rgb(80, 80, 80);}


</style>
<title>제품상세페이지</title>
</head>
<body>
<header>
<div id="top-until">
  <div class="container">
    <div id="until-right">
        <ul>
           <%
           String id = null;
   if(session.getAttribute("ValidMem") == null) {
   	%>
   
   	<li><a href="login.jsp">로그인</a></li>
   	<li><a href="mypage.jsp">장바구니</a></li>
   	<li><a href="mypage.jsp">마이페이지</a></li>  
   <% } else { 
   	String name =(String)session.getAttribute("name");
   	id =(String)session.getAttribute("id");
   %>
   	<li><b><%=name %></b>님</li>
   	<li><a href="logout.do">로그아웃</a></li>
   	<li><a href="mypage.do?id=<%=id %>">장바구니</a></li>
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
                          <b><a href="review_list.do" onmouseover="sub_menu()">REVIEW</a></b>
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
                            <input type="text" style="width: 210px; border: none; outline:none;">
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
    
   	<div id="item" style="border-top: 2px solid rgb(80, 80, 80); padding-top: 30px; margin-top: 15px;" >
       <form id="item_sum" name="item_sum" action="" method="get">
          <input type="hidden" name="user_id" value="<%=id %>">
          <input type="hidden" name="item_idx" value="${item_view.item_idx}">
          <div style="display:flex;">
             <img src="${item_view.imgLink }" alt="camping" style="width:40%; height:500px;" id="camping">
             <div style="width:60%; margin:15px;">
               <h4  style="height:40px;">${item_view.pName }</h4>
               <table id="item_sum_mid">
               <tr>
                 <td style="width:250px;"> 판매가</td>
                 <td style="width:250px; color:red; font-size:18px; font-weight: 600;">${item_view.price } 원</td>
               </tr>
               <tr>
                 <td>> 배송방법</td>
                 <td>택배</td>
               </tr>
               <tr>
                 <td>> 배송비</td>
                 <td>3,000원</td>
               </tr>
               </table>
               <h6>(최소주문수량 1개이상)</h6>
               <table id="item_sum_bottom" class="table">
                 <thead class="table-dark">
                   <tr>
                     <td>상품명</td>
                     <td>상품수</td>
                     <td>가격</td>
                   </tr>
                 </thead>
                 <tbody>
                   <tr>
                     <td>${item_view.pName }</td>
                     <td><input type="number" name="amount" step="1" min="0" max="100" value="1"></td>
                     <td>${item_view.price }</td>
                   </tr>
                 </tbody>
               </table>
               <%
               if(id== null){
            	  
            	   %>
            	   <input class="item_button" style="background-color: rgb(23, 160, 96); color:white;" type="button" onclick="idNull()" value="바로구매">
               <input class="item_button" type="button" onclick="idNull()" value="장바구니">
               <input class="item_button" type="button" onclick="idNull()" value="♡ 찜하기">
            	   <%
               } else{
            	   %>
            	   <input class="item_button" style="background-color: rgb(23, 160, 96); color:white;" type="button" onclick="itemOption(1)" value="바로구매하기">
               <input class="item_button" type="button" onclick="itemOption(2)" value="장바구니담기">
               <input class="item_button" type="button" onclick="itemOption(3)" value="♡ 찜하기">
            	   <%
               }
               %>
             </div>
           </div>
       </form>
       <script>
       		function idNull(){
       			alert("로그인 후 이용해주세요")
       			location.href="login.jsp"
       		}
       		function itemOption(num){
       			if(num==1){
       				document.item_sum.action = 'purchase.do'
       			} else if(num==2){
       				alert("장바구니에 담았습니다. 쇼핑을 계속하시겠습니까?")
       				document.item_sum.action = 'cart.do'
       			} else if(num==3){
       				document.item_sum.action = 'like.do'
       			}
       			document.item_sum.submit()
       		}
       </script>
   	</div>
   	
    <nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
	  <ul class="nav nav-pills">
	    <li class="nav-item" style="background-color: rgb(80, 80, 80);">
	      <a class="nav-link" href="#scrollspyHeading1" style="color:white;">상품상세정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading2">상품구매안내</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading3">상품후기</a>
	    </li>
	  </ul>
	</nav>
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
	  <h4 id="scrollspyHeading1">...</h4>
	  <div>
	  <p>
	  	<br/><br/><br/><br/>
	 	${item_view.pContent }
	  </p>
	  </div>
	  <nav class="navbar navbar-light bg-light px-3">
	  <ul class="nav nav-pills">
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading1">상품상세정보</a>
	    </li>
	    <li class="nav-item" style="background-color: rgb(80, 80, 80);">
	      <a class="nav-link" href="#scrollspyHeading2" style="color:white;">상품구매안내</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading3">상품후기</a>
	    </li>
	  </ul>
	</nav>
	  <h4 id="scrollspyHeading2">...</h4>
	  <div>
	  <br/><br/><br/><br/>
	  <p>상품결제정보</p>
	  <hr><p>
	  
		고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  

		무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
		주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
		<b>배송정보</b></p>
	  	<hr><p>
		배송 방법 : 택배
		배송 지역 : 전국지역
		배송 비용 : 3,500원
		배송 기간 : 1일 ~ 3일
		배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
		고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
		교환 및 반품정보</p>
		  <hr>
		  <p>
		교환 및 반품이 가능한 경우
		- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의
		  경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.
		- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과
		  다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내
		
		교환 및 반품이 불가능한 경우
		- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여
		  포장 등을 훼손한 경우는 제외
		- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
		  (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에
		  따른 반품/교환은 제조사 기준에 따릅니다.)
		- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을
		  제공한 경우에 한 합니다.
		- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우
		- 복제가 가능한 상품등의 포장을 훼손한 경우
		  (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)
		
		※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
		      (색상 교환, 사이즈 교환 등 포함)
		※ 반품 왕복 택배비는 제품의 크기에 따라 (\3,000~\10,000) 차등 부과됩니다.
		
		서비스문의</p>
	  	<hr>
	  	
	  </div>
	  <nav class="navbar navbar-light bg-light px-3">
	  <ul class="nav nav-pills">
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading1">상품상세정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#scrollspyHeading2">상품구매안내</a>
	    </li>
	    <li class="nav-item" style="background-color: rgb(80, 80, 80);">
	      <a class="nav-link" href="#scrollspyHeading3" style="color:white;">상품후기</a>
	    </li>
	  </ul>
		</nav>
	  <h4 id="scrollspyHeading3">...</h4>
	  <div>
	  <p>
	  <br/><br/><br/><br/>
	  교환 및 반품이 불가능한 경우
		- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여
		  포장 등을 훼손한 경우는 제외
		- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
		  (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에
		  따른 반품/교환은 제조사 기준에 따릅니다.)
		- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을
		  제공한 경우에 한 합니다.
		- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우
		- 복제가 가능한 상품등의 포장을 훼손한 경우
		  (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)
	  </p>
	  </div>
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