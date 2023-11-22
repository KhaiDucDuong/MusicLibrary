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
import java.util.List;
import java.text.SimpleDateFormat;  
import java.util.Date;  

import LibraryClass.User;
import LibraryClass.Music;
import LibraryClass.Playlist;
import DBUtil.*;
import java.io.File;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author GIGABYTE
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 10 MB
  maxFileSize = 1024 * 1024 * 10,      // 100 MB
  maxRequestSize = 1024 * 1024 * 100   // 1000 MB
)
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url ="/blog.html";
        String action = request.getParameter("action");
        if(action.equals("registerUser")){
        String email = request.getParameter("Email");
        boolean check = UserDB.checkUser(email);
        if (check == false)
        registerUser(request, response);
        else request.setAttribute("message", "Email is already existed");
        url ="/index.jsp";
        }
        else if(action.equals("loginUser")){
            List<User> u = loginUser(request,response);
            
            if(u == null){
                request.setAttribute("message", "Wrong email or password");
                url="/index.jsp";
            }
            else{
                User user = u.get(0);
                request.getSession().setAttribute("loggeduser", user);
                url="/index.jsp";
            }
        }
        else if(action.equals("Log out")){
            request.getSession().invalidate();
            request.removeAttribute("loggeduser");  
            url ="/index.jsp";
        }
        else if(action.equals("My profile")){
            //get user's uploaded songs
            User user = (User)request.getSession().getAttribute("loggeduser");
            List<Music> userUploadedSongs = MusicDB.selectMusicbyUserID(user);
            request.setAttribute("userUploadedSongs", userUploadedSongs);
            //get user's playlists
            List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
            request.setAttribute("userPlaylists", userPlaylists);
            url="/profile.jsp";
        }
        else if(action.equals("Setting")){
            url= "/user.jsp";
        }
         else if(action.equals("Account Manager")){
            url= "/admin";
        }
        else if(action.equals("save")){
            String message = updateUser(request,response);
            
            if(message.equals("Account updated succesfully")){
            request.getSession().invalidate();
            List<User> u = loginUser(request,response);
            User user = u.get(0);
            request.getSession().setAttribute("loggeduser", user);
            }
            
            request.setAttribute("message", message);
            url="/user.jsp";
        }
          else if(action.equals("delete")){
            deleteUser(request,response);
            request.removeAttribute("loggeduser");
            request.getSession().invalidate();
            request.setAttribute("getAlert", "Yes");
            url = ("/index.jsp");
        }
        else if(action.equals("Playlist")){
            url= "/playlist";
        }
        //send user to addMusic.jsp and delete insertMusicflag to start new insertion
        else if(action.equals("start_create_newMusic")) {
            javax.servlet.http.HttpSession session = request.getSession();
            if(session.getAttribute("insertMusicflag") != null) {
                session.removeAttribute("insertMusicflag");
            }
            url = "/addMusic.jsp";
        }
         getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);
    }
    private String registerUser(HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("Email");
        String name = request.getParameter("Name");
        String number = request.getParameter("Number");
        String pass = request.getParameter("Password");
        String Infor = "Nothing";
        long Phone = Long.parseLong(number);
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        User user = new User();
        user.setImage("images/users_img/default-profile.jpg");
        user.setCreated(date);
        user.setName(name);
        user.setGmail(email);
        user.setPhoneNumber(Phone);
        user.setPass(pass);
        user.setInfor(Infor);
        UserDB.insertUser(user);
        String url = "/" + name;
        return url;
    }
    private List<User> loginUser(HttpServletRequest request, HttpServletResponse response){
                String loginEmail = request.getParameter("loginEmail");
                String loginPass = request.getParameter("loginPass");
                List<User> u = null;
                boolean check = UserDB.userExist(loginEmail, loginPass);
                System.out.println("User excist: "+check);
                if(check == true){
                u = UserDB.selectUser(loginEmail, loginPass);
                return u;
                }
                else{
                    return null;
                }
    }
    private String updateUser(HttpServletRequest request, HttpServletResponse response){
         String changeName = request.getParameter("changeName");
         String changePhone = request.getParameter("changePhone");
         String changePass = request.getParameter("loginPass");
         String changeInfor = request.getParameter("changeInfor"); 
         String ID = request.getParameter("userID");
         User logged = (User) request.getSession().getAttribute("loggeduser");
         String imgPath = logged.getImage();
        try {
            Part userfile = request.getPart("userprofile");
            String type = userfile.getContentType();
            if(type.equals("image/jpeg") || type.equals("image/png"))
                {
                 String rename = "user" + logged.getUserID() + ".jpg";
                imgPath = "images/users_img/" + rename;  
                 String absolutePath = request.getServletContext().getRealPath(imgPath);
                 userfile.write(absolutePath);
                }
        } catch (IOException | ServletException ex) {
            imgPath = logged.getImage();
        }
         User u = new User();
         u.setImage(imgPath);
         long userID = Long.parseLong(ID);
         u.setUserID(userID);
         u.setName(changeName);
         long Phone = Long.parseLong(changePhone);
         u.setPhoneNumber(Phone);
         u.setPass(changePass);
         u.setInfor(changeInfor);
         boolean i = UserDB.updateUser(u);
         if(i)
         { 
             return "Account updated succesfully";}
         else return "Failed to update acount";
    }
    
    private void deleteUser(HttpServletRequest request, HttpServletResponse response){
        String ID = request.getParameter("userID");
         User u = new User();
         long userID = Long.parseLong(ID);
          u.setUserID(userID);
          UserDB.deleteUser(u);
    }
}
