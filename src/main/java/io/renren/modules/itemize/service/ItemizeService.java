package io.renren.modules.itemize.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.itemize.entity.ItemizeEntity;
import io.renren.modules.itemize.entity.ItemizeEntity;

import java.util.Map;

/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-08-29 15:18:02
 */
public interface ItemizeService extends IService<ItemizeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

