package sun.lab.dao;

import sun.lab.entity.Publications;

import java.util.List;

public interface PublicationsMapper extends baseMapper<Publications> {
    public Publications selectById(Publications entity);
    public List<Publications> selectAll();
}