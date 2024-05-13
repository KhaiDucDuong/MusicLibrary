package Filters;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class Header_Filter implements Filter {

    public static final String CSP_POLICY = "default-src 'self'; "
            + "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
            + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
            + "frame-ancestors 'self'; "
            + "media-src 'self' http://localhost:8080/MusicLibrary/songs; "
            + "font-src 'self' https://cdn.linearicons.com https://fonts.gstatic.com;";

    public static final String X_FRAME_POLICY = "DENY";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (response instanceof HttpServletResponse) {
            ((HttpServletResponse) response).setHeader("Content-Security-Policy", Header_Filter.CSP_POLICY);
            ((HttpServletResponse) response).setHeader("X-Frame-Options", Header_Filter.X_FRAME_POLICY);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

}
