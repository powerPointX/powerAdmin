package io.renren.modules.goods.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.annotation.SysLog;
import io.renren.modules.itemize.entity.ItemizeEntity;
import io.renren.modules.itemize.service.ItemizeService;
import io.renren.modules.sys.controller.AbstractController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.goods.entity.GoodsEntity;
import io.renren.modules.goods.service.GoodsService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-08-29 10:37:05
 */
@RestController
@RequestMapping("goods/goods")
public class GoodsController extends AbstractController {
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ItemizeService itemizeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goods:goods:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = goodsService.queryPage(params);
        List<GoodsEntity> goodsList = (List<GoodsEntity>)page.getList();
        for (GoodsEntity goodsEntity : goodsList){
            ItemizeEntity itemizeEntity = itemizeService.getById(goodsEntity.getItemizeId());
            goodsEntity.setItemizeName(itemizeEntity.getName());
        }
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goods:goods:info")
    public R info(@PathVariable("id") Integer id){

        if(id==0){

            List<ItemizeEntity> itemizeList = itemizeService.list();
            return R.ok().put("itemizeList",itemizeList);

        }else{
            GoodsEntity goods = goodsService.getById(id);
            //在goods页面  实现商品分类下拉框
            List<ItemizeEntity> itemizeList = itemizeService.list();
            //根据下拉框的默认值 查出显示
            ItemizeEntity itemize = itemizeService.getById(goods.getItemizeId());
            return R.ok().put("goods", goods).put("itemizeList",itemizeList).put("itemize",itemize);
        }
    }

    /**
     * 保存
     */
    @SysLog("保存商品")
    @RequestMapping("/save")
    @RequiresPermissions("goods:goods:save")
    public R save(@RequestBody GoodsEntity goods){
        goods.setCreateDate(new Date());
        goods.setCreateBy(getUsername());
		goodsService.save(goods);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改商品信息")
    @RequestMapping("/update")
    @RequiresPermissions("goods:goods:update")
    public R update(@RequestBody GoodsEntity goods){
        goods.setUpdateDate(new Date());
        goods.setUpdateBy(getUsername());
		goodsService.updateById(goods);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除商品")
    @RequestMapping("/delete")
    @RequiresPermissions("goods:goods:delete")
    public R delete(@RequestBody Integer[] ids){
		goodsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
