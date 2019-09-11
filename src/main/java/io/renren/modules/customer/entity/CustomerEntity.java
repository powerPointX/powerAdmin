package io.renren.modules.customer.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 *
 *
 * @author zev
 * @email ${email}
 * @date 2019-09-09 09:53:11
 */
@Data
@TableName("tb_customer")
public class CustomerEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 * 客户名称
	 */
	private String name;
	/**
	 * 客户地址
	 */
	private String address;
	/**
	 * 联系方式
	 */
	private String phone;
	/**
	 * 联系人
	 */
	private String contacts;
	/**
	 * 创建人
	 */
	private String createBy;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 修改人
	 */
	private String updateBy;
	/**
	 * 修改时间
	 */
	private Date updateDate;
	/**
	 * 客户分类
	 */
	private Integer itemize;
	/**
	 * 备注
	 */
	private String remark;

}
