<?php
/**
 * Sign.php
 * 报名首页
 * @author : yzgteam
 * @date : 2019.4.20
 * @version : v1.0.0.0
 */
namespace app\wap\controller;

use data\service\NfxUser;
use data\service\Goods as GoodsService;
use data\service\Member as MemberService;
use data\service\Shop as ShopService;
use data\service\Weixin;
use data\service\Config;
use data\service\Platform;
use data\service\School as SchoolService;

/**
 * 店铺控制器
 *
 * @author Administrator
 *
 */
class Sign extends BaseController
{

    /**
     * 店铺主页
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */

    /**
     * 店铺主页
     *
     * @return Ambigous <\think\response\View, \think\response\$this, \think\response\View>
     */
    public function index()
    {
        $this->assign("is_subscribe", 0);
        $shop = new ShopService();
        $shop_info = $shop->getShopInfo($this->shop_id);
        $member = new MemberService();
        $goods = new GoodsService();
        $source_user_name = "";
        $shop_ad_list = $shop->getShopAdList(1, 0, [
            'type' => 1
        ]);
        $this->assign('shop_id', $this->shop_id);
        $this->assign('source_user_name', $source_user_name);
        $this->assign('shop_ad_list', $shop_ad_list["data"]);
        if (null == $shop_info) {
            $this->redirect(__URL__.'/wap'); // 没有商品返回到首页
        }
        $this->assign("shop_info", $shop_info);
        $config = new Config();
        $notice_arr = $config->getNotice($this->shop_id);
        $this->assign('notice', $notice_arr);
        // 是否收藏店铺
        $is_member_fav_shop = $member->getIsMemberFavorites($this->uid, $this->shop_id, 'shop');
        $this->assign("is_member_fav_shop", $is_member_fav_shop);

        $Platform = new Platform();
        $recommend_block = $Platform->getshopPlatformGoodsRecommendClass($shop_id);
        foreach($recommend_block as $k=>$v){
            //获取模块下商品
            $goods_list = $Platform->getPlatformGoodsRecommend($v['class_id']);
            if(empty($goods_list)){
                unset($recommend_block[$k]);
            }
        }
        $ticket = $this->getShareTicket();
        $this->assign('is_shop_member', 1);
        $this->assign("signPackage", $ticket);
        $this->assign("recommend_block", $recommend_block);
        $is_subscribe = 0; // 标识：是否显示顶部关注 0：[隐藏]，1：[显示]
        // 检查是否配置过微信公众号

        $this->assign("is_subscribe", $is_subscribe);

        return view($this->style . '/Shop/index');
    }

    /**
     * 获取推荐类型商品列表
     */
    public function goodsList()
    {
        $shop_id = isset($_GET['shop_id']) ? $_GET['shop_id'] : 1;
        $type = isset($_GET['type']) ? $_GET['type'] : 0;
        $this->assign("search_title", '全部商品');
        $components = new Components();
        $goods_list = $components->getTypeGoodsList($shop_id, $type);
        $this->assign("goods_list", $goods_list);
        return view($this->style . '/Shop/goodsList');
    }

    /**
     * 关注店铺
     */
    public function userAssociateShop()
    {
        if (empty($this->uid)) {
            return - 1;
        } else {
            $nfx_user = new NfxUser();
            $shop_id = isset($_POST['shop_id']) ? $_POST['shop_id'] : '';
            $session_id = 0;
            if (! empty($_SESSION["source_shop_id"])) {
                if ($shop_id == $_SESSION["source_shop_id"]) {
                    $session_id = $_SESSION["source_uid"];
                }
            }
            $retval = $nfx_user->userAssociateShop($this->uid, $shop_id, $session_id);
            return AjaxReturn($retval);
        }
    }
}
