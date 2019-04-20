<?php
/**
 * Sign.php
 * 报名系统 - 报名系统首页
 * @author : yzgteam
 * @date : 2019.04.19
 * @version : v1.0.0.0
 */
namespace app\sign\controller;

use data\model\Send;
use data\service\Article;
use data\service\Config as SysConfig;
use data\service\Goods;
use data\service\GoodsCategory;
use data\service\Platform;
use data\service\Shop;
use think\Cache;
use think\Cookie;

/**
 * 首页控制器
 * 创建人：丁忠太
 * 创建时间：2019年4月19日 11:01:19
 */
class Index extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    public function _empty($name)
    {}

    /*
     * 平台首页
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 11:01:19
     *
     * @return \think\response\View
     */
    public function index()
    {
        $default_client = request()->cookie("default_client", "");
        $web_info = $this->web_site->getWebSiteInfo();
        if ($default_client == "sign") {} elseif (request()->isMobile()&&$web_info['wap_status'] != 2) {
            $redirect = __URL(__URL__ . "/wap");
            $this->redirect($redirect);
            exit();
        }
        if ($web_info['web_status'] == 2) {
            webClose($web_info['close_reason']);
        }

        // 当切换到PC端时，隐藏右下角返回手机端按钮
        if (! request()->isMobile() && $default_client == "sign") {
            $default_client = "";
        }

        // 公告
        $platform = new Platform();
        $notice = $platform -> getNoticeList(1, 10, ["shop_id"=>$this->instance_id],"sort");
        $this->assign("notice", $notice["data"]);

        // 文章列表
        $article = new Article();
        $article_list = $article->getArticleList(1, 11, [
            "status" => 2
        ], 'public_time desc');
        $this->assign("article_list", $article_list['data']);

        // 楼层版块
        $platform = new Platform();
        $web_block_list = $platform->getWebBlockListDetail();
        $this->assign('is_head_goods_nav', 1); // 代表默认显示以及分类
        $this->assign('web_block_list', $web_block_list);

        // 楼层版块新
        $good_category = new GoodsCategory();
        $shop_id = $this->instance_id;
        $goods_brand_list = $good_category->getGoodsBrandList(1, 5, [
            "brand_recommend" => 1
        ], '', '');
        $this->assign('goods_brand_list', $goods_brand_list);

        //友情链接
        $link_list = $platform->getLinkList(1, 0, [
            "is_show" => 1
        ], 'link_sort desc');
        $this->assign("link_list", $link_list["data"]);
        return view($this->style . 'Index/index');
    }

    /*
     * 报名首页
     * 创建人：丁忠太
     * 创建时间：2019年4月19日 11:01:19
     *
     * @return \think\response\View
     */
    public function indexEnroll()
    {
        $default_client = request()->cookie("default_client", "");
        $web_info = $this->web_site->getWebSiteInfo();
        if ($default_client == "index") {} elseif (request()->isMobile()&&$web_info['wap_status'] != 2) {
            $redirect = __URL(__URL__ . "/wap");
            $this->redirect($redirect);
            exit();
        }
        if ($web_info['web_status'] == 2) {
            webClose($web_info['close_reason']);
        }

        // 当切换到PC端时，隐藏右下角返回手机端按钮
        if (! request()->isMobile() && $default_client == "shop") {
            $default_client = "";
        }

        // 公告
        $platform = new Platform();
        $notice = $platform -> getNoticeList(1, 10, ["shop_id"=>$this->instance_id],"sort");
        $this->assign("notice", $notice["data"]);

        // 文章列表
        $article = new Article();
        $article_list = $article->getArticleList(1, 11, [
            "status" => 2
        ], 'public_time desc');
        $this->assign("article_list", $article_list['data']);

        // 楼层版块
        $platform = new Platform();
        $web_block_list = $platform->getWebBlockListDetail();
        $this->assign('is_head_goods_nav', 1); // 代表默认显示以及分类
        $this->assign('web_block_list', $web_block_list);

        // 楼层版块新
        $good_category = new GoodsCategory();
        $shop_id = $this->instance_id;
        $goods_brand_list = $good_category->getGoodsBrandList(1, 5, [
            "brand_recommend" => 1
        ], '', '');
        // $this->assign('block_list', $block_list);
        $this->assign('goods_brand_list', $goods_brand_list);

        //友情链接
        $link_list = $platform->getLinkList(1, 0, [
            "is_show" => 1
        ], 'link_sort desc');
        $this->assign("link_list", $link_list["data"]);

        return view($this->style . 'Index/indexEnroll');
    }
    /**
     * 得到当前时间戳的毫秒数
     *
     * @return number
     */
    public function getCurrentTime()
    {
        $time = time();
        $time = $time * 1000;
        return $time;
    }

    /**
     * 删除设置页面打开cookie
     * 创建时间：2019年4月19日 11:01:19 丁忠太
     */
    public function deleteClientCookie()
    {
        Cookie::delete("default_client");
    }
}