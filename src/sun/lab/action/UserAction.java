package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.User;
import sun.lab.service.HomeService;
import sun.lab.service.UserService;
import sun.lab.utils.VerifyCodeUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Controller
@RequestMapping(value = "/user")
public class UserAction {
    @Resource
    private UserService userService;
    @Resource
    private HomeService homeService;

    @RequestMapping(value = "/login")
    public String login(String code, User user, HttpServletRequest request, HttpSession session) {
        if (session.getAttribute("user") != null) {
            User sessionUser = (User) session.getAttribute("user");
            User sessionLogin = userService.login(sessionUser);

            if (sessionLogin != null) {
                session.setAttribute("user", sessionLogin);
                return "forward:/Home/Show.action";
            } else {
                request.setAttribute("msg", "非法session！");
                session.setAttribute("user", null);
                return "forward:/WEB-INF/admin/sign-in.jsp";
            }
        } else {

            String verifyCode = (String) session.getAttribute("verifyCode");
            if (code!=null && code.toLowerCase().equals(verifyCode)) {
                User u = userService.login(user);
                if (u != null) {
                    session.setAttribute("user", u);
                    return "forward:/Home/Show.action";
                } else {
                    request.setAttribute("msg", "用户名或密码错误！");
                    return "forward:/WEB-INF/admin/sign-in.jsp";
                }
            } else {
                request.setAttribute("msg", "验证码错误！");
                return "forward:/WEB-INF/admin/sign-in.jsp";
            }


        }

    }

    @RequestMapping(value = "/logout")
    public String logout(User user, HttpServletRequest request, HttpSession session) {
        session.setAttribute("user", null);

        return "redirect:/index.action";
    }

    @RequestMapping(value = "/showModifyPwd")
    public String showModifyPwd(User user, HttpServletRequest request, HttpSession session) {
        User u = userService.selectById(user);
        request.setAttribute("users", u);
        return "forward:/WEB-INF/admin/modifyPwd.jsp";
    }

    @RequestMapping(value = "/modifyPwd")
    public String modifyPwd(User user, HttpServletRequest request, HttpSession session) {
        try {
            int i = userService.update(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/user/showUser.action";

    }

    @RequestMapping(value = "/showUser")
    public String showUser(HttpServletRequest request, HttpSession session) {
        List<User> u = userService.selectAll();
        request.setAttribute("users", u);
        return "forward:/WEB-INF/admin/showuser.jsp";
    }

    @RequestMapping(value = "/Delete")
    public String Delete(User user, HttpServletRequest request, HttpSession session) {
        User u = userService.selectById(user);
        User sessionu = (User) session.getAttribute("user");
        if (u.getUsername().equals(sessionu.getUsername())) {
            request.setAttribute("msg", "无法删除自己的账号！");
            return "forward:/user/showUser.action";
        }
        try {
            int i = userService.delete(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/user/showUser.action";
    }

    @RequestMapping(value = "/addUser")
    public String addUser(User user, HttpServletRequest request) {
        User u = userService.selectByName(user);
        if (u != null) {
            request.setAttribute("msg", "用户已存在！");
            return "forward:/user/showUser.action";
        } else {
            try {
                int i = userService.insert(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "forward:/user/showUser.action";
        }
    }

    @RequestMapping(value = "/authImage")
    public void authImage(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        //生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        //存入会话session
        HttpSession session = request.getSession(true);
        //删除以前的
        session.removeAttribute("verifyCode");
        session.setAttribute("verifyCode", verifyCode.toLowerCase());
        //生成图片
        int w = 100, h = 30;
        try {
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

