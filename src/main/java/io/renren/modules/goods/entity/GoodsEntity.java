package io.renren.modules.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-08-29 10:37:05
 */
@Data
@TableName("tb_goods")
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 *
	 */
	private String name;
	/**
	 *
	 */
	private Integer num;
	/**
	 *
	 */
	private BigDecimal price;
	/**
	 * 规格
	 */
	private String specs;
	/**
	 *
	 */
	private BigDecimal unitPrice;
	/**
	 *
	 */
	private Integer customerId;
	/**
	 *
	 */
	private String customerName;
	/**
	 *
	 */
	private Date storageDate;
	/**
	 *
	 */
	private Date createDate;
	/**
	 *
	 */
	private String createBy;
	/**
	 *
	 */
	private String updateBy;
	/**
	 *
	 */
	private Date updateDate;
	/**
	 * 商品分类
	 */
	private String itemizeId;

	/**
	 * 商品分类名称
	 */
	@TableField(exist=false)
	private String itemizeName;

}
