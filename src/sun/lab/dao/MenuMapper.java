package sun.lab.dao;

import sun.lab.entity.Menu;

import java.util.List;

public interface MenuMapper extends baseMapper<Menu> {
    public List<Menu> selectByEnable();
    public Menu selectById(Menu entity);
    public List<Menu> selectAll();

}