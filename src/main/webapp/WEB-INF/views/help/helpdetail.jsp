<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
   content="Image-Uploader is a simple jQuery Drag & Drop Image Uploader plugin made to be used in forms, withot AJAX." />
<meta name="keywords"
   content="image, upload, uploader, image-uploader, jquery, gallery, file, form, static" />
<meta name="author" content="Christian Bayer" />
<meta property="og:url"
   content="https://christianbayer.github.io/image-uploader/" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Image-Uploader" />
<meta property="og:description"
   content="Image-Uploader is a simple jQuery Drag & Drop Image Uploader plugin made to be used in forms, withot AJAX." />
<meta property="og:image"
   content="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png" />
<link rel="stylesheet"
   href="/danim/resources/css/image-uploader.min.css">
<title>다님: 상세페이지</title>

<!-- Google font -->
<link
   href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600"
   rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
   href="/danim/resources/css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
   href="/danim/resources/css/style.css" />
<!-- Custom youngjun's stlylesheet -->
<link type="text/css" rel="stylesheet"
   href="/danim/resources/css/yjstyle.css" />
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services"></script>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <style>
   textarea.autosize {
        resize: none;
        overflow-y: visible; 
        padding: 1.1em; 
        padding-bottom: 0.2em;
        line-height: 1.6;
        color: black;
      }
   </style>
<script>
     $(document).ready(function() {
        $('.container').on( 'keyup', 'textarea', function (e){
         $(this).css('height', 'auto' );
         $(this).height( this.scrollHeight );
        });
        $('.container').find( 'textarea' ).keyup();
      });
        function logout() {
            alert = "로그아웃 되었습니다.";
        }

        $(document).ready(function() {
            $("#timeryj").on('change', function() {
                if (this.value == "예약") {
                    $("#reser1").css('display', 'block');
                    $("#reser2").css('display', 'block');
                } else {
                    $("#reser1").css('display', 'none');
                    $("#reser2").css('display', 'none');
                }
            })
        })
        
        function helpdelete(helpno){
           if(confirm("등록하신 게시글을 삭제 하시겠습니까?")==true){
              /* 남규쓰 */
               var userid = $('#userid').val();
              var yoyo = $('#yoyo').val();
              var imoney = yoyo.replace(',','');
              var scharge = null;
              var division = "취소";
              var category = "취소환급";
              location.href="paySuccess.do?userid=" + userid
                        + "&money=" + imoney 
                        + "&division=" + division 
                        + "&scharge=" + scharge 
                        + "&category=" + category;
              /* 남규쓰 */
              location.href="helpdelete.do?helpno=" + helpno;   
           }
           
        }
        
        function pop(url) {
           
         var img = new Image();
         img.src = url;
         console.log(img);
         console.log(img.height);
         console.log(img.width);
         console.log(img.complete);
         console.log();
         
         var img_height;
         var img_width;
         
         if (Number(img.height)>=800){
           img_height = 800;
           img_width = (Number(img.width) * 800) / Number(img.height);
         }else{
           img_height = img.height;
           img_width = img.width;
         }
         var win_width = img_width+1;
         var win_height = img_height+1;
         
         console.log("1 : " + win_width);
         console.log("2 : " + win_height);
         
         var OpenWindow = window.open('', '_blank', 'width=' + win_width + 'px, height=' + win_height + 'px, menubars=no, scrollbars=auto, status=no, resizable=no, directories=no');
         OpenWindow.document.write("<style>body{margin:0px;}</style><img src='" + url + "' style='height:"+img_height+"px;'>");
      }
        
        function intohelplist(){
           $.ajax({
              url:"intohelplist.do",
              type:"POST",
              data:{helpno:${helpdetail.helpno}},
              success:function(result){
                 if(result=="A"){
                    if(confirm("다님이로 지원합니다. 계속 하시겠습니까?")){
                       $.ajax({
                          url:"updatehelplist.do",
                          type:"POST",
                          data:{helpno:${helpdetail.helpno},command:result},
                          success:function(){
                             var str = "<a class='main-button icon-button pull-right' onclick='intohelplist();' style='cursor:pointer; background-color:#EBEBEB; margin-bottom: -5%; z-index: 2;margin-bottom: 40px;margin-top: 40px;'>지원취소하기</a>";
                             $('#matchingbtn').html(str);
                          }
                       })
                    }
                 }else if(result=="B"){
                    if(confirm("이미 다님이로 지원하신 상태입니다. 취소하시겠습니까?")){
                       $.ajax({
                          url:"updatehelplist.do",
                          type:"POST",
                           data:{helpno:${helpdetail.helpno},command:result},
                           success:function(){
                              var str = "<a class='main-button icon-button pull-right' onclick='intohelplist();' style='cursor:pointer; margin-bottom: -5%; z-index: 2;margin-bottom: 40px;margin-top: 40px;'>다님이 지원하기</a>";
                              $('#matchingbtn').html(str);
                           }
                       })
                    }else{
                       return;
                    }
                 }
                 
              }
           });
        }
        
        function tobedanim(){
           if(confirm("다님이로 즉시 매칭됩니다. 계속하시겠습니까?")==true){
              location.href="helpmatching.do?helpno="+${helpdetail.helpno};
           }
        }
        
        
    </script>

</head>

<body>

   <!-- Header -->
   <c:import url="../headfoot/header.jsp" />
   <!-- /Header -->

   <!-- Hero-area -->
   <div class="hero-area section">

      <!-- Backgound Image -->
      <div class="bg-image bg-parallax overlay"
         style="background-image: url(/danim/resources/img/page-background.jpg)"></div>
      <!-- /Backgound Image -->

      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
               <ul class="hero-area-tree">
                  <li><a href="userChange.do">Danim:</a></li>
               </ul>
               <h1 class="white-text">상세페이지</h1>

            </div>
         </div>
      </div>

   </div>
   <!-- /Hero-area -->

   <!-- My Info -->
   <div id="information" class="section">

      <!-- container -->
      <div class="container">
         <h2>심부름 요청</h2>
         <hr style="border-color: #fcc159">
         <br>
         <!-- row -->
         <div class="row">
            <div class="col-md-12 row-md-12 ">
               <div class="insertinfoyj row" cellspacing="30px" style="margin-bottom: 40px;">
                  <div class="tdyj1 col-md-6"><span class="myinfo">카테고리</span></div>
                  <div class="tdyj2 col-md-6"><span>${helpdetail.category}</span></div>
               </div>
               <div class="insertinfoyj row" style="margin-bottom: 40px;">
                  <div class="tdyj1 col-md-6"><span class="myinfo">닉네임</span></div>
                  <div class="tdyj2 col-md-6"><span>${helpdetail.nickname}</span></div>
               </div>
               <div class="insertinfoyj row" style="margin-bottom: 40px;">
                  <div class="tdyj1 col-md-6"><span class="myinfo">전화번호</span></div>
                  <div class="tdyj2 col-md-6"><span>${helpdetail.phone}</span></div>
               </div>
            </div>
         </div>
         <div class="row">
         <div class="col-md-12 row-md-6 mapyj" style="margin-bottom: 40px;">
            <label for="map" class="yellowlabelyj">요청지역</label>
               <div class="map_wrap" cellpadding="30px">
                  <div id="map"
                     style="width: 100%; height: 100%; position: relative; overflow: hidden;">
                  </div>
                  <!-- <div class="hAddr">
                                <span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
                            </div> -->
                  <div class="mylocbg" id="mylocbg" onclick="myloc();" title="내위치">
                     <img src="/danim/resources/img/myloc3.png" alt="" id="myloc">
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12 row-md-12 mapyj">
                  <div class="insertinfoyj row" style="margin-bottom: 40px;">
                     <div class="col-md-6 tdyj1"><span class="myinfo">주소</span></div>
                     <div class="col-md-6 tdyj2"><span>${helpdetail.roadaddress} ${helpdetail.detailaddress}</span></div>
                  </div>
   
                  <div class="insertinfoyj row" style="margin-bottom: 40px;">
                     <div class="col-md-6 tdyj1"><span class="myinfo">예상시간</span></div>
                     <div class="col-md-6 tdyj2"><span>${helpdetail.usingtime}</span></div>
                  </div>
   
                  <div class="insertinfoyj row" style="margin-bottom: 40px;">
                     <div class="col-md-6 tdyj1"><span class="myinfo">요청기한</span></div>
                     <div class="col-md-6 tdyj2"><span>${helpdetail.endtime}</span></div>
                  </div>
                  <div class="insertinfoyj row" style="margin-bottom:40px;">
                        <div class="col-md-6 tdyj1 yellowlabelyj">요청제목</div>
                        <div class="col-md-6 tdyj2">${helpdetail.helptitle}</div>
                  </div>
                  <div class="insertinfoyj" valign="top" >
                     <label for="contents" class="tdyj1 yellowlabelyj">요청내용</label>
                     <div class="container" style="width: 100%; padding: 0;">
                        <textarea class="autosize row" style="width: 100% !important; border: none; white-space: pre;" disabled>${helpdetail.contents}</textarea>
                     </div>
                  </div>
            </div>
         </div>
      

      <c:if test="${!empty helpdetail.image}">
         <div class="row uploadwindowyj input-field" style="margin-bottom: 40px; ">
            <div class="input-images-1 col-md-12" id="uploader" style="border: none;">
               <div class="row image-uploader has-files">
                  <div class="col-md-12 uploaded" style="margin: 0px; padding-left:30px;">
                     <c:forEach var="img" items="${rname}">
                        <div class="uploaded-image" name="image"
                           style="margin: 0; margin-bottom: 0.3rem;">
                           <img src="${img}" class="img" onclick="pop(this.src)">
                        </div>
                     </c:forEach>

                  </div>
               </div>
            </div>
         </div>
      </c:if>

            <div class="row mapyj" style="padding-bottom: 10px; margin-bottom:80px;">
                  <div class="insertinfoyj col-md-12" style="margin-bottom: 40px;">
                     <div class="row">
                        <div class="tdyj1 col-md-6"><span class="myinfo">매칭방식</span></div>
                        <div class="tdyj2 col-md-6"><span>${helpdetail.matching}</span></div>
                     
                     </div>
                  </div>

                  <div class="insertinfoyj col-md-12" style="margin-bottom: 40px;">
                     <div class="row">
                     <div class="tdyj1 col-md-6"><span class="myinfo">요청비용</span></div>
                     <div class="tdyj2 uiprice col-md-6">￦${helpdetail.pay}원</div>
                  </div></div>

                  <div class="insertinfoyj col-md-12">
                     <div class="row">
                     <div class="tdyj1 col-md-6"><span class="myinfo">결제방식</span></div>
                     <div class="tdyj2 col-md-6"><span>${helpdetail.paym}</span></div>
                  </div></div>
            </div>
            <!-- /row -->
            <div class="row pull-left">
               <a class="main-button icon-button curonyj" onclick="javascript:history.back();" style="white-space: nowrap; z-index: 2; margin-bottom: 40px; margin-top: 40px; margin-right: 20px;">뒤로가기</a>
            </div>
            <div class="row">
               <c:choose>
                  <c:when test="${helpdetail.helpid eq loginUser.userid}">
                     <a class="main-button icon-button pull-right"
                        onclick="helpdelete(${helpdetail.helpno});"
                        style="margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px; cursor: pointer;">삭제하기</a>
                     <c:if test="${helpdetail.status ne '완료' }">
                        <a class="main-button icon-button pull-right"
                           href="helpupdateview.do?helpno=${helpdetail.helpno}"
                           style="margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px; margin-right: 20px;">수정하기</a>
                     </c:if>
                  </c:when>
                  <c:otherwise>
                     <c:set var="num" value="0" />
                     <c:forEach var="hl" items="${helplist}">
                        <c:if test="${hl eq loginUser.userid }">
                           <c:set var="num" value="${num+1}" />
                        </c:if>
                     </c:forEach>
                     <span id="matchingbtn"> <c:choose>
                           <c:when test="${matchingcount lt 2}">
                              <c:if test="${helpdetail.matching eq '즉시'}">
                                 <a class="main-button icon-button pull-right"
                                    onclick="tobedanim();"
                                    style="cursor: pointer; margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px;">즉시
                                    도와주기</a>
                              </c:if>
                              <c:if test="${num eq 0 }">
                                 <c:if test="${helpdetail.matching ne '즉시'}">
                                    <span id="updatehelperlist"> <a
                                       class="main-button icon-button pull-right"
                                       onclick="intohelplist();"
                                       style="cursor: pointer; margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px;">다님이
                                          지원하기</a>
                                    </span>
                                 </c:if>
                              </c:if>
                              <c:if test="${num eq 1 }">
                                 <c:if test="${helpdetail.matching ne '즉시'}">
                                    <a class="main-button icon-button pull-right"
                                       onclick="intohelplist();"
                                       style="background-color: #EBEBEB; cursor: pointer; margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px;">지원취소하기</a>
                                 </c:if>
                              </c:if>
                           </c:when>
                           <c:otherwise>
                              <c:if test="${helpdetail.matching eq '즉시'}">
                                 <a class="main-button icon-button pull-right"
                                    onclick="alert('도움줄수 있는 심부름은 최대 2개 입니다.')"
                                    style="cursor: pointer; margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px; cursor: pointer;">즉시
                                    도와주기</a>
                              </c:if>
                              <c:if test="${helpdetail.matching ne '즉시'}">
                                 <a class="main-button icon-button pull-right"
                                    onclick="alert('도움줄수 있는 심부름은 최대 2개 입니다.')"
                                    style="cursor: pointer; margin-bottom: -5%; z-index: 2; margin-bottom: 40px; margin-top: 40px; cursor: pointer;">다님이
                                    지원하기</a>
                           </c:if>
                        </c:otherwise>
                     </c:choose>
                  </span>
               </c:otherwise>
            </c:choose>

         </div>
      </div>
         <!-- /container -->

   </div>
      </div>
      <!-- /Contact -->
      <!-- Footer -->
      <c:import url="../headfoot/footer.jsp" />
      <!-- /Footer -->
   </div>
   <!-- preloader -->
   <div id='preloader'>
      <div class='preloader'></div>
   </div>
   <!-- map -->
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd"></script>
   <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(Number(${helpdetail.locationcodelat}), Number(${helpdetail.locationcodelng})), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨 
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        var imageSrc = '/danim/resources/img/arrow.gif', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(35, 70), // 마커이미지의 크기입니다
            imageOption = {
                offset: new kakao.maps.Point(17.5, 70)
            }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(Number(${helpdetail.locationcodelat}), Number(${helpdetail.locationcodelng})); // 마커가 표시될 위치입니다


        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage // 마커이미지 설정 
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        //처음 맵위치로 이동
        function myloc() {
           map.setLevel(4);
           map.panTo(new kakao.maps.LatLng(Number(${helpdetail.locationcodelat}), Number(${helpdetail.locationcodelng})));
            
        }

    </script>
   <!-- /preloader -->
   <!-- jQuery Plugins -->
   <script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
   <script type="text/javascript"
      src="/danim/resources/js/bootstrap.min.js"></script>
   <!--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
        <script type="text/javascript" src="/danim/resources/js/google-map.js"></script>-->
   <script type="text/javascript" src="/danim/resources/js/main.js"></script>

   <script type="text/javascript"
      src="https://code.jquery.com/jquery-3.2.1.min.js"
      integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
      crossorigin="anonymous"></script>
   <!--        <script type="text/javascript" src="/danim/resources/js/image-uploader.min.js"></script>-->
   <!--    <script type="text/javascript" src="/danim/resources/js/image-uploader2.js"></script>-->

</body>

</html>