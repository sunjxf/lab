package sun.lab.service.impl;

import org.springframework.stereotype.Service;
import sun.lab.entity.User;
import sun.lab.service.UserService;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    public User login(User record) {
        return userMapper.login(record);
    }

    @Override
    public User selectById(User entity) {
        return userMapper.selectById(entity);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public User selectByName(User entity) {
        return userMapper.selectByName(entity);
    }
}
