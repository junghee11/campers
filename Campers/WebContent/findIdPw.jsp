<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="common.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header>
    <div id="top-until">
      <div class="container">
        <div id="until-right">
            <ul>
                <li><a href="login.jsp">로그인</a></li>
                <li><a href="mypage.jsp">장바구니</a></li>
                <li><a href="mypage.jsp">마이페이지</a></li>
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
                                    <a href="review_list.do"><dd>한줄품평</dd></a>
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
<div id="mid" >
  <div class="container" style="width:900px; margin: 0 auto; display: flex;">
    <div style="width: 350px; height: 250px; margin: 120px auto; border: 1px solid gray; padding: 10px 30px;">
      <form action="find_member.do" method="post" class="row g-3">
        <h5 class='mb-4' style="color:gray; font-weight: 600; margin-top: 20px;">아이디찾기</h5>
        <div class="col-md-12">
          <input type="text" class="form-control" name="name" placeholder="name">
        </div>
        <div class="col-md-12">
          <input type="text" class="form-control" name="phone" placeholder="phone(000-0000-0000)">
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-dark form-control">확인</button>
        </div>
      </form>
    </div>
    <div style="width: 350px; height: 250px; margin: 120px auto; border: 1px solid gray; padding: 10px 30px;">
        <form action="find_member.do" method="post" class="row g-3">
          <h5 class='mb-4' style="color:gray; font-weight: 600; margin-top: 20px;">비밀번호찾기</h5>
          <div class="col-md-12">
            <input type="text" class="form-control" name="id" placeholder="id">
          </div>
          <div class="col-md-12">
            <input type="text" class="form-control" name="name" placeholder="name">
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-dark form-control">확인</button>
          </div>
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