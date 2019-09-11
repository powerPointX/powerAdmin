package io.renren.modules.customer.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.customer.entity.CustomerEntity;

import java.util.Map;

/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-09-09 09:53:11
 */
public interface CustomerService extends IService<CustomerEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

