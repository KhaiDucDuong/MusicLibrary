/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Webservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import java.util.HashSet;
import java.util.Set;
import LibraryClass.Music;
import LibraryClass.Playlist;
import DBUtil.MusicDB;
import DBUtil.PlaylistDB;
import LibraryClass.User;
import java.util.List;

/**
 *
 * @author Johnny
 */
@WebServlet(name = "MusicServlet", urlPatterns = {"/musicServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 100, // 10 MB
        maxRequestSize = 1024 * 1024 * 1000 // 100 MB
)
public class MusicServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //default return path
        List Music = MusicDB.selectAllMusic();
        request.setAttribute("allMusic", Music);
        request.setCharacterEncoding("UTF-8");
        String url = "/profile.jsp";
        //get action
        String action = request.getParameter("action");
        String message;
        //get current logged in User info
        User user = (User) request.getSession().getAttribute("loggeduser");
        List<Music> userUploadedSongs = MusicDB.selectMusicbyUserID(user);
        request.setAttribute("userUploadedSongs", userUploadedSongs);
        //get user's playlists
        List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
        request.setAttribute("userPlaylists", userPlaylists);
        //upload a song, author is set to current logged in user
        if (action.equals("createMusic")) {

            javax.servlet.http.HttpSession session = request.getSession();

            if (session.getAttribute("insertMusicflag") == null) {

                try {
                    message = createMusic(request, response, user);

                    userUploadedSongs = MusicDB.selectMusicbyUserID(user);
                    request.setAttribute("userUploadedSongs", userUploadedSongs);
                    //get user's playlists
                    userPlaylists = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("userPlaylists", userPlaylists);
                } catch (Exception e) {
                    message = "Failed to upload song!";
                    System.out.println("Failed to upload song!");
                }
                //set insertFlag so user has to create a new form to upload a song
                session.setAttribute("insertMusicflag", true);
            } else {
                //doesn't reupload the song and return a warning message
                message = "Please fill a new form to upload song!";
            }

            //return back to profile.jsp after uploading a song (new song is displayed there)
            //should change this to a playlist url that is dedicated for uploaded songs
            url = "/profile.jsp";
            request.setAttribute("message", message);
        } else if (action.equals("Delete song")) {
            Long deletingSongID = Long.parseLong(request.getParameter("deletingSongID"));
            MusicDB.setMusicExistenceFalse(deletingSongID);
            url = "/profile.jsp";
            userUploadedSongs = MusicDB.selectMusicbyUserID(user);
            request.setAttribute("userUploadedSongs", userUploadedSongs);
            //get user's playlists
            userPlaylists = PlaylistDB.selectPlaylist(user);
            request.setAttribute("userPlaylists", userPlaylists);
            message = "Deleted song successfully!";
            request.setAttribute("message", message);
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String createMusic(HttpServletRequest request, HttpServletResponse response, User author) {
        String name = request.getParameter("musicName");
        if (name.isEmpty()) {
            return "Song name can't be empty!";
        }

        String category = request.getParameter("musicCategory");
        int liked = 0;
        int listen = 0;

//        String placeholder = request.getParameter("musicAuthor");
//        long authorID = Long.parseLong(placeholder);
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        String imgPath = "images/songs_img/default-song.png";

        Music music = new Music(name, author, category, liked, listen, imgPath, date);
        if (MusicDB.insertMusic(music)) {
            //get song file
            //if song file is not in the correct format, return error message
            //and delete the inserted music in database
            try {
                Part songFile = request.getPart("musicFile");
                String type = songFile.getContentType();
                //mpeg is mp3
                if (type != null) {
                    String rename;
                    if (type.equals("audio/mpeg")) {
                        rename = "song" + music.getMusicID() + ".mp3";
                    } else {
                        MusicDB.deleteMusic(music.getMusicID());
                        return "Song File is not in the correct format!";
                    }

                    String songPath = "songs/" + rename;
                    String absolutePath = request.getServletContext().getRealPath(songPath);
                    songFile.write(absolutePath);
                } else {
                    MusicDB.deleteMusic(music.getMusicID());
                    return "Song file is empty!";
                }
            } catch (IOException | ServletException ex) {
                MusicDB.deleteMusic(music.getMusicID());
                return "Failed to read Song File! Error: " + ex.toString();
            }

            //get image file
            try {

                Part imageFile = request.getPart("imageFile");
                String type = imageFile.getContentType();
                if (type != null && (type.equals("image/jpeg") || type.equals("image/png"))) {
                    String rename = "song" + music.getMusicID() + ".jpg";
                    imgPath = "images/songs_img/" + rename;
                    String absolutePath = request.getServletContext().getRealPath(imgPath);
                    imageFile.write(absolutePath);
                } else {
                    return "Song Uploaded but Image must be a JPG or PNG";
                }
            } catch (IOException | ServletException ex) {
                return "Song Uploaded but Failed to upload Song Image! Error: " + ex.toString();
            }

            music.setImage(imgPath);
            MusicDB.updateMusic(music);
//            Playlist playlistID = new Playlist();
//            playlistID.setPlaylistID(3);
//            Set<Music> addedSongs = new HashSet<Music>();
//            addedSongs.add(music);
//            PlaylistDB.addSongsToPlaylist(playlistID, addedSongs);
            return "Upload song succesfully!";
        }

        return "Failed to upload song!";

    }
}
