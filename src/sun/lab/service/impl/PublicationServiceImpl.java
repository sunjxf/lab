package sun.lab.service.impl;

import org.springframework.stereotype.Service;
import sun.lab.entity.Publications;
import sun.lab.service.PublicationService;

import java.util.List;

/**
 * Created by sun on 2017/2/24.
 */
@Service("publicationService")
public class PublicationServiceImpl extends BaseServiceImpl<Publications> implements PublicationService {


    @Override
    public Publications selectById(Publications entity) {
        return publicationsMapper.selectById(entity);
    }

    @Override
    public List<Publications> selectAll() {
        return publicationsMapper.selectAll();
    }
}
