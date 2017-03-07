package sun.lab.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import sun.lab.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by sun on 2017/3/7.
 */
public class CommonInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/admin/sign-in.jsp").forward(request, response);
            return false;
        } else
            return true;
    }

}
