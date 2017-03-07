package sun.lab.service;

import sun.lab.entity.User;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
public interface UserService extends BaseService<User>{
    public User login(User record);
    public User selectById(User entity);
    public List<User> selectAll();
    public User selectByName(User entity);
}
