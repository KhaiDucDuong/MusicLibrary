/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Webservlet;

import DBUtil.MusicDB;
import DBUtil.PlaylistDB;
import DBUtil.UserDB;
import LibraryClass.Music;
import LibraryClass.Playlist;
import LibraryClass.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GIGABYTE
 */
public class searchServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/browse.jsp";
        String action = request.getParameter("action");
        User user = (User) request.getSession().getAttribute("loggeduser");
        List<Playlist> randPlaylist = PlaylistDB.select8Playlist();
        request.setAttribute("randPlaylist", randPlaylist);
        if (user != null){
         List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
        request.setAttribute("userPlaylists", userPlaylists);
        }
        if(action.equals("search")){
            SearchMusic(request,response);
            SearchPlaylist(request,response);
            SearchUser(request,response);
        }
           if (action.equals("Add Song to Playlist")){
            Long playlistID = Long.parseLong(request.getParameter("addPlaylistID"));
            Long songID = Long.parseLong(request.getParameter("songID"));
            addSongToPlaylist(playlistID, songID);
            SearchMusic(request,response);
            SearchPlaylist(request,response);
            SearchUser(request,response);
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
                .forward(request,response);
    }
    private static void SearchMusic(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
        String patternUnvalid = request.getParameter("songSearch");
        String pattern = patternUnvalid.replaceAll("[^a-zA-Z0-9]", "");  //XSS
        pattern = URLEncoder.encode( pattern, "ISO-8859-1" );
        pattern = URLDecoder.decode( pattern, "UTF-8" );
        List<Music> result = MusicDB.findMusic(pattern);
        request.setAttribute("songResults", result);
        request.setAttribute("pattern", pattern);
    }
     private static void SearchPlaylist(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
        String patternUnvalid = request.getParameter("songSearch");
        String pattern = patternUnvalid.replaceAll("[^a-zA-Z0-9]", " ");  
        pattern = URLEncoder.encode( pattern, "ISO-8859-1" );
        pattern = URLDecoder.decode( pattern, "UTF-8" );
        List<Playlist> result = PlaylistDB.findPlaylist(pattern);
        request.setAttribute("playlistResults", result);
    }
     private static void SearchUser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
        String patternUnvalid = request.getParameter("songSearch");
        String pattern = patternUnvalid.replaceAll("[^a-zA-Z0-9]", " ");  
        pattern = URLDecoder.decode( pattern, "UTF-8" );
        List<User> result = UserDB.findUser(pattern);
        request.setAttribute("userResults", result);
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
      
}
