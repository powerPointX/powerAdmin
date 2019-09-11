package io.renren.modules.itemize.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.common.annotation.SysLog;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.itemize.entity.ItemizeEntity;
import io.renren.modules.itemize.service.ItemizeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-08-29 15:18:02
 */
@RestController
@RequestMapping("itemize/itemize")
public class ItemizeController extends AbstractController {
    @Autowired
    private ItemizeService itemizeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("itemize:itemize:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = itemizeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("itemize:itemize:info")
    public R info(@PathVariable("id") Integer id){
		ItemizeEntity itemize = itemizeService.getById(id);

        return R.ok().put("itemize", itemize);
    }

    /**
     * 保存
     */
    @SysLog("保存商品分类")
    @RequestMapping("/save")
    @RequiresPermissions("itemize:itemize:save")
    public R save(@RequestBody ItemizeEntity itemize){
        itemize.setCreateDate(new Date());
        itemize.setCreateBy(getUsername());
		itemizeService.save(itemize);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改商品分类")
    @RequestMapping("/update")
    @RequiresPermissions("itemize:itemize:update")
    public R update(@RequestBody ItemizeEntity itemize){
        //(强转成 人员信息表)SecurityUtils.getSubject().getPrincipal();  shior获取当前登陆人
        itemize.setUpdateDate(new Date());
        itemize.setUpdateBy(getUsername());
		itemizeService.updateById(itemize);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除商品分类")
    @RequestMapping("/delete")
    @RequiresPermissions("itemize:itemize:delete")
    public R delete(@RequestBody Integer[] ids){
		itemizeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
