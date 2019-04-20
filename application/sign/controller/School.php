<?php
/**
 * School.php
 * 报名系统 - 学历提升
 * @author : yzgteam
 * @date : 2019.04.19
 * @version : v1.0.0.0
 */
namespace app\sign\controller;

use data\service\Member;
use data\service\School as SchoolService;
use data\service\Category as CategoryService;
use data\service\Address;
use think\Controller;
use data\service\Platform;

/**
 * 首页控制器
 * 创建人：丁忠太
 * 创建时间：2019年4月19日 11:01:19
 */
class School extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    public function _empty($name)
    {}

    /**
     * 学历提升第一步：同意协议
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 16:15:30
     */
    public function applyAgreement()
    {
        $this->assign("is_read", isset($_GET['is_read']) ? $_GET['is_read'] : 0);
        return view($this->style . 'Shop/applyFristAgreement');
    }

    /**
     * 学历提升第一步：填写个人信息
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 16:15:30
     *
     * @return \think\response\View
     */
    public function applyFristInfo()
    {
        if (empty($this->uid)) {
            $this->redirect(__URL__."/login");
        } else {
            $school = new SchoolService();
            $category = new CategoryService();
            if (request()->isAjax()) {
                $post = input('post.');
                //$apply_type = isset($_POST['apply_type']) ? $_POST['apply_type'] : '';
                $uid = $this->user->getSessionUid();
                $post['uid'] = $uid;
                $retval = $school->addSchoolResume($post);
                return AjaxReturn($retval);
            } else {
                $record = $category->getCategoryList(1,0,array('type' => 'record'));
                $classtype = $category->getCategoryList(1,0,array('type' => 'classtype'));
                $professional = $category->getCategoryList(1,0,array('type' => 'professional'));
                $schools = $category->getCategoryList(1,0,array('type' => 'school'));

                $apply_state = $school->getSchoolIsApply($this->uid);
                $this->assign("apply_state", $apply_state);
                $this->assign("is_read", isset($_GET['is_read']) ? $_GET['is_read'] : 0);
                $this->assign('schools', $schools['data']);
                $this->assign('professional', $professional['data']);
                $this->assign('record', $record['data']);
                $this->assign('classtype', $classtype['data']);

                return view($this->style . 'School/applyFristInfo');
            }
        }

    }

    /**
     * 获取省列表
     */
    public function getProvince()
    {
        $address = new Address();
        $province_list = $address->getProvinceList();
        return $province_list;
    }

    /**
     * 获取城市列表
     *
     * @return Ambigous <multitype:\think\static , \think\false, \think\Collection, \think\db\false, PDOStatement, string, \PDOStatement, \think\db\mixed, boolean, unknown, \think\mixed, multitype:, array>
     */
    public function getCity()
    {
        $address = new Address();
        $province_id = isset($_POST['province_id']) ? $_POST['province_id'] : 0;
        $city_list = $address->getCityList($province_id);
        return $city_list;
    }

    /**
     * 获取区域地址
     */
    public function getDistrict()
    {
        $address = new Address();
        $city_id = isset($_POST['city_id']) ? $_POST['city_id'] : 0;
        $district_list = $address->getDistrictList($city_id);
        return $district_list;
    }

    /**
     * 学历提升第二步：科目选择
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 16:15:30
     *
     * @return \think\response\View
     */
    public function applySecondInfo()
    {
        return view($this->style . 'School/applyFristInfo');
    }

    /**
     * 学历提升，等待审核
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 16:15:30
     *
     * @return \think\response\View
     */
    public function applyFinish()
    {
        return view($this->style . 'School/applyFinish');
    }
}