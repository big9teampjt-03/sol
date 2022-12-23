<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>


    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <br/>
  <body>

<main>

<div class="container">
<div class= "row">
<div class ="col-sm-12 col-centered">
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
<!-- Indicators -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <!-- Wrapper for slides -->
  <div class="carousel-inner" style="max-width:100%; height:auto;">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="https://t1.daumcdn.net/news/202106/29/newsis/20210629071015044absy.jpg" class="d-block w-100" alt="..." >
    </div>
    
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://t1.daumcdn.net/cfile/blog/9967874A5CBDC9DE31" class="d-block w-100" alt="...">
    </div>
    
    <div class="carousel-item">
      <img src="https://cdn.woman.chosun.com/news/photo/201604/20160420_2_bodyimg_58281.jpg" class="d-block w-100" alt="...">
      <!-- <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div> -->
    </div>
  </div>
  <!-- left, right controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
</div>
</div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
      	<br/>
      	<br/>
        <h2 class="fw-normal">소개 글 <img src="https://cdn-icons-png.flaticon.com/512/4812/4812820.png" style="width:100px; height:100px"/></h2>
        <p>헬스케어와 커뮤니티를 결합한 반려동물 케어 커뮤니티 사이트입니다. </p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
       <br/>
      	<br/>
        <h2 class="fw-normal">추천 수의사 <img src="https://cdn-icons-png.flaticon.com/512/2138/2138349.png" style="width:100px; height:100px"/></h2>
        <p>각종 분야의 다양한 수의사들의 정보를 확인하실 수 있습니다.</p>
        <p><a class="btn btn-primary" href="">바로가기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
		<br/>
      	<br/>
        <h2 class="fw-normal">인기 스토리<img src="https://cdn-icons-png.flaticon.com/512/1959/1959927.png" style="width:100px; height:100px"/></h2>
        <p>커뮤니티 회원들이 자유롭게 반려동물들의 사진을 공유하고 게시할 수 있습니다. </p>
        <p><a class="btn btn-primary" href="/board/list">바로가기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">
    <h3>대표 원장님들</h3>
    <div class="container">
        <!--부트스트랩의 기능 css로 따로 하지 않아도 마진을 조절가능-->
        <div class="row my-5">
            <!--utilities colors-->
            <!--7:5 로 나누어짐(부트스트랩은 하나의 행이 12개로 쪼개짐)-->
            <div class="col-5">
                <!--bootraps 기능 class="w-100"으로 사이즈 조절 가능-->
                <img src="https://dimg.donga.com/wps/SPORTS/IMAGE/2020/04/01/100457817.2.jpg" alt="" class="w-100" style="height:500px" >
            </div>
            <div class="col-7">
                <h2>설채현</h2><br>
                <!--부트스트랩 list 기능 사용-->
                <ul class="list-group list-group-flush">
                	<li class="list-group-item">그녀의 동물병원 원장</li>
                    <li class="list-group-item">미국 KPA 공인 트레이너</li>
                    <li class="list-group-item">건국대학교 수의과대학 학사 (2004년 ~ 2010년)</li>
                    <li class="list-group-item">서울청담씨티칼리지 반려동물계열 디렉터 (2018년 ~ 현재)</li>
                    <li class="list-group-item">근무 시간:10:00~22:00</li>
                    <li class="list-group-item">휴무:매주 화요일, 일요일</li>
                    <li class="list-group-item">tel.02-2237-7582</li>
                </ul>
        
                <br>
         
            </div>
        </div>
        <!--가운데 선을 그려줌-->
        <hr />
        <div class="row my-5">
            <div class="col-7">
                <h2>박정윤</h2><br>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">올리브 동물병원 대표원장</li>
                    <li class="list-group-item">방송 프로그램의 자문 수의사로 활동(KBS, MBC, EBS, JTBC, 채널A)</li>
                    <li class="list-group-item">동물자유연대와 동물보호단체 KARA의 자문 수의사로 활동</li>
                    <li class="list-group-item">네이버 매거진캐스트〈동물과 행복한 가족 만들기> 연재</li>
                    <li class="list-group-item">근무 시간: 10:00~22:00</li>
                    <li class="list-group-item">휴무:매주 수요일, 토요일</li>
                    <li class="list-group-item">tel.02-391-75027</li>
                </ul>
                <br>
               
            </div>
            <div class="col-5">
                <img src="박정윤 수의사.PNG" alt="" class="w-100" style="height:500px">
            </div>
        </div>
        <hr />
        <div class="row my-5">
            <div class="col-5">
                <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2020/03/04/100010813.4.jpg" alt="" class="w-100"  style="height:500px">
            </div>
            <div class="col-7">
                <h2>최영민</h2>
                <ul class="list-group list-group-flush">
                   <li class="list-group-item">최영민 동물 메디컬 센터 운영(특수동물 진료 가능)</li>
                   <li class="list-group-item">건국대 수의과대학에서 박사 취득</li>
                   <li class="list-group-item">영국 왕립수의과대학과 미국 플로리다 수의과 대학등에서 교육</li>
                    <li class="list-group-item">TV동물농장 자문위원으로 활동</li>
                    <li class="list-group-item">근무 시간: 10:00~19:00</li>
                    <li class="list-group-item">휴무:첫째주, 둘째주 일요일</li>
                    <li class="list-group-item">tel.02-546-9539</li>
                </ul>
                <br>
                
            </div>
        </div>
        <hr>
        <div class="row my-5">
            <div class="col-7">
                <h2>김명철</h2>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">N동물의료센터 노원점(원장)</li>
                    <li class="list-group-item">한국고양이 수의사회(홍보이사)</li>
                    <li class="list-group-item">고양이전문 수의사이자 행동전문가</li>
                    <li class="list-group-item">TV 동물 농장 고양이를 부탁해 등 다수 방송프로그램 활동</li>
                    <li class="list-group-item">유튜브 "미야옹철의 냥냥펀치" 채널 운영중</li>
                    <li class="list-group-item">미야옹철의 묘한 진료실 저서 </li>
                    <li class="list-group-item">근무 시간: 10:00~22:00</li>
                    <li class="list-group-item">강습 가능 시간:10:00~22:00</li>
                    <li class="list-group-item">휴무:매주 수요일, 토요일</li>
                    <li class="list-group-item">tel.010-6789-6789</li>
                </ul>
                <br>
              
            </div>
            <div class="col-5">
                <img src="https://th.bing.com/th/id/OIP.MKlGAP8fH2KfLAQJzGhv1QHaK4?pid=ImgDet&rs=1" alt="" class="w-100" style="height:500px">
            </div>
        </div>
    <!-- /END THE FEATURETTES -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  </div><!-- /.container -->
</div>

</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>