package sun.lab.dao;

import sun.lab.entity.News;
import sun.lab.entity.Page;

import java.util.List;

public interface NewsMapper extends baseMapper<News>{
    public News selectByCategory(News entity);
    public int selectPageCountByCategory(Page<News> entity);
    public News selectById(News entity);
    public List<News> selectByTop(News entity);

}