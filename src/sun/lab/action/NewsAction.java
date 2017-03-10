package sun.lab.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.lab.entity.News;
import sun.lab.entity.Page;
import sun.lab.service.NewsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by sun on 2017/3/3.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsAction {
    @Resource
    private NewsService newsService;

    @RequestMapping(value = "/showInterest")
    public String showInterest(HttpServletRequest request) {
        News n = new News();
        n.setCategory("2000");
        News news = newsService.selectByCategory(n);

        request.setAttribute("news", news);
        return "forward:/WEB-INF/admin/modifyInterest.jsp";
    }

    @RequestMapping(value = "/modifyInterest")
    public String modifyInterest(News news, HttpServletRequest request) {

        try {
            int i = newsService.update(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/Home/Show.action";
    }

    @RequestMapping(value = "/showContactUs")
    public String showContactUs(HttpServletRequest request) {
        News n = new News();
        n.setCategory("7000");
        News news = newsService.selectByCategory(n);

        request.setAttribute("news", news);
        return "forward:/WEB-INF/admin/modifyContact.jsp";
    }

    @RequestMapping(value = "/modifyContact")
    public String modifyContact(News news, HttpServletRequest request) {

        try {
            int i = newsService.update(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/Home/Show.action";
    }

    @RequestMapping(value = "/showNews")
    public String showNews(Page<News> page,HttpServletRequest request) {

        int pageIndex = 1;
        int pageSize = 2;
        int totalPage = 0;

        if (page.getPageIndex() != null) {
            pageIndex = page.getPageIndex();
        }
        int totalRecord = newsService.selectPageCountByCategory(page);
        if (totalRecord == 0) {
            request.setAttribute("msg", "暂无记录！");
            return "forward:/WEB-INF/admin/showNews.jsp";
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
        return "forward:/WEB-INF/admin/showNews.jsp";
    }
    @RequestMapping(value = "/addNews")
    public String addNews(News news,HttpServletRequest request) {

        try {
            int i=newsService.insert(news);
            if(i>0) {
                request.setAttribute("msg", "添加成功！");
            }else
            {
                request.setAttribute("msg", "添加失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "forward:/WEB-INF/admin/addNews.jsp";
    }

    @RequestMapping(value="/deleteNews")
    public String DeleteNews(News news, HttpServletRequest request){
        try {
            int i=newsService.delete(news);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/news/showNews.action?category="+news.getCategory();
    }

    @RequestMapping(value="/showModifyNews")
    public String showModifyNews(News news, HttpServletRequest request){

        news=newsService.selectById(news);
        request.setAttribute("data", news);
        return "forward:/WEB-INF/admin/modifyNews.jsp";
    }

    @RequestMapping(value="/modifyNews")
    public String modifyNews(News news, HttpServletRequest request){
        try {
            int i=newsService.update(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/news/showNews.action?category="+news.getCategory();
    }
}
