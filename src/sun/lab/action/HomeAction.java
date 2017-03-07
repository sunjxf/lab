package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.Home;
import sun.lab.service.HomeService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by sun on 2017/2/25.
 */
@Controller
@RequestMapping(value = "/Home")
public class HomeAction {
    @Resource
    private HomeService homeService;

    @RequestMapping(value="/Save")
    public String Save(Home home, HttpServletRequest request){

        try {
            int i=homeService.update(home);
            if(i>0){
                request.setAttribute("msg", "保存成功！");
            }else
            {
                request.setAttribute("msg", "保存失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/Home/Show.action";
    }

    @RequestMapping(value="/Show")
    public String Show(HttpServletRequest request){

            Home h=homeService.select(new Home());
            request.setAttribute("setting",h);

        return "forward:/WEB-INF/admin/index.jsp";
    }
}
