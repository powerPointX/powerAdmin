package io.renren.modules.itemize.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.itemize.dao.ItemizeDao;
import io.renren.modules.itemize.entity.ItemizeEntity;
import io.renren.modules.itemize.service.ItemizeService;


@Service("itemizeService")
public class ItemizeServiceImpl extends ServiceImpl<ItemizeDao, ItemizeEntity> implements ItemizeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String name = (String)params.get("name");

        IPage<ItemizeEntity> page = this.page(
                new Query<ItemizeEntity>().getPage(params),
                new QueryWrapper<ItemizeEntity>().like(StringUtils.isNotBlank(name),"name",name)
        );

        return new PageUtils(page);
    }



}
