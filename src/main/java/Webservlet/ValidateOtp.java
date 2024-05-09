package Webservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.addHeader("Content-Security-Policy", "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
                + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
                + "frame-ancestors 'self'; connect-src 'self'; img-src 'self'; frame-src 'self'; "
                + "media-src 'self' http://localhost:8080/MusicLibrary/songs; object-src 'self'; manifest-src 'self'; "
                + "form-action 'self'; "
                + "font-src 'self' https://cdn.linearicons.com https://fonts.gstatic.com;");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        String reponseUrl = "newPassword.jsp";
        int otp = (int) session.getAttribute("otp");
        try {
            int value = Integer.parseInt(request.getParameter("otp"));
            if (value == otp) {

                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("status", "success");

            } else {
                request.setAttribute("message", "wrong otp");
                reponseUrl = "EnterOtp.jsp";
            }
        } catch (Exception e) {
            request.setAttribute("message", "wrong otp");
            reponseUrl = "EnterOtp.jsp";
        } finally {
            dispatcher = request.getRequestDispatcher(reponseUrl);
            dispatcher.forward(request, response);
        }
    }
}
