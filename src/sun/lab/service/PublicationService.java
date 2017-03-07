package sun.lab.service;

import sun.lab.entity.Publications;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
public interface PublicationService extends BaseService<Publications>{
    public Publications selectById(Publications entity);
    public List<Publications> selectAll();
}
