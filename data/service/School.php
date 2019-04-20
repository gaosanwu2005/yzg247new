<?php
/**
 * School.php
 * 报名系统 - 学历提升
 * @author : yzgteam
 * @date : 2019.04.19
 * @version : v1.0.0.0
 */
namespace data\service;

/**
 * 店铺服务层
 */
use data\service\BaseService as BaseService;
use data\api\ISchool;
use data\model\UserModel;
use data\service\WebSite;
use think;
use data\model\ProvinceModel;
use data\model\CityModel;
use data\model\DistrictModel;
use data\model\BaseModel;

use data\model\NsSchoolResumeModel;
use data\model\NsSchoolInfoModel;

class School extends BaseService implements ISchool
{

    function __construct()
    {
        parent::__construct();
    }

    /**
     * 学历提升提交
     * (non-PHPdoc)
     *
     * @see \data\api\ISchool::addSchoolResume()
     */
    public function addSchoolResume($data = array())
    {
        $school_apply = new NsSchoolResumeModel();
        $condition['uid'] = $data['uid'];
        $count = $school_apply->getCount($condition);
        if ($count > 0) {
            return 0;
        }
        $school_apply->save($data);
        $retval = $school_apply->uid;

        return $retval;
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\ISchool::getSchoolInfo()
     */
    public function getSchoolInfo($school_id, $field = '*')
    {
        $school = new NsSchoolInfoModel();
        $info = $school->getInfo([
            'id' => $school_id
        ], $field);
        return $info;
    }

    /**
     * (non-PHPdoc)
     * shop_id int(11) NOT NULL COMMENT '店铺索引id',
     * shop_name varchar(50) NOT NULL COMMENT '店铺名称',
     * shop_type int(11) NOT NULL COMMENT '店铺类型等级',
     * uid int(11) NOT NULL COMMENT '会员id',
     * shop_group_id int(11) NOT NULL COMMENT '店铺分类',
     * shop_company_name varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
     * province_id mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所在省份ID',
     * city_id mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所在市ID',
     * shop_address varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
     * shop_zip varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
     * shop_state tinyint(1) NOT NULL DEFAULT 2 COMMENT '店铺状态，0关闭，1开启，2审核中',
     * shop_close_info varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
     * shop_sort int(11) NOT NULL DEFAULT 0 COMMENT '店铺排序',
     * shop_create_time varchar(10) NOT NULL DEFAULT '0' COMMENT '店铺时间',
     * shop_end_time varchar(10) DEFAULT NULL COMMENT '店铺关闭时间',
     * shop_logo varchar(255) DEFAULT NULL COMMENT '店铺logo',
     * shop_banner varchar(255) DEFAULT NULL COMMENT '店铺横幅',
     * shop_avatar varchar(150) DEFAULT NULL COMMENT '店铺头像',
     * shop_keywords varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
     * shop_description varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
     * shop_qq varchar(50) DEFAULT NULL COMMENT 'QQ',
     * shop_ww varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
     * shop_phone varchar(20) DEFAULT NULL COMMENT '商家电话',
     * shop_domain varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
     * shop_domain_times tinyint(1) UNSIGNED DEFAULT 0 COMMENT '二级域名修改次数',
     * shop_recommend tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐，0为否，1为是，默认为0',
     * shop_credit int(10) NOT NULL DEFAULT 0 COMMENT '店铺信用',
     * shop_desccredit float NOT NULL DEFAULT 0 COMMENT '描述相符度分数',
     * shop_servicecredit float NOT NULL DEFAULT 0 COMMENT '服务态度分数',
     * shop_deliverycredit float NOT NULL DEFAULT 0 COMMENT '发货速度分数',
     * shop_collect int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺收藏数量',
     * shop_stamp varchar(200) DEFAULT NULL COMMENT '店铺印章',
     * shop_printdesc varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
     * shop_sales int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺销量',
     * shop_workingtime varchar(100) DEFAULT NULL COMMENT '工作时间',
     * live_store_name varchar(255) DEFAULT NULL COMMENT '商铺名称',
     * live_store_address varchar(255) DEFAULT NULL COMMENT '商家地址',
     * live_store_tel varchar(255) DEFAULT NULL COMMENT '商铺电话',
     * live_store_bus varchar(255) DEFAULT NULL COMMENT '公交线路',
     * shop_vrcode_prefix char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
     * store_qtian tinyint(1) DEFAULT 0 COMMENT '7天退换',
     * shop_zhping tinyint(1) DEFAULT 0 COMMENT '正品保障',
     * shop_erxiaoshi tinyint(1) DEFAULT 0 COMMENT '两小时发货',
     * shop_tuihuo tinyint(1) DEFAULT 0 COMMENT '退货承诺',
     * shop_shiyong tinyint(1) DEFAULT 0 COMMENT '试用中心',
     * shop_shiti tinyint(1) DEFAULT 0 COMMENT '实体验证',
     * shop_xiaoxie tinyint(1) DEFAULT 0 COMMENT '消协保证',
     * shop_huodaofk tinyint(1) DEFAULT 0 COMMENT '货到付款',
     * shop_free_time varchar(10) DEFAULT NULL COMMENT '商家配送时间',
     * shop_region varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
     *
     * @see \data\api\IShop::addshop()
     */
    public function addSchoolInfo($shop_name, $shop_type, $uid, $shop_group_id, $shop_company_name, $province_id, $city_id, $shop_address, $shop_zip, $shop_sort, $recommend_uid = 0)
    {
        $school = new NsSchoolInfoModel();
        $condition = array(
            "uid" => $uid
        );
        $count = $school->getCount($condition);
        // 防止出现重复店铺、重复提交问题
        if ($count > 0) {
            return - 1;
        }
        $school->startTrans();
        try {
            $website = new WebSite();
            $shop_id = $website->addSystemInstance($uid, $shop_name, $shop_type);
            $data = array(
                'shop_id' => $shop_id,
                'shop_name' => $shop_name,
                'shop_type' => $shop_type,
                'uid' => $uid,
                'shop_group_id' => $shop_group_id,
                'shop_company_name' => $shop_company_name,
                'province_id' => $province_id,
                'city_id' => $city_id,
                'shop_address' => $shop_address,
                'shop_zip' => $shop_zip,
                'shop_sort' => $shop_sort,
                'recommend_uid' => $recommend_uid
            );
            // 添加店铺
            $retval = $school->save($data);
            //判断版本
            if(NS_VERSION == NS_VAR_B2B2C_FX){
                $this->addShopConfig($shop_id);
            }
            // 添加店铺账户
            $shop_account = new NsShopAccountModel();
            $data_account = array(
                'shop_id' => $shop_id
            );
            $shop_account->save($data_account);
            $school->commit();
            return $shop_id;
        } catch (\Exception $e) {
            $school->rollback();
            return $e->getMessage();
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\ISchool::getSchoolIsApply()
     */
    public function getSchoolIsApply($uid)
    {
        // 是否正在申请
        $school_apply = new NsSchoolResumeModel();
        $apply = $school_apply->get([
            'uid' => $uid
        ]);
        if (! empty($apply)) {
            if ($apply['apply_state'] == 2) {
                // 已被拒绝
                return 'refuse_apply';
            } else if ($apply['apply_state'] == 1) {
                // 已同意
                return 'is_system';
            } else {
                // 存在正在申请
                return 'is_apply';
            }
        } else {
            // 可以申请
            return 'apply';
        }
    }

    /**
     * (non-PHPdoc)
     *
     * @see \data\api\IShop::getSchoolResumeList()
     */
    public function getSchoolResumeList($page_index = 1, $page_size = 0, $where = '', $order = 'uid DESC')
    {
        $school_apply = new NsSchoolResumeModel();
        $list = $school_apply->pageQuery($page_index, $page_size, $where, $order, '*');

        if (! empty($list['data'])) {
            foreach ($list['data'] as $k => $v) {
                $user = new UserModel();
                $userinfo = $user->getInfo([
                    'uid' => $v['uid']
                ], "*");
                $user_name = "";
                $user_tel = "";
                $user_headimg = '';
                if (count($userinfo) > 0) {
                    $user_name = $userinfo["nick_name"];
                    $user_tel = $userinfo["user_tel"];
                    $user_headimg = $userinfo["user_headimg"];
                }
                $list['data'][$k]['real_name'] = $user_name;
                $list['data'][$k]['user_tel'] = $user_tel;
                $list['data'][$k]['user_headimg'] = $user_headimg;
            }
        }

        return $list;
    }

}
