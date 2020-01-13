<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 관리자 페이지</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<link rel="shortcut icon" type="image⁄x-icon" href="/danim/resources/img/logo.png">
		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="/danim/resources/css/nkstyle.css" />
        <link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">
		<!-- Kakao Login -->
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		
        <style type="text/css">
            .area_navigation {
                position: relative;
                margin: 0 auto;
                width: 1080px;
                zoom: 1;
            }

            .area_navigation .an_l li {
                position: relative;
                float: left;
                padding-top: 16px;
                padding-right: 114px;
                zoom: 1;
            }

            .area_navigation .an_item {
                float: left;
            }

            li {
                display: list-item;
                text-align: -webkit-match-parent;
            }
    </style>

    </head>
	<body>

		<!-- Header -->
		<header id="header">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="adminHome.do">
							<img src="/danim/resources/img/logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Mobile toggle -->
					<button class="navbar-toggle">
						<span></span>
					</button>
					<!-- /Mobile toggle -->
				</div>
                <nav id="nav">
                        <ul class="main-menu nav navbar-nav navbar-right">
                            <li><a href="#">${loginAdmin.getAdminname()}</a></li>
                            <li><a href="adminHome.do">메인으로</a></li>
                            <li><a href="adminUsers.do?page=1">회원관리</a></li>
                            <li><a href="adminHelpCenter.do?page=1">문의관리</a></li>
                            <li><a href="adminNotice.do?page=1">공지관리</a></li>
                            <li><a href="logout.do" onclick="logout();">로그아웃</a></li>
                            <li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
                            <li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li>
                        </ul>
                    </nav>
			</div>
		</header>
		<!-- /Header -->

		<!-- Hero-area -->
		<div class="hero-area section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/danim/resources/img/page-background.jpg)"></div>
			<!-- /Backgound Image -->
			
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li><a href="#">Danim:</a></li>
						</ul>
						<h1 class="white-text">관리자 페이지</h1>
					</div>
				</div>
			</div>
		</div>
        <!-- /Hero-area -->
        <script type="text/javascript">
            $(function() {
                $.ajax({
                    type : 'post',
                    url : 'countUsers.do',
                    success : function(count){
                        document.getElementById('allusers').innerHTML += count + " 명";
                    }
                })
            });
        </script>
		<!-- Contact -->
		<div id="contact" class="section" >
				<!-- container -->
				<div class="container">
                    <div>
                        <h2 id="allusers">현재 총 회원 : </h2>
					</div>
					<div style="margin-top: 5%;">
						<a href="adminUsers.do?page=1" style="font-size: 1.3em;">회원 관리 -></a><br><br>
						<a href="adminHelpCenter.do?page=1" style="font-size: 1.3em;">고객 문의 관리 -></a><br><br>
						<a href="adminNotice.do?page=1" style="font-size: 1.3em;">공지사항 관리 -></a>	
					</div>
				</div>
				<!-- /container -->
	
			</div>
		<!-- /Contact -->

		<!-- Footer -->
		<footer id="footer" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<!-- footer logo -->
					<div class="col-md-6">
						<div class="footer-logo">
							<a class="logo" href="admin.do">
								<img src="/danim/resources/img/logo.png" alt="logo">
							</a>
						</div>
					</div>
				

				</div>
				<!-- /row -->

				<!-- row -->
				<div id="bottom-footer" class="row">

					<!-- social -->
					<div class="col-md-4 col-md-push-8">
						<ul class="footer-social">
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
						</ul>
					</div>
					<!-- /social -->

					<!-- copyright -->
					<div class="col-md-8 col-md-pull-4">
						<div class="footer-copyright">
							<span>&copy; Copyright Koo gun mo. | This Poroject is made with Kim nam gyu & You young joon</a></span>
						</div>
					</div>
					<!-- /copyright -->

				</div>
				<!-- row -->

			</div>
			<!-- /container -->

		</footer>
		<!-- /Footer -->

		<!-- preloader -->
		<div id='preloader'><div class='preloader'></div></div>
		<!-- /preloader -->


		<!-- jQuery Plugins -->
		<script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/danim/resources/js/main.js"></script>
        
        <!-- etc script -->
        <script>
                function notice() {
                    location.href("userindex.do");
                }
            </script>

	</body>
</html>
