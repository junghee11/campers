<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") != null) { %>
<jsp:forward page="index.jsp"></jsp:forward>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="common.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
    #help ul { text-align: center;
                  margin: 20px  50px 0  -10px;}
    #help ul li {list-style: none;
                        display:inline;
                        }
    #help ul a {text-decoration-line: none;
                      font-size:13px;
                      color: gray;}
    #help ul a:hover {color:cornflowerblue;}
    #help ul li:nth-child(2)::before {padding-right:8px; padding-left:3px; 
                            content:"|";
                            color: gray; }
    #help ul li:nth-child(3)::before {padding-right:8px; padding-left:3px; 
    content:"|";
    color: gray; }
  </style>
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
  <div class="container">
    <div style="width: 500px; height: 445px; margin: 120px auto;">
      <div style='text-align:center;'>
          <h1 class='mb-4'>로그인</h1>
      </div>
      <form class="row g-3" action="loginOk.jsp" method="post">
        <div class="col-md-12">
          <input type="text" class="form-control" name="id" id="id" placeholder="아이디">
        </div>
        <div class="col-md-12">
          <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호">
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary form-control">로그인</button>
        </div>
        </form>
    <div id="help">
      <ul>
          <li><a href="findIdPw.jsp">아이디 / 비밀번호 찾기</a></li>
          <li><a href="join.html">회원가입</a></li>
      </ul>
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