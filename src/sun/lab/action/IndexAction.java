package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.*;
import sun.lab.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by sun on 2017/2/25.
 */
@Controller
public class IndexAction {
    @Resource
    private MenuService menuService;
    @Resource
    private HomeService homeService;
    @Resource
    private PublicationService publicationService;
    @Resource
    private NewsService newsService;
    @Resource
    private MemberService memberService;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        News news = new News();
        news.setCategory("3333");
        List<News> newsList = newsService.selectByTop(news);
        news.setCategory("5555");
        List<News> linksList = newsService.selectByTop(news);

        String[] interests = h.getInterests().split("\\|");
        String[] album = h.getAlbum().split(",");
        String path=request.getContextPath();
        String albumPath="";
        for(String str:album){
            albumPath=albumPath+path+"/upload/"+str+"|";
        }
        albumPath=albumPath.replace(" ", "");
        albumPath=albumPath.substring(0,albumPath.length()-1);
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);
        request.setAttribute("interests", interests);
        request.setAttribute("album", albumPath);
        request.setAttribute("newsList", newsList);
        request.setAttribute("linksList", linksList);
        return "forward:/WEB-INF/jsp/index.jsp";
    }

    @RequestMapping(value = "/paper")
    public String publications(HttpServletRequest request) {
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        List<Publications> pub = publicationService.selectAll();
        TreeMap<String, Publications> map = new TreeMap<String, Publications>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o2.compareTo(o1);
            }
        });
        for (Publications p : pub) {
            String key = p.getYear();
            if (!map.containsKey(key)) {
                map.put(p.getYear(), p);
            }
        }
        request.setAttribute("pub", pub);
        request.setAttribute("years", map.keySet());
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);

        return "forward:/WEB-INF/jsp/paper.jsp";
    }

    @RequestMapping(value = "/interest")
    public String interest(HttpServletRequest request) {
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);

        String category = request.getParameter("category");

        if (category != null) {
            News n = new News();
            n.setCategory("2000");
            News news = newsService.selectByCategory(n);
            request.setAttribute("news", news);
        } else {
            return "redirect:/index.action";
        }

        return "forward:/WEB-INF/jsp/interest.jsp";
    }

    @RequestMapping(value = "/contact")
    public String contact(HttpServletRequest request) {
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);

        String category = request.getParameter("category");

        if (category != null) {
            News n = new News();
            n.setCategory("7000");
            News news = newsService.selectByCategory(n);
            request.setAttribute("news", news);
        } else {
            return "redirect:/index.action";
        }

        return "forward:/WEB-INF/jsp/contact.jsp";
    }

    @RequestMapping(value = "/contentlist")
    public String contentlist(Page<News> page, HttpServletRequest request) {
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);

        int pageIndex = 1;
        int pageSize = 2;
        int totalPage = 0;

        if (page.getPageIndex() != null) {
            pageIndex = page.getPageIndex();
        }
        int totalRecord = newsService.selectPageCountByCategory(page);
        if (totalRecord == 0) {
            request.setAttribute("msg", "暂无记录！");
            return "forward:/WEB-INF/jsp/contentlist.jsp";
        }
        if (totalRecord % pageSize == 0) {
            totalPage = totalRecord / pageSize;
        } else {
            totalPage = totalRecord / pageSize + 1;
        }

        if (pageIndex < 1) {
            pageIndex = 1;
        }
        if (pageIndex > totalPage) {
            pageIndex = totalPage;
        }

        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalPage(totalPage);

        List<News> news = newsService.selectPageList(page);
        request.setAttribute("news", news);
        request.setAttribute("page", page);

        return "forward:/WEB-INF/jsp/contentlist.jsp";
    }

    @RequestMapping(value = "/showcontent")
    public String showcontent(News news, HttpServletRequest request) {

        News n = newsService.selectById(news);
        request.setAttribute("data", n);

        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);
        return "forward:/WEB-INF/jsp/showcontent.jsp";
    }

    @RequestMapping(value = "/memberList")
    public String memberList(HttpServletRequest request) {

        List<Members> mem = memberService.selectAll();
        TreeMap<String, Members> map = new TreeMap<String, Members>();
        for (Members m : mem) {
            String key = m.getCategory();
            if (!map.containsKey(key)) {
                map.put(m.getCategory(), m);
            }
        }
        request.setAttribute("mem", mem);
        request.setAttribute("cg", map.keySet());

        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);
        return "forward:/WEB-INF/jsp/memberlist.jsp";
    }

    @RequestMapping(value = "/member")
    public String member(Members members,HttpServletRequest request) {
        Members mem = memberService.selectById(members);
        request.setAttribute("mem", mem);
        Home h = homeService.select(new Home());
        List<Menu> m = menuService.selectByEnable();
        request.setAttribute("menu", m);
        request.setAttribute("setting", h);
        return "forward:/WEB-INF/jsp/member.jsp";
    }
}
