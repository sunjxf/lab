package sun.lab.service;

import sun.lab.entity.News;
import sun.lab.entity.Page;

import java.util.List;

/**
 * Created by sun on 2017/3/3.
 */
public interface NewsService extends BaseService<News>{
    public News selectByCategory(News entity);
    public int selectPageCountByCategory(Page<News> entity);
    public News selectById(News entity);
    public List<News> selectByTop(News entity);
}
