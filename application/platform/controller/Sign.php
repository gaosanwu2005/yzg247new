<?php
/**
 * Sign.php
 * 报名后台管理
 * @author : yzgteam
 * @date : 2019.4.20
 * @version : v1.0.0.0
 */
namespace app\platform\controller;

use data\service\School;

/**
 * 报名后台管理
 */
class Sign extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 学校报名列表
     */
    public function schoolResumeList()
    {
        if (request()->isAjax()) {
            $school = new School();
            $page_index = request()->post('page_index', 1);
            $page_size = request()->post('page_size', PAGESIZE);
            $search_text = request()->post('search_text', '');
            $condition = array(
                'realname|uid' => array(
                    'like',
                    '%' . $search_text . '%'
                )
            );
            $result = $school->getSchoolResumeList($page_index, $page_size, $condition, 'uid desc');
            return $result;
        } else {
            return view($this->style . 'Sign/schoolResumeList');
        }
    }

    /**
     * 添加学校报名详细信息
     */
    public function addSchoolResume()
    {
        if (request()->isAjax()) {
            $title = isset($_POST['title']) ? $_POST['title'] : '';
            $class_id = isset($_POST['class_id']) ? $_POST['class_id'] : '';
            $short_title = isset($_POST['short_title']) ? $_POST['short_title'] : '';
            $source = isset($_POST['source']) ? $_POST['source'] : '';
            $url = isset($_POST['url']) ? $_POST['url'] : '';
            $author = isset($_POST['author']) ? $_POST['author'] : '';
            $summary = isset($_POST['summary']) ? $_POST['summary'] : '';
            $content = isset($_POST['content']) ? $_POST['content'] : '';
            $image = isset($_POST['image']) ? $_POST['image'] : '';
            $keyword = isset($_POST['keyword']) ? $_POST['keyword'] : '';
            $article_id_array = isset($_POST['article_id_array']) ? $_POST['article_id_array'] : '';
            $click = isset($_POST['click']) ? $_POST['click'] : '';
            $sort = isset($_POST['sort']) ? $_POST['sort'] : '';
            $commend_flag = isset($_POST['commend_flag']) ? $_POST['commend_flag'] : '';
            $comment_flag = isset($_POST['comment_flag']) ? $_POST['comment_flag'] : '';
            $attachment_path = isset($_POST['attachment_path']) ? $_POST['attachment_path'] : '';
            $tag = isset($_POST['tag']) ? $_POST['tag'] : '';
            $comment_count = isset($_POST['comment_count']) ? $_POST['comment_count'] : '';
            $share_count = isset($_POST['share_count']) ? $_POST['share_count'] : '';
            $share_count = isset($_POST['share_count']) ? $_POST['share_count'] : '';
            $status = 2;
            $school = new School();
            $result = $school->getSchoolList($title, $class_id, $short_title, $source, $url, $author, $summary, $content, $image, $keyword, $article_id_array, $click, $sort, $commend_flag, $comment_flag, $status, $attachment_path, $tag, $comment_count, $share_count);
            return AjaxReturn($result);
        } else {
            $school = new School();
            $SchoolResumeList = $school->getSchoolResumeList();
            $this->assign('SchoolResumeList', $SchoolResumeList);
            return view($this->style . 'Sign/addSchoolResume');
        }
    }

    /**
     * 修改学校报名详细
     */
    public function updateSchoolResume()
    {
        $uid = isset($_GET['uid']) ? $_GET['uid'] : '';
        $school = new School();
        $SchoolRefume = $school->getSchoolRefume($uid);
        $attachment_path = explode(",", $SchoolRefume['attachment_path']);
        $SchoolResumeList = $school->getSchoolResumeList();
        $this->assign('attachment_path', $attachment_path[0]);
        $this->assign('uid', $uid);
        $this->assign('SchoolResumeList', $SchoolResumeList);
        $this->assign('SchoolRefume', $SchoolRefume);
        return view($this->style . 'Sign/updateSchoolResume');
    }


    /**
     * 删除学校报名信息
     */
    public function deleteSchoolResume()
    {
        if (request()->isAjax()) {
            $school = new School();
            $uid = isset($_POST['uid']) ? $_POST['uid'] : '';
            $retval = $school->deleteArticle($uid);
            return AjaxReturn($retval);
        }
    }
}