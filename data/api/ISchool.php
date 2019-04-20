<?php
/**
 * ISchool.php
 *
 * @author : yzgteam
 * @date : 2019.04.20
 * @version : v1.0.0.0
 */
namespace data\api;

/**
 * 学校接口
 */
interface ISchool
{

    /**
     * 添加会员学校报名信息
     *
     * @param array $data
     */
    function addSchoolResume($data = array());

    /**
     * 获取会员学校报名申请情况
     *
     * @param string $uid
     */
    function getSchoolIsApply($uid);

    /**
     * 获取学校详情
     *
     * @param unknown $school_id
     */
    function getSchoolInfo($school_id, $field = '*');

    /**
     * 添加学校
     *
     * @param unknown $shop_name
     * @param unknown $shop_type
     * @param unknown $uid
     * @param unknown $shop_group_id
     * @param unknown $shop_company_name
     * @param unknown $province_id
     * @param unknown $city_id
     * @param unknown $shop_address
     * @param unknown $shop_zip
     * @param unknown $shop_sort
     */
    function addSchoolInfo($shop_name, $shop_type, $uid, $shop_group_id, $shop_company_name, $province_id, $city_id, $shop_address, $shop_zip, $shop_sort, $recommend_uid);

    /**
     * 获取学校会员详情
     *
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $where
     * @param unknown $order
     */
    function getSchoolResumeList($page_index = 1, $page_size = 0, $where = '', $order = 'uid DESC');


}

