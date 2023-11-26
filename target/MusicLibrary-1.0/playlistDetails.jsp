<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Music Library</title>
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
        <link rel="stylesheet" href="css/playlistDetailsStyle.css" type='text/css' />
        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>
        <script src="js/play_music_script.js"></script>
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
            <!-- /w3l-agile -->
            <!-- left side end-->
            <!-- /w3l-agileits -->
            <!-- signup -->
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
                                        <form action="#" method="post">
                                            <h3>Create your account </h3>
                                            <input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Name';
                                                    }" required="">
                                            <input type="text" value="Mobile number" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Mobile number';
                                                    }" required="">
                                            <input type="text" value="Email id" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Email id';
                                                    }" required="">	
                                            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Password';
                                                    }" required="">	

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
            <!-- /w3l-agile-its -->
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
                                    <form action="#" method="post">
                                        <input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
                                        <input class="sb-search-submit" type="submit" value="">
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
                                        <c:if test="${selectedPlaylistSongs.size() == 0}">
                                            <source src="" type="audio/mpeg">
                                        </c:if>
                                        
                                        <c:forEach items="${selectedPlaylistSongs}" begin="0" end="0" var="playlistSong" >
                                            <source src="songs/song${playlistSong.getMusicID()}.mp3" type="audio/mpeg">
                                        </c:forEach>
                                    </audio>
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

                                <!-- /w3layouts-agile -->
                                <!--//-->
                                <ul class="next-top">
                                    <li><a class="ar" onclick="playPrevious()"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" onclick="playNext()"><img src="images/arrow2.png" alt=""/></i></a></li>
                                    <div class="audio-info">
                                        <c:forEach items="${selectedPlaylistSongs}" begin="0" end="0" var="playlistSong" >
                                            <span id="songName">${playlistSong.getName()}</span>
                                            <span id="songAuthor">${playlistSong.getAuthor().getName()}</span> 
                                        </c:forEach>
                                    </div>
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
                                                        <input type="submit" id="login" value="Sign in">
                                                        <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                                    </fieldset>
                                                    <span><a href="#">Forgot your password?</a></span>
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
                <!-- /wthree-agile -->
                <!-- //header-ends -->


                <script>
                    function passSongNameAndIDToModal(name, ID) {
                        var inputElement = document.getElementById('deletingSongID');
                        inputElement.value = ID;
                        inputElement.setAttribute('value', ID);
                        document.getElementById("modelSongName").innerText = "Are you sure you want to remove '" + name + "' from Playlist?";
                    }
                </script>

                <div id="page-wrapper">

                    <div class="inner-content single container-fluid">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="playlist-details">
                                    <div class="playlist-image">
                                        <img src="${selectedPlaylist.getCover()}">
                                    </div>
                                    <div class="playlist-info">
                                        <h3 class="playlist-title">${selectedPlaylist.getName()}</h3>
                                        <div class="playlist-author">
                                            <span>${selectedPlaylist.getUser().getName()}</span>
                                        </div>
                                        <div class="playlist-action">
                                            <button class="btn btn-primary play-btn" onclick="playChosenSong(0)"><span class="fa fa-play" aria-hidden="true"></span><span class="padding-left-10">Play</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-8">
                                <div class="playlist-songs">
                                    <div class="media-header bg-warning">
                                        <div class="media-header-content">
                                            <i class="fa fa-music" ></i>
                                            <span class="padding-left-10">Songs</span>
                                        </div>
                                    </div>

                                    <div class="media-body bg-info">


                                        <c:forEach items="${selectedPlaylistSongs}" var="playlistSong" varStatus="status">
                                            <div class="song-item" id="song${status.count - 1}">
                                                <div class="song-index">
                                                    <span class>${status.count}</span>
                                                </div>

                                                <div class="song-thumb">
                                                    <figure class="is40x40">
                                                        <img src="${playlistSong.getImage()}" alt="${playlistSong.getName()} image">
                                                    </figure>
                                                    <div class="song-action">
                                                        <button onclick="playChosenSong(${status.count - 1})">
                                                            <i class="fa fa-play" aria-hidden="true"></i>
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="song-info">
                                                    <div class="song-name">
                                                        ${playlistSong.getName()}
                                                    </div>
                                                    <div class="song-author">
                                                        ${playlistSong.getAuthor().getName()}
                                                    </div>
                                                </div>

                                                <div class="song-action2">
                                                    <c:choose>
                                                        <c:when test="${selectedPlaylist.getUser().getUserID() == loggeduser.getUserID()}">
                                                            <div class="song-delete-action">
                                                                <button onclick="passSongNameAndIDToModal('${playlistSong.getName()}', ${playlistSong.getMusicID()})"
                                                                        data-toggle = "modal" data-target = "#removeSongFromPlaylist">
                                                                    <i class="fa fa-times" aria-hidden="true"></i>
                                                                </button>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="song-like-action">
                                                                <button>
                                                                    <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                                                </button>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>

                                    <div class="media-bottom bg-gray">

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /w3l-agileits-->





                    <!-- Remove Song from playlist Modal -->
                    <div class = "modal fade" id = "removeSongFromPlaylist" tabindex = "-1" role = "dialog" aria-labelledby = "exampleModalLabel"
                         aria-hidden="true">
                        <div class = "modal-dialog" role = "document">
                            <div class = "modal-content">
                                <form method="post" action="playlist">
                                    <div class = "modal-header">
                                        <button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close">
                                            <span aria-hidden = "true"> × </span>
                                        </button>
                                        <h4 class = "modal-title" id = "exampleModalLabel"> Remove from Playlist </h4>
                                    </div>
                                    <div class = "modal-body"><span id="modelSongName">...</span></div>
                                    <div class = "modal-footer">
                                        <input type="hidden" name="selectedPlaylistID" value="${selectedPlaylist.getPlaylistID()}">
                                        <input type="hidden" id="deletingSongID" name="deletingSongID">
                                        <button type = "button" class = "btn btn-secondary" data-dismiss = "modal"> Cancel </button>
                                        <button type = "submit" name="action" value="Remove song from playlist" class = "btn btn-primary"> Confirm </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>







                    <!--body wrapper start-->
                    <div class="review-slider">

                        <div class="tittle-head">
                            <h3 class="tittle">Maybe you will like</h3>
                            <div class="clearfix"> </div>
                        </div>
                        <ul id="flexiselDemo1">
                             <c:forEach items="${randPlaylist}" var="playlist">
                            <li>
                                <c:if test="${playlist.getPlaylistID() != selectedPlaylist.getPlaylistID()}">
                                 <form action="search" method="post"> 
                                                                        <input type="hidden" value="${playlist.getPlaylistID()}" name="playlistID">
                                                                    <button class="btn" name="action" value="View playlist" type="submit">
									<a  href="#"><img src="${playlist.getCover()}" style="width:200px;height:200px"></a>
									<a class="sing">${playlist.getName()}</a>
                                                                    </button>
                                                                    </form>
                                </c:if>
                                 <c:if test="${playlist.getPlaylistID() == selectedPlaylist.getPlaylistID()}">
                                                                        <p>Playing</p>
									<a  href="#"><img src="${playlist.getCover()}" style="width:200px;height:200px"></a>
									<a class="sing">${playlist.getName()}</a>
                                </c:if>
                            </li>
                             </c:forEach>
                        </ul>
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
                <!-- /w3layouts-agile -->
            </div>





            <!--body wrapper end-->           
            <!-- /w3layouts-agile -->
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
        <script>
                            window.onload = function () {
            <c:forEach items="${selectedPlaylistSongs}" var="playlistSong">
                                addSongToPlaylist(${playlistSong.getMusicID()}, '${playlistSong.getName()}', '${playlistSong.getAuthor().getName()}');
            </c:forEach>
                            };
        </script>
    </body>
</html>
