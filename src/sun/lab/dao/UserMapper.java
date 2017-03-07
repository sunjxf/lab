package sun.lab.dao;

import sun.lab.entity.User;

import java.util.List;

public interface UserMapper extends baseMapper<User> {
    public User login(User record);
    public User selectById(User entity);
    public List<User> selectAll();
    public User selectByName(User entity);

}