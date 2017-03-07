package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.Members;
import sun.lab.entity.Page;
import sun.lab.service.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sun on 2017/3/6.
 */
@Controller
@RequestMapping(value = "/member")
public class MemberAction {
    @Resource
    private MemberService memberService;
    @RequestMapping(value="/showMember")
    public String showPublication(HttpServletRequest request, HttpSession session){
        String pageNum=request.getParameter("pageIndex");
        int pageIndex=1;
        int pageSize=10;
        int totalPage=0;
        if(pageNum!=null) {
            pageIndex=Integer.parseInt(pageNum);
        }
        int totalRecord=memberService.selectPageCount();
        if (totalRecord == 0) {
            request.setAttribute("msg", "暂无记录！");
            return "forward:/WEB-INF/admin/showMember.jsp";
        }
        if (totalRecord % pageSize == 0) {
            totalPage = totalRecord / pageSize;
        } else {
            totalPage = totalRecord / pageSize + 1;
        }

        if(pageIndex<1){pageIndex=1;}
        if(pageIndex>totalPage){pageIndex=totalPage;}

        Page<Members> page =new Page<Members>();
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalPage(totalPage);

        List<Members> mem=memberService.selectPageList(page);

        request.setAttribute("mem", mem);
        request.setAttribute("page", page);
        return "forward:/WEB-INF/admin/showMember.jsp";
    }

    @RequestMapping(value="/addMember")
    public String addPublication(Members members, HttpServletRequest request){
        try {
            int i=memberService.insert(members);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/member/showMember.action";
    }

    @RequestMapping(value="/DeleteMember")
    public String DeletePublication(Members members, HttpServletRequest request){
        try {
            int i=memberService.delete(members);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/member/showMember.action";
    }

    @RequestMapping(value="/showModifyMember")
    public String showModifyMenu(Members members, HttpServletRequest request){
        Members mem=memberService.selectById(members);
        request.setAttribute("mem", mem);
        return "forward:/WEB-INF/admin/modifyMember.jsp";
    }

    @RequestMapping(value="/modifyMember")
    public String modifyPublication(Members members, HttpServletRequest request){
        try {
            int i=memberService.update(members);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/member/showMember.action";
    }
}
