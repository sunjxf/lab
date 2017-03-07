package sun.lab.service.impl;

import org.springframework.stereotype.Service;
import sun.lab.entity.Menu;
import sun.lab.service.MenuService;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Service("menuService")
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {

    @Override
    public List<Menu> selectByEnable() {
        return menuMapper.selectByEnable();
    }

    @Override
    public Menu selectById(Menu entity) {
        return menuMapper.selectById(entity);
    }

    @Override
    public List<Menu> selectAll() {
        return menuMapper.selectAll();
    }
}
