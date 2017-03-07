package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.Menu;
import sun.lab.service.MenuService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Controller
@RequestMapping(value = "/Menu")
public class MenuAction {
    @Resource
    private MenuService menuService;
    @RequestMapping(value="/showMenu")
    public String showMenu(HttpServletRequest request, HttpSession session){
        List<Menu> m=menuService.selectAll();
        request.setAttribute("menu", m);
        return "forward:/WEB-INF/admin/menuManager.jsp";
    }

    @RequestMapping(value="/addMenu")
    public String addMenu(Menu menu,HttpServletRequest request){
        try {

            int i=menuService.insert(menu);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/Menu/showMenu.action";
    }

    @RequestMapping(value="/modifyMenu")
    public String modifyMenu(Menu menu,HttpServletRequest request){
        try {
            int i=menuService.update(menu);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Menu/showMenu.action";
    }

    @RequestMapping(value="/showModifyMenu")
    public String showModifyMenu(Menu menu,HttpServletRequest request){

        Menu m=menuService.selectById(menu);
        request.setAttribute("data", m);
        System.out.println(m);
        return "forward:/WEB-INF/admin/modifyMenu.jsp";
    }

    @RequestMapping(value="/Delete")
    public String Delete(Menu menu,HttpServletRequest request){
        try {
            int i=menuService.delete(menu);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/Menu/showMenu.action";
    }

}
