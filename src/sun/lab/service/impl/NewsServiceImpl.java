package sun.lab.service.impl;

import org.springframework.stereotype.Service;
import sun.lab.entity.News;
import sun.lab.entity.Page;
import sun.lab.service.NewsService;

import java.util.List;

/**
 * Created by sun on 2017/3/3.
 */
@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {

    @Override
    public News selectByCategory(News entity) {
        return newsMapper.selectByCategory(entity);
    }

    @Override
    public int selectPageCountByCategory(Page<News> entity) {
        return newsMapper.selectPageCountByCategory(entity);
    }

    @Override
    public News selectById(News entity) {
        return newsMapper.selectById(entity);
    }

    @Override
    public List<News> selectByTop(News entity) {
        return newsMapper.selectByTop(entity);
    }

}