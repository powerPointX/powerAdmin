package io.renren.modules.goods.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.goods.entity.GoodsEntity;
import io.renren.modules.goods.entity.GoodsEntity;

import java.util.Map;

/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-08-29 10:37:05
 */
public interface GoodsService extends IService<GoodsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

