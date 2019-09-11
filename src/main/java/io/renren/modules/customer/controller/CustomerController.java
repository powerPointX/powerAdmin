package io.renren.modules.customer.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.customer.entity.CustomerEntity;
import io.renren.modules.customer.service.CustomerService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-09-09 09:53:11
 */
@RestController
@RequestMapping("customer/customer")
public class CustomerController extends AbstractController {
    @Autowired
    private CustomerService customerService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("customer:customer:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = customerService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("customer:customer:info")
    public R info(@PathVariable("id") Integer id){
		CustomerEntity customer = customerService.getById(id);

        return R.ok().put("customer", customer);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("customer:customer:save")
    public R save(@RequestBody CustomerEntity customer){
        customer.setCreateBy(getUsername());
        customer.setCreateDate(new Date());
		customerService.save(customer);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("customer:customer:update")
    public R update(@RequestBody CustomerEntity customer){
        customer.setUpdateBy(getUsername());
        customer.setUpdateDate(new Date());
		customerService.updateById(customer);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("customer:customer:delete")
    public R delete(@RequestBody Integer[] ids){
		customerService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
