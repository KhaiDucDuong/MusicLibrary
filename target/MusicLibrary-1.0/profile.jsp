<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-control" content="no-cache">
        <title>Profile</title>
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

        <link rel="stylesheet" href="css/profile-style.css" type ='text/css'/>

        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>
    </head>
    <body class="sticky-header left-side-collapsed"  onload="initMap()">
        <main>
            <div class="left-side sticky-left-side">

                <!--logo and iconic logo start-->
                <div class="logo">
                    <h1><a href="index.jsp">Mosai<span>c</span></a></h1>
                </div>
                <div class="logo-icon text-center">
                    <a href="index.jsp">M </a>
                </div>

                <div class="left-side-inner">

                    <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <li><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
                        <li><a href="#"><i class="camera"></i> <span>Radio</span></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-th"></i><span>Apps</span></a></li>
                        <li><a href="#"><i class="lnr lnr-users"></i> <span>Artists</span></a></li> 
                        <li><a href="#"><i class="lnr lnr-music-note"></i> <span>Albums</span></a></li>						
                        <li class="menu-list"><a href="#"><i class="lnr lnr-indent-increase"></i> <span>Browser</span></a>  
                            <ul class="sub-menu-list">
                                <li><a href="#">Artists</a> </li>
                                <li><a href="#">Services</a> </li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="lnr lnr-book"></i><span>Blog</span></a></li>
                        <li><a href="#"><i class="lnr lnr-pencil"></i> <span>Typography</span></a></li>
                        <li class="menu-list"><a href="#"><i class="lnr lnr-heart"></i>  <span>My Favourities</span></a> 
                            <ul class="sub-menu-list">
                                <li><a href="#">All Songs</a></li>
                            </ul>
                        </li>
                        <li class="menu-list"><a href="#"><i class="fa fa-thumb-tack"></i><span>Contact</span></a>
                            <ul class="sub-menu-list">
                                <li><a href="#">Location</a> </li>
                            </ul>
                        </li>
                        <li class="active"><a href="profile.jsp"><i class="lnr lnr-user"></i><span>Profile: ${loggeduser.name}</span></a></li>
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>

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
                                        <source src="media/Blue Browne.ogg" type="audio/ogg"></source>
                                        <source src="media/Blue Browne.mp3" type="audio/mpeg"></source>
                                        <source src="media/Georgia.ogg" type="audio/ogg"></source>
                                        <source src="media/Georgia.mp3" type="audio/mpeg"></source></audio>
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
                                    <li><a class="ar" href="#"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" href="#"><img src="images/arrow2.png" alt=""/></i></a></li>

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







                <div id="page-wrapper">
                    <section class="container-fluid" id="user-deatails-MW">
                        <!--user profile-->
                        <div class="">
                            <table width="100%" class="table table-bordered">
                                <tr>
                                    <td class="col-xs-4 user-img" rowspan="4">
                                        <c:choose>
                                            <c:when test="${loggeduser.getImage() != null}">
                                                <img src="${loggeduser.getImage()}" alt="profile picture" 
                                                     class = "img-rounded img-responsive"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="images/users_img/default-profile.jpg" alt="profile picture" 
                                                     class = "img-rounded img-responsive"/>
                                            </c:otherwise>    
                                        </c:choose>
                                    </td>

                                    <td id="info-row" class="col-xs-4" colspan="1">
                                        <h2 class="user-name">${loggeduser.getName()}</h2>
                                    </td>

                                    <td id="info-row" class="col-xs-4" colspan="1">
                                        <form method="post" action="login">
                                            <button type="submit" name="action" value="start_create_newMusic" class="btn btn-light">Upload new song</button>
                                            <p>${message}</p>  
                                        </form>
                                    </td>
                                </tr>
                                <tr >
                                    <td id="info-row" class="col-xs-8" colspan="2">
                                        <p class="user-id h3">User ID: ${loggeduser.getUserID()}</p>
                                        <p class="user-email">Email: ${loggeduser.getGmail()}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="info-row" class="col-xs-8 borderless-top borderless-bottom" colspan="2">
                                        <p class="user-infor">${loggeduser.getInfor()}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="info-row" class="col-xs-4" colspan="1">
                                        <div class="">
                                            <span class="user-records">Liked songs: 44</span>
                                            <span class="lnr lnr-heart vector-symbol"></span>
                                        </div>
                                    </td>
                                    <td id="info-row" class="col-xs-4" colspan="1">
                                        <div class="">
                                            <span class="user-records">Uploaded songs: ${userUploadedSongs.size()}</span>
                                            <span class="lnr lnr-music-note vector-symbol"></span>
                                        </div>
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </section>
                    <!--End user profile--> 



                    <script>
                                    function passIDToModal(ID) {
                                        var inputElement = document.getElementById('songID');
                                        inputElement.value = ID;
                                        inputElement.setAttribute('value', ID);
                                    }
                    </script>



                    <section class="container-fluid" id="user-uploaded-music">
                        <div class="row justify-content-center bg-danger">

                            <div class="container-fluid">
                                <div class="col-xs-6 no-padding">
                                    <h2>Uploaded songs</h2>
                                </div>
                                <div class="col-xs-6">
                                    <c:if test="${userUploadedSongs.size() > 6}">
                                        <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#footwear" aria-expanded="false" aria-controls="footwear">
                                            See all
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center bg-danger equal-height">
                            <c:forEach items="${userUploadedSongs}" begin="0" end="5" var="uploadedSong">
                                <div class="col-xs-4 col-lg-2 max-height-col padding-bottom">
                                    <div class="thumbnail">

                                        <img src="${uploadedSong.getImage()}" alt="${uploadedSong.getName()} image"
                                             class="img-rounded img-responsive">
                                        <div class="center-items">
                                            <a class="btn btn-default button-appear-onHover add-btn" onclick="passIDToModal(${uploadedSong.getMusicID()})"
                                               data-toggle="modal" data-target="#addToPlaylist"><i class="fa fa-plus"></i></a>
                                            <a href="#" class="btn btn-default  button-appear-onHover play-btn"><i class="fa fa-play"></i></a>
                                            <a href="#" class="btn btn-default  button-appear-onHover delete-btn"><i class="fa fa-times"></i></a>
                                        </div>       

                                        <div class="caption music-info">
                                            <p class="text-primary">${uploadedSong.getName()}</p>
                                            <p>Category: ${uploadedSong.getCategory()}</p>
                                            <p>Uploaded: <fmt:formatDate type = "date" value = "${uploadedSong.getCreated()}" /></p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="row justify-content-center bg-danger">
                            <c:if test="${userUploadedSongs.size() > 6}">
                                <div class="collapse" id="footwear">
                                    <div class="equal-height">
                                        <c:forEach items="${userUploadedSongs}" begin="6" var="uploadedSong">
                                            <div class="col-xs-4 col-lg-2 max-height-col padding-bottom">
                                                <div class="thumbnail">
                                                    <img src="${uploadedSong.getImage()}" alt="${uploadedSong.getName()} image"
                                                         class="img-rounded img-responsive">
                                                    <div class="center-items">
                                                        <a class="btn btn-default button-appear-onHover add-btn" onclick="passIDToModal(${uploadedSong.getMusicID()})"
                                                           data-toggle="modal" data-target="#addToPlaylist"><i class="fa fa-plus"></i></a>
                                                        <a href="#" class="btn btn-default  button-appear-onHover play-btn"><i class="fa fa-play"></i></a>
                                                        <a href="#" class="btn btn-default  button-appear-onHover delete-btn"><i class="fa fa-times"></i></a>
                                                    </div> 

                                                    <div class="caption music-info">
                                                        <p class="text-primary">${uploadedSong.getName()}</p>
                                                        <p>Category: ${uploadedSong.getCategory()}</p>
                                                        <p>Uploaded: <fmt:formatDate type = "date" value = "${uploadedSong.getCreated()}" /></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                            </c:if>
                        </div>
                    </section>


                    <!-- The add music to playlist modal -->
                    <div class="modal fade" id="addToPlaylist" tabindex="-1" role="dialog" aria-labelledby="modalLabelLarge" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="modalLabelLarge">Add song to playlist:</h4>
                                </div>
                                <form method="post" action="playlist">
                                    <div class="modal-body">

                                        <select class="form-control input-lg" name="playlistID">
                                            <c:forEach items="${userPlaylists}" var="userPlaylist">
                                                <option value="${userPlaylist.getPlaylistID()}">${userPlaylist.getName()} playlist</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" id="songID" name="songID">
                                        <input type="hidden" name="currentURL" value="/profile.jsp">
                                        <input type="submit" name="action" value="Add Song to Playlist" class="btn btn-secondary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>




                    <section class="container-fluid">
                        <div class="row justify-content-center bg-success recent-play-song-row">
                            <div class="col-xs-12 ">
                                <h2>Recent played songs</h2>
                            </div>                          
                        </div>
                    </section>
                    <section class="container-fluid">
                        <div class="row justify-content-center bg-info playlist-row">
                            <div class="col-xs-12 ">
                                <h2>Playlists</h2>
                                 <c:forEach items="${userPlaylists}" var="userPlaylist">
                                                 <div class="col-xs-4 col-lg-2 max-height-col padding-bottom">
                                    <div class="thumbnail">

                                        <img src="${userPlaylist.getCover()}" alt="${userPlaylist.getName()} image"
                                             class="img-rounded img-responsive">
                                        <div class="center-items">
                                        </div>       

                                        <div class="caption music-info">
                                            <p class="text-primary">${userPlaylist.getName()}</p>
                                            <p style="font-size: 16px;">Uploaded: <fmt:formatDate type = "date" value = "${userPlaylist.getCreated()}" /></p>
                                        </div>
                                    </div>
                                </div>
                                            </c:forEach>
                            </div>                          
                        </div>
                    </section>

                    <div class="clearfix"></div>
                    <!--body wrapper end-->		
                </div>











            </div>
        </main>

        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>
