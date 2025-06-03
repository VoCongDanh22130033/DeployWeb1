package vn.edu.hcmuaf.st.web.filter;

import jakarta.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {

    private String encoding;
    private boolean ignore;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
        String ignoreParam = filterConfig.getInitParameter("ignore");
        ignore = (ignoreParam == null) ? true : Boolean.parseBoolean(ignoreParam);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (ignore || (request.getCharacterEncoding() == null)) {
            request.setCharacterEncoding(encoding);
            response.setCharacterEncoding(encoding);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Không cần gì ở đây
    }
}
