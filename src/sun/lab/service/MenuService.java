package sun.lab.service;

import sun.lab.entity.Menu;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
public interface MenuService extends BaseService<Menu>{
    public List<Menu> selectByEnable();
    public Menu selectById(Menu entity);
    public List<Menu> selectAll();
}
