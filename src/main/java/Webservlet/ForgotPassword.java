package Webservlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    private static final int MAX_OTP_VALUE = 999999; // Giới hạn giá trị OTP

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.addHeader("Content-Security-Policy", "style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' https://code.jquery.com/jquery-3.6.0.min.js ; frame-ancestors 'self';");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        RequestDispatcher dispatcher = null;
        try {
            String email = request.getParameter("email");
            boolean EmailInvalid = email.matches(".*[;'\"].*");
            if (EmailInvalid || !isValidEmail(email)) {
                dispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("messagelogin", "Invalid Email or Password");
                dispatcher.forward(request, response);
            } else {
                int otpvalue = generateOTP();
                HttpSession mySession = request.getSession();

                String to = email;// change accordingly

                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("trongvumaimtv@gmail.com", "klfnasnzxuvnkddy");// Put your email
                        // id and
                        // password here
                    }
                });
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello!");
                    message.setText("Your OTP is: " + otpvalue);
                    // send message
                    Transport.send(message);
                    System.out.println("Message sent successfully");
                } catch (MessagingException e) {
                    dispatcher = request.getRequestDispatcher("index.jsp");
                    request.setAttribute("message", "Something went wrong.");
                    dispatcher.forward(request, response);
                    throw new RuntimeException(e);   
                }
                dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                request.setAttribute("message", "OTP is sent to your email id");
                //request.setAttribute("connection", con);
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                dispatcher.forward(request, response);
                //request.setAttribute("status", "success");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            dispatcher = request.getRequestDispatcher("index.jsp");
            request.setAttribute("message", "Something went wrong.");
            dispatcher.forward(request, response);
        }
    }

    private boolean isValidEmail(String email) {
        // Kiểm tra định dạng email hợp lệ ở đây
        // Trả về true nếu hợp lệ, ngược lại trả về false
        return email != null && !email.isEmpty() && email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");
    }

    private int generateOTP() {
        Random rand = new Random();
        return rand.nextInt(MAX_OTP_VALUE);
    }

}
