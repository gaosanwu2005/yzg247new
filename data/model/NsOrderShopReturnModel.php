<?php
/**
 * 商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 御之谷网络科技有限公司, 保留所有权利。
 * ----------------------------------------------
 * 官方网址: http://yzg247.new.my
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * @author : yzgteam
 * @date : 2015.1.17
 * @version : v1.0.0.0
 */
namespace data\model;

use data\model\BaseModel as BaseModel;
/**
 * 店铺退货设置
 * @author Administrator
 *
 */
class NsOrderShopReturnModel extends BaseModel {

    protected $table = 'ns_order_shop_return';
    protected $rule = [
        'shop_id'  =>  '',
    ];
    protected $msg = [
        'shop_id'  =>  '',
    ];
    
}