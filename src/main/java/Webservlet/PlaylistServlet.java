/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Webservlet;

import DBUtil.MusicDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

import LibraryClass.Playlist;
import LibraryClass.Music;
import DBUtil.PlaylistDB;
import DBUtil.UserDB;
import LibraryClass.User;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
/**
 *
 * @author GIGABYTE
 */
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 10 MB
  maxFileSize = 1024 * 1024 * 10,      // 100 MB
  maxRequestSize = 1024 * 1024 * 100   // 1000 MB
)
public class PlaylistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loggeduser");
        long ID = user.getUserID();
        List<Playlist> playlist = PlaylistDB.selectPlaylist(user);
        String url = "/Playlist.jsp";
        request.setAttribute("playlist", playlist);
        String action = request.getParameter("action");
        System.out.println(action);
       if(action.equals("addPlaylist")){
           createPlaylist(request,response,ID);
           String message ="Playlist added";
           request.setAttribute("message", message);
           playlist = PlaylistDB.selectPlaylist(user);
           request.setAttribute("playlist", playlist);
           url ="/Playlist.jsp";
       }
       if(action.equals("Change cover")){
           updateCover(request,response, user);
           String message ="Cover changed";
           request.setAttribute("message", message);
            playlist = PlaylistDB.selectPlaylist(user);
           request.setAttribute("playlist", playlist);
           url ="/Playlist.jsp";
       }
       if(action.equals("Delete playlist")){
           deletePlaylist(request,response);
           String message ="Playlist deleted";
           request.setAttribute("message", message);
           playlist = PlaylistDB.selectPlaylist(user);
           request.setAttribute("playlist", playlist);
           url ="/Playlist.jsp";
       }
        if(action.equals("Rename playlist")){
            updatePlaylist(request,response);
              String message ="Playlist renamed";
           request.setAttribute("message", message);
           playlist = PlaylistDB.selectPlaylist(user);
           request.setAttribute("playlist", playlist);
           url ="/Playlist.jsp";
        }
        if (action.equals("Delete playlist")) {
            deletePlaylist(request, response);
            String message = "Playlist deleted";
            request.setAttribute("message", message);
            playlist = PlaylistDB.selectPlaylist(user);
            request.setAttribute("playlist", playlist);
            url = "/Playlist.jsp";
        }
        if (action.equals("Rename playlist")) {
            updatePlaylist(request, response);
            String message = "Playlist renamed";
            request.setAttribute("message", message);
            playlist = PlaylistDB.selectPlaylist(user);
            request.setAttribute("playlist", playlist);
            url = "/Playlist.jsp";
        }
        if (action.equals("Add Song to Playlist")){
            Long playlistID = Long.parseLong(request.getParameter("playlistID"));
            Long songID = Long.parseLong(request.getParameter("songID"));
            addSongToPlaylist(playlistID, songID);
            String message = "Added song to playlist!";
            request.setAttribute("message", message);
            url = request.getParameter("currentURL");
            //get user's uploaded songs
            List<Music> userUploadedSongs = MusicDB.selectMusicbyUserID(user);
            request.setAttribute("userUploadedSongs", userUploadedSongs);
            //get user's playlists
            List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
            request.setAttribute("userPlaylists", userPlaylists);
        }
        if (action.equals("View playlist")) {
            Long playlistID = Long.parseLong(request.getParameter("playlistID"));
            //get the selected playlist
            Playlist selectedPlaylist = PlaylistDB.selectPlaylistByID(playlistID);
            request.setAttribute("selectedPlaylist", selectedPlaylist);
            //get the songs in the playlist
            Set<Music> selectedPlaylistSongs = MusicDB.selectMusicInPlaylist(playlistID);
            request.setAttribute("selectedPlaylistSongs", selectedPlaylistSongs);
            //get playlist owner's name
            User playlistOwner = selectedPlaylist.getUser();
            String playlistOwnerName = UserDB.selectUserNameFromID(playlistOwner.getUserID());
            request.setAttribute("playlistOwnerName", playlistOwnerName);
            url = "/playlistDetails.jsp";
        }
        
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    private void createPlaylist(HttpServletRequest request, HttpServletResponse response, long ID){
            String playlistName = request.getParameter("playlistName");
            long millis=System.currentTimeMillis();  
            java.sql.Date date=new java.sql.Date(millis);  
           Playlist playlist = new Playlist();
           playlist.setCreated(date);
           playlist.setCover("images/cover/default-cover.jpg");
           playlist.setName(playlistName);
           playlist.setCreated(date);
           PlaylistDB.addPlaylist(playlist, ID);
    }

    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) {
        String ID = request.getParameter("playlistID");
        long playlistID = Long.parseLong(ID);
        PlaylistDB.deletePlaylist(playlistID);
    }

    private void updatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        String ID = request.getParameter("playlistID");
        long playlistID = Long.parseLong(ID);
        String Name = request.getParameter("renamePlaylist");
        Playlist playlist = new Playlist();
        playlist.setName(Name);
        playlist.setPlaylistID(playlistID);
        PlaylistDB.updatePlaylist(playlist);
    }

    private void addSongToPlaylist(long playlistID, Long songID) {
        Playlist playlist = new Playlist();
        playlist.setPlaylistID(playlistID);

        Set<Music> songs = new HashSet<>();
        Music song = new Music();
        song.setMusicID(songID);
        songs.add(song);
        
        PlaylistDB.addSongsToPlaylist(playlist, songs);
    }

     private void updateCover(HttpServletRequest request, HttpServletResponse response, User user){
        String ID = request.getParameter("playlistID");
        long playlistID = Long.parseLong(ID);
        String imgPath = PlaylistDB.selectPlaylistImage(playlistID);
        try {
            
            Part coverfile = request.getPart("cover");
            String type = coverfile.getContentType();
            if (type != null && (type.equals("image/jpeg") || type.equals("image/png")))
            {
             String rename = user.getUserID() + "playlist" + ID + ".jpg";
                imgPath = "images/cover/" + rename;  
                 String absolutePath = request.getServletContext().getRealPath(imgPath);
                 coverfile.write(absolutePath);
            }
            else {
                imgPath = PlaylistDB.selectPlaylistImage(playlistID);
            }
        } catch (IOException | ServletException ex) {
            imgPath = PlaylistDB.selectPlaylistImage(playlistID);
                return;
        }
        Playlist playlist = new Playlist();
        playlist.setCover(imgPath);
        playlist.setPlaylistID(playlistID);
        PlaylistDB.updatePlaylistCover(playlist);
     }
}
