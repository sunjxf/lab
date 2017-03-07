package sun.lab.service.impl;

import org.springframework.stereotype.Service;
import sun.lab.entity.Members;
import sun.lab.service.MemberService;

import java.util.List;

/**
 * Created by sun on 2017/3/6.
 */
@Service("memberService")
public class MemberServiceImpl extends BaseServiceImpl<Members> implements MemberService {
    @Override
    public Members selectById(Members entity) {
        return membersMapper.selectById(entity);
    }

    @Override
    public List<Members> selectAll() {
        return membersMapper.selectAll();
    }
}
