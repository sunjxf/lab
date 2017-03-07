package sun.lab.dao;

import sun.lab.entity.Members;

import java.util.List;

public interface MembersMapper extends baseMapper<Members>{
    public Members selectById(Members entity);
    public List<Members> selectAll();
}