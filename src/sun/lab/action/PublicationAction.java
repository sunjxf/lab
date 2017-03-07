package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.Page;
import sun.lab.entity.Publications;
import sun.lab.service.PublicationService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Controller
@RequestMapping(value = "/publication")
public class PublicationAction {
    @Resource
    private PublicationService publicationService;
    @RequestMapping(value="/showPublication")
    public String showPublication(HttpServletRequest request, HttpSession session){
        String pageNum=request.getParameter("pageIndex");
        int pageIndex=1;
        int pageSize=10;
        int totalPage=0;
        if(pageNum!=null) {
            pageIndex=Integer.parseInt(pageNum);
        }
        int totalRecord=publicationService.selectPageCount();
        if (totalRecord == 0) {
            request.setAttribute("msg", "暂无记录！");
            return "forward:/WEB-INF/admin/showPublication.jsp";
        }
        if (totalRecord % pageSize == 0) {
            totalPage = totalRecord / pageSize;
        } else {
            totalPage = totalRecord / pageSize + 1;
        }

        if(pageIndex<1){pageIndex=1;}
        if(pageIndex>totalPage){pageIndex=totalPage;}

        Page<Publications> page =new Page<Publications>();
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalPage(totalPage);

        List<Publications> pub=publicationService.selectPageList(page);

        //List<Publications> pub=publicationService.selectAll();
        request.setAttribute("pub", pub);
        request.setAttribute("page", page);
        return "forward:/WEB-INF/admin/showPublication.jsp";
    }

    @RequestMapping(value="/addPublication")
    public String addPublication(Publications publications,HttpServletRequest request){
        try {

            int i=publicationService.insert(publications);
            if(i>0){
                request.setAttribute("msg", "添加成功！");
            }else
            {
                request.setAttribute("msg", "添加失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/publication/showPublication.action";
    }

    @RequestMapping(value="/modifyPublication")
    public String modifyPublication(Publications publications,HttpServletRequest request){
        try {
            int i=publicationService.update(publications);
            if(i>0){
                request.setAttribute("msg", "修改成功！");
            }else
            {
                request.setAttribute("msg", "修改失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/publication/showPublication.action";
    }

    @RequestMapping(value="/showModifyPublication")
    public String showModifyMenu(Publications publications,HttpServletRequest request){

        Publications pub=publicationService.selectById(publications);
        request.setAttribute("pub", pub);
        return "forward:/WEB-INF/admin/modifyPublication.jsp";
    }

    @RequestMapping(value="/DeletePublication")
    public String DeletePublication(Publications publications,HttpServletRequest request){
        try {
            int i=publicationService.delete(publications);
            if(i>0){
                request.setAttribute("msg", "删除成功！");
            }else
            {
                request.setAttribute("msg", "删除失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/publication/showPublication.action";
    }

}
