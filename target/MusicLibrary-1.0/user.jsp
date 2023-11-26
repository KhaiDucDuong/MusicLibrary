
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Mosaic a Entertainment Category Flat Bootstrap Responsive Website Template | 404 :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.css" type='text/css' />
<!-- //lined-icons -->
 <!-- Meters graphs -->
<script src="js/jquery-2.1.4.js"></script>
    <script>
function confirmComplete() {
var answer=confirm("Are you sure want to delete this account?");
if (answer==true)
  {
    return true;
  }
else
  {
    return false;
  }
}</script>
</head> 
   	 <!-- /w3layouts-agile -->
 <body class="sticky-header left-side-collapsed"  onload="initMap()">
    <section>
      <!-- left side start-->
		 <div class="left-side sticky-left-side">

                <!--logo and iconic logo start-->
                <div class="logo">
                    <h1><a href="index.jsp">Mosai<span>c</span></a></h1>
                </div>
                <div class="logo-icon text-center">
                    <a href="index.jsp">M </a>
                </div>
                <!-- /w3l-agile -->
                <!--logo and iconic logo end-->
                <div class="left-side-inner">

                    <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <li><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
                        <li><a href="admin?action=showAllMusic"><i class="lnr lnr-music-note"></i> <span>Songs</span></a></li>
                        <li><a href="admin?action=showAllArtist"><i class="lnr lnr-users"></i> <span>Artists</span></a></li>
                        <li><a href="admin?action=showAllPlaylist"><i class="lnr lnr-text-align-justify"></i> <span>Albums</span></a></li>						
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>
		<!-- left side end-->
			 <!-- /w3layouts-agile -->
				 <!-- /w3l-agile -->
		<!-- signup -->
			<!- //signup -->-
	 <!-- /w3l-agile -->
		<!-- main content start-->
		<div class="main-content">
			<!-- header-starts -->
			<div class="header-section">
			<!--toggle button start-->
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<!--toggle button end-->
			<!--notification menu start -->
				<div class="menu-right">
					<div class="profile_details">		
						  <div class="col-md-4 serch-part">
								 <div id="sb-search" class="sb-search">
                                    <form action="search" method="post">
                                        <input class="sb-search-input" placeholder="Search" type="search" name="songSearch" id="search">
                                        <input class="sb-search-submit" type="submit" name="action" value="search">
                                        <span class="sb-icon-search"> </span>
                                    </form>
                                </div>
							</div>
							  <!-- search-scripts -->
									<script src="js/classie.js"></script>
									<script src="js/uisearch.js"></script>
										<script>
											new UISearch( document.getElementById( 'sb-search' ) );
										</script>
									<!-- //search-scripts -->
											 <!---->
											  <div class="col-md-4 player">
                                 
                                <div class="audio-player">
                                    <audio id="audio-player"  controls="controls">
                                        <source src="" type="audio/ogg"></source>
                                        <source src="" type="audio/mpeg"></source>
                                        <source src="" type="audio/ogg"></source>
                                        <source src="" type="audio/mpeg"></source></audio>
                                </div>
                                <!---->
                                <script type="text/javascript">
                                    $(function () {
                                        $('#audio-player').mediaelementplayer({
                                            alwaysShowControls: true,
                                            features: ['playpause', 'progress', 'volume'],
                                            audioVolume: 'horizontal',
                                            iPadUseNativeControls: true,
                                            iPhoneUseNativeControls: true,
                                            AndroidUseNativeControls: true
                                        });
                                    });
                                </script>
                                <!--audio-->
                                <link rel="stylesheet" type="text/css" media="all" href="css/audio.css">
                                <script type="text/javascript" src="js/mediaelement-and-player.min.js"></script>
                                <!---->


                                <!--//-->
                                <ul class="next-top">
                                    <li><div class="audio-info">
                                        <span id="songName"></span>
                                        <span id="songAuthor"></span> 
                                    </div></li>
                                    <li><a class="ar" href="#"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" href="#"><img src="images/arrow2.png" alt=""/></a></li>
                                </ul>	
                            </div>
											<div class="col-md-4 login-pop">
                                                                                                 <c:if test="${loggeduser.getUserID()!=1}">
                                        <div id="loginpop"> <a href="#" id="loginButton"><img class="miniprofile" src="${loggeduser.getImage()}"/></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                            <div id="loginBox" style="margin-top:10px">  
                                                <form action="login" method="post" id="loginForm">
                                                    <fieldset id="body">
                                                        <fieldset>
                                                            <label>Username = ${loggeduser.getName()}</label>
                                                        </fieldset>
                                                        <fieldset>
                                                            <label>Email = ${loggeduser.getGmail()}</label>
                                                        </fieldset>
                                                         <input type="submit" name="action" value="Playlist" > 
                                                    <input type="submit" name ="action" id="My profile" value="My profile">
                                                    <input type="submit" name ="action" id="setting" value="Setting">
                                                     <input type="submit" name="action" value="Log out" id="login" style="margin-top: 10px">
                                                    </fieldset>   
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${loggeduser.getUserID() ==1}" >
                                              <div id="loginpop"> <a href="#" id="loginButton"><img class="miniprofile" src="${loggeduser.getImage()}"/></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                            <div id="loginBox">  
                                                <form action="login" method="post" id="loginForm">
                                                    <fieldset id="body">
                                                        <fieldset>
                                                            <label>Username = ${loggeduser.getName()}</label>
                                                        </fieldset>
                                                        <fieldset>
                                                            <label>Email = ${loggeduser.getGmail()}</label>
                                                        </fieldset>
                                                    <input type="submit" name ="action" value="Account Manager">
                                                    <input type="submit" name="action" value="Playlist" > 
                                                    <input type="submit" name ="action" id="My profile" value="My profile">
                                                    <input type="submit" name ="action" id="setting" value="Setting">
                                                     <input type="submit" name="action" value="Log out" id="login" style="margin-top: 10px">
                                                    </fieldset>   
                                                </form>

                                            </div>
                                        </div>
                                        </c:if>
											</div>
										<div class="clearfix"> </div>
								</div>
							<!-------->
						</div>
					<div class="clearfix"></div>
				</div>
			<!--notification menu end -->
			<!-- //header-ends -->
	 <!-- /agileits -->
					<!-- //header-ends -->
						<div id="page-wrapper">
						<div class="inner-content">
						
									<!-- Account Details Section -->
  <section class="container mt-5" id="account-details">
   <div class="row justify-content-center">
    <div class="col-md-6">
     <h2>
      Account change
     </h2>
    
     <form id="accountForm" method="post" action="login" enctype="multipart/form-data">
     <input type="hidden" name="loginEmail" value="${loggeduser.getGmail()}"/>
     <input type="hidden" name="userID" value="${loggeduser.getUserID()}"/>
      <div class="form-group">
       <label for="name">
        Name:
       </label>
       <input class="form-control" id="name" name="changeName" value="${loggeduser.getName()}" required="" type="text"/>
      </div>
          <div class="form-group">
       <label for="password">
        Password:
       </label>
       <input class="form-control" id="phone" name="loginPass" value="${loggeduser.getPass()}" required="" type="password"/>
      </div>
      <div class="form-group">
       <label for="phone">
        Phone:
       </label>
       <input class="form-control" id="phone" name="changePhone" value="${loggeduser.getPhoneNumber()}" required="" type="tel"/>
      </div>
       <div class="form-group">
       <label for="information">
        Information:
       </label>

       <input class="form-control" id="phone" name="changeInfor" value="${loggeduser.getInfor()}" required="" type="tel"/>
       </div>
      <div class="form-group">
       <label for="profilePhoto">
        Profile Photo:
       </label>
       <input class="form-control-file" id="profilePhoto" type="file" name="userprofile" accept="image/png, image/jpeg"/>
      </div>
               <p><i>${message}</i></p>
      <button class="btn btn-primary" type="submit" name="action" value="save" >
       Save Changes
      </button>
      <button class="btn btn-danger" id="deleteAccountBtn" type="submit" name="action" value="delete" onclick="{return confirmComplete();}">
       Delete Account
      </button>
     </form>
    </div>
   </div>
  </section>
							<div class="clearfix"></div>
						<!--body wrapper end-->
						</div>		
					</div>
						 <!-- /agileinfo -->
			  <!--body wrapper end-->
			         <div class="footer two">
				<div class="footer-grid">
					<h3>Navigation</h3>
					<ul class="list1">
					  <li><a href="index.jsp">Home</a></li>
					  <li><a href="radio.html">All Songs</a></li>
					  <li><a href="browse.html">Albums</a></li>
					  <li><a href="radio.html">New Collections</a></li>
					  <li><a href="blog.html">Blog</a></li>
					  <li><a href="contact.html">Contact</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Our Account</h3>
				    <ul class="list1">
					  <li><a href="#" data-toggle="modal" data-target="#myModal5">Your Account</a></li>
					  <li><a href="#">Personal information</a></li>
					  <li><a href="#">Addresses</a></li>
					  <li><a href="#">Discount</a></li>
					  <li><a href="#">Orders history</a></li>
					  <li><a href="#">Addresses</a></li>
					  <li><a href="#">Search Terms</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Our Support</h3>
					<ul class="list1">
					  <li><a href="contact.html">Site Map</a></li>
					  <li><a href="#">Search Terms</a></li>
					  <li><a href="#">Advanced Search</a></li>
					  <li><a href="#">Mobile</a></li>
					  <li><a href="contact.html">Contact Us</a></li>
					  <li><a href="#">Mobile</a></li>
					  <li><a href="#">Addresses</a></li>
				    </ul>
				  </div>
					  <div class="footer-grid">
						<h3>Newsletter</h3>
						<p class="footer_desc">Nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</p>
						<div class="search_footer">
						 <form>
						   <input type="text" placeholder="Email...." required="">
						  <input type="submit" value="Submit">
						  </form>
						</div>
					 </div>
					 <div class="footer-grid footer-grid_last">
						<h3>About Us</h3>
						<p class="footer_desc">Diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat enim ad minim veniam,.</p>
						<p class="f_text">Phone:  &nbsp;&nbsp;&nbsp;00-250-2131</p>
						<p class="email">Email : &nbsp;<span><a href="mailto:mail@example.com">info(at)mailing.com</a></span></p>	
					 </div>
					 <div class="clearfix"> </div>
				</div>
			</div>
				 <!-- /wthree-agile -->
        <!--footer section start-->
			<footer>
			   <p>&copy 2016 Mosaic. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts.</a></p>
			</footer>
        <!--footer section end-->

      <!-- main content end-->
   </section>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>