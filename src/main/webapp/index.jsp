<%@page import="DBUtil.PlaylistDB"%>
<%@page import="LibraryClass.Playlist"%>
<%@page import="DBUtil.MusicDB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="LibraryClass.Music"%>
<%@page import="LibraryClass.Music"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Mosaic a Entertainment Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/jquery-2.1.4.js"></script>
        <script src="js/play_music_script.js"></script>
        <script>
                                    function passIDToModal(ID) {
                                        var inputElement = document.getElementById('songID');
                                        inputElement.value = ID;
                                        inputElement.setAttribute('value', ID);
                                    }
                    </script>
                   
        <% 
        List<Music> newMusic = MusicDB.select12Songs();
        List<Playlist> randPlaylist = PlaylistDB.select8Playlist();
        List<Playlist> first8Playlist = PlaylistDB.selectFirst8Playlist();
        %>

    </head> 
    <!-- /w3layouts-agile -->
    <body class="sticky-header left-side-collapsed"  onload="initMap()">
        <script>
            $(document).ready(function() {
    var successMessage = "${messagelogin}";
    if (successMessage.trim() !== "") {
        $('#loginmodal').modal('show');
    }
});
        </script>
        <c:if test ="${not empty messagelogin}">
            <div class="modal" id="loginmodal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
          <h3><span class="lnr lnr-enter" style="font-size: 22px;">  Notification</span></h3>
      </div>
      <div class="modal-body">
        <p style="font-size: 18px;text-align: center">${messagelogin}</p>
      </div>
    </div>
  </div>
</div>
        </c:if>
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
                        <li class="active"><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
                        <li><a href="admin?action=showAllMusic"><i class="lnr lnr-music-note"></i> <span>Songs</span></a></li>
                        <li><a href="admin?action=showAllArtist"><i class="lnr lnr-users"></i> <span>Artists</span></a></li>
                        <li><a href="admin?action=showAllPlaylist"><i class="lnr lnr-text-align-justify"></i> <span>Albums</span></a></li>						
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>
            <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content modal-info">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <div class="modal-body modal-spa">
                            <div class="sign-grids">
                                <div class="sign">
                                    <div class="sign-right">
                                        <form action="login" method="post" onsubmit="return validateForm()">
                                            <h3>Create your account </h3>
                                            <input type="hidden" name="action" value="registerUser">
                                            <label>Name</label><br>
                                            <input type="text" name="Name"  required>
                                            <label>Phone number</label><br>
                                            <input type="text" name="Number"  required>
                                            <label>Email</label><br>
                                            <input type="text" name="Email" required>	
                                            <label>Password</label><br>
                                            <input type="password" name="Password" required>	

                                            <input type="submit" value="CREATE ACCOUNT" >
                                        </form>
                                    </div>
                                    <div class="clearfix"></div>								
                                </div>
                                <p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //signup -->
            <!-- /w3l-agile -->
            <!-- left side end-->
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
        new UISearch(document.getElementById('sb-search'));
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
                                <c:choose>
                                    <c:when test="${loggeduser == null}">
                                        <div id="loginpop"> <a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                            <div id="loginBox">  
                                                <form action="login" method="post" id="loginForm">
                                                    <p>${message}</p>
                                                    <input type="hidden" name="action" value="loginUser">

                                                    <fieldset id="body">
                                                        <fieldset>
                                                            <label for="email">Email Address</label>
                                                            <input type="text" name="loginEmail" id="email">
                                                        </fieldset>
                                                        <fieldset>
                                                            <label for="password">Password</label>
                                                            <input type="password" name="loginPass" id="password">
                                                        </fieldset>
                                                        <input type="submit" id="login" value="Sign in" onclick="showPopup()">
                                                        <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                                    </fieldset>
                                                    <span><a href="forgotPassword.jsp">Forgot your password?</a></span>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
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
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-------->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!--notification menu end -->
                <!-- //header-ends -->
                <!-- /w3l-agileits -->
                <!-- //header-ends -->
                <div id="page-wrapper">
                    <div class="inner-content">
                        <!--notification menu end -->
                        <!-- //header-ends -->
                        <!-- /w3l-agileits -->
                        <!-- //header-ends -->
                        <div id="page-wrapper">
                            <div class="inner-content">

                                <div>
                                    <!--banner-section-->
                                    <div class="banner-section">
                                        <div class="banner">
                                            <div class="callbacks_container">
                                                <ul class="rslides callbacks callbacks1" id="slider4">
                                                    <li>
                                                        <div class="banner-img">
                                                            <img src="images/songs_img/banner1.jpg" class="img-responsive" alt="" onclick="createNewPlaylist(1, 'Tháng tư là lời nói dối của em', 'Hà Anh Tuấn')">
                                                        </div>
                                                        <div class="banner-info">
                                                            <h3>Tháng tư là lời nói dối của em</h3>
                                                            <p><span>Hà Anh Tuấn</span></p>
                                                        </div>

                                                    </li>
                                                    <li>
                                                        <div class="banner-img">
                                                            <img src="images/songs_img/banner2.jpg" class="img-responsive" alt="" onclick="createNewPlaylist(2, 'Hạ còn vương nắng', 'DATKKA')">
                                                        </div>
                                                        <div class="banner-info">
                                                            <h3>Hạ còn vương nắng</h3>
                                                            <p><span>DATKKA</span></p>
                                                        </div>


                                                    </li>
                                                    <li>
                                                        <div class="banner-img">
                                                            <img src="images/songs_img/banner3.jpg" class="img-responsive" alt="" onclick="createNewPlaylist(3, 'Nàng thơ', 'Hoàng Dũng')">
                                                        </div>
                                                        <div class="banner-info"> 
                                                            <h3>Nàng thơ</h3>
                                                            <p><span>Hoàng Dũng</span></p>
                                                        </div>

                                                        <!-- /w3layouts-agileits -->
                                                    </li>
                                                </ul>
                                            </div>
                                            <!--banner-->
                                            <script src="js/responsiveslides.min.js"></script>
                                            <script>
                                            // You can also use "$(window).load(function() {"
                                            $(function () {
                                                // Slideshow 4
                                                $("#slider4").responsiveSlides({
                                                    auto: true,
                                                    pager: true,
                                                    nav: true,
                                                    speed: 500,
                                                    namespace: "callbacks",
                                                    before: function () {
                                                        $('.events').append("<li>before event fired.</li>");
                                                    },
                                                    after: function () {
                                                        $('.events').append("<li>after event fired.</li>");
                                                    }
                                                });

                                            });
                                            </script>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>	
                                    <!--//End-banner-->
                                    <!--albums-->
                                    <!-- pop-up-box --> 
                                    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all">
                                    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                                    <script>
                                            $(document).ready(function () {
                                                $('.popup-with-zoom-anim').magnificPopup({
                                                    type: 'inline',
                                                    fixedContentPos: false,
                                                    fixedBgPos: true,
                                                    overflowY: 'auto',
                                                    closeBtnInside: true,
                                                    preloader: false,
                                                    midClick: true,
                                                    removalDelay: 300,
                                                    mainClass: 'my-mfp-zoom-in'
                                                });
                                            });
                                    </script>		
                                    <!--//pop-up-box -->
                                    <div class="albums">
                                        <div class="tittle-head">
                                            <h3 class="tittle">New Releases <span class="new">New</span></h3>
                                            <div class="clearfix"> </div>
                                        </div>
                                        <% for (Music music : newMusic) { %>
                                        <div class="col-md-3 browse-grid">
                                            <a ><img src="<%=music.getImage() %>" onclick="createNewPlaylist(<%=music.getMusicID()%>, '<%=music.getName() %>', '<%=music.getAuthor().getName()%>')" style="width:200px;height:200px"></a>
                                            <c:if test="${not empty loggeduser}">
                                              <a class="setting-button" data-toggle="modal" data-target="#addToPlaylist" style="text-decoration:none;" onclick="passIDToModal(<%=music.getMusicID()%>)"><i class="fa fa-plus" style="font-size:24px"></i></a>
                                           </c:if>
                                            <a class="button play-icon popup-with-zoom-anim"><%=music.getName() %></a>
                                        </div>
                                        <% } %>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <!--//End-albums-->
                                    <!--//discover-view-->
                                    <div class="albums second">
                                        <div class="tittle-head">
                                            <h3 class="tittle">Discover playlist: <span class="new">View</span></h3>
                                            <a href="admin?action=showAllPlaylist"><h4 class="tittle two">See all</h4></a>
                                            <div class="clearfix"> </div>
                                        </div>
                                         <% for (Playlist playlist : randPlaylist) { %>
                                        <div class="col-md-3 content-grid">
                                            <form action="search" method="post"> 
                                                                        <input type="hidden" value="<%=playlist.getPlaylistID() %>" name="playlistID">
                                                                    <button class="btn" name="action" value="View playlist" type="submit">
									<a  href="#"><img src="<%=playlist.getCover() %>" style="width:320px;height:320px"></a>
									<a class="sing"><%=playlist.getName() %></a>
                                                                    </button>
                                                                    </form>
                                        </div>
                                        <% } %>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <!--//discover-view-->
                                </div>
                                <!--//music-left-->
                                <!--/music-right-->
                                <!--//music-right-->
                                <div class="clearfix"></div>
                                <!-- /w3l-agile-its -->
                            </div>
                            <!--body wrapper start-->

                            <div class="review-slider">
                                <div class="tittle-head">
                                    <h3 class="tittle">Featured Albums <span class="new"> New</span></h3>
                                    <div class="clearfix"> </div>
                                </div>
                                <ul id="flexiselDemo1">
                                     <% for (Playlist playlist : first8Playlist) { %>
                                    <li>
                                       <form action="search" method="post"> 
                                                                        <input type="hidden" value="<%=playlist.getPlaylistID() %>" name="playlistID">
                                                                    <button class="btn" name="action" value="View playlist" type="submit">
									<a  href="#"><img src="<%=playlist.getCover() %>" style="width:200px;height:200px"></a>
									<a class="sing"><%=playlist.getName() %></a>
                                                                    </button>
                                                                    </form>
                                                                     </li>
                                        <% } %>
                                </ul>
                                 <div class="modal fade" id="addToPlaylist" tabindex="-1" role="dialog" aria-labelledby="modalLabelLarge" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="modalLabelLarge">Add song to playlist:</h4>
                                </div>
                                <form action="playlist" method="post">
                                    <div class="modal-body">

                                        <select class="form-control input-lg" name="playlistID">
                                            <c:forEach items="${userPlaylists}" var="userPlaylist">
                                                <option value="${userPlaylist.getPlaylistID()}">${userPlaylist.getName()} playlist</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" id="songID" name="songID">
                                        <input type="submit" name="action" value="Add Song to Playlist Index" class="btn btn-secondary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                                <script type="text/javascript">
                                    $(window).load(function () {

                                        $("#flexiselDemo1").flexisel({
                                            visibleItems: 5,
                                            animationSpeed: 1000,
                                            autoPlay: true,
                                            autoPlaySpeed: 3000,
                                            pauseOnHover: false,
                                            enableResponsiveBreakpoints: true,
                                            responsiveBreakpoints: {
                                                portrait: {
                                                    changePoint: 480,
                                                    visibleItems: 2
                                                },
                                                landscape: {
                                                    changePoint: 640,
                                                    visibleItems: 3
                                                },
                                                tablet: {
                                                    changePoint: 800,
                                                    visibleItems: 4
                                                }
                                            }
                                        });
                                    });
                                </script>
                                <script type="text/javascript" src="js/jquery.flexisel.js"></script>	
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--body wrapper end-->
                        <!-- /w3l-agile -->
                    </div>
                    <!--body wrapper end-->
                    <div class="footer">
                         <div class="footer-grid">
                            <h3>Group members:</h3>
                        </div>
                        <div class="footer-grid">
                            <h3>Trần Mạnh Tiến</h3>
                        </div>
                        <div class="footer-grid">
                            <h3>Dương Đức Khải</h3>
                           
                        </div>
                        <div class="footer-grid">
                            <h3>Mai Trọng Vũ</h3>
                        </div>
                    </div>
                </div>
                <!--footer section start-->
                <footer>
                    <p>&copy 2023 Web programming project. Music Library  Reserved | Design by Group 2</p>
                </footer>
                <!--footer section end-->
                <!-- /w3l-agile -->
                <!-- main content end-->
        </section>

        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>