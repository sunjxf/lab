package sun.lab.service;

import sun.lab.entity.Members;

import java.util.List;

/**
 * Created by sun on 2017/3/6.
 */
public interface MemberService extends BaseService<Members>{
    public Members selectById(Members entity);
    public List<Members> selectAll();
}
