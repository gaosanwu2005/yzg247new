-- phpMyAdmin SQL Dump
-- version 4.0.10.19
-- https://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019-04-20 18:27:19
-- 服务器版本: 5.5.54-log
-- PHP 版本: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `yzg247_new_my`
--

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_article`
--

CREATE TABLE IF NOT EXISTS `nc_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题图片',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-草稿、1-待审核、2-已发布、-1-回收站',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `uid` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `last_comment_time` int(11) DEFAULT '0' COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT '0' COMMENT '发布时间',
  `create_time` int(11) DEFAULT '0' COMMENT '文章发布时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '文章修改时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6553 COMMENT='CMS文章表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nc_cms_article`
--

INSERT INTO `nc_cms_article` (`article_id`, `title`, `class_id`, `short_title`, `source`, `url`, `author`, `summary`, `content`, `image`, `keyword`, `article_id_array`, `click`, `sort`, `commend_flag`, `comment_flag`, `status`, `attachment_path`, `tag`, `comment_count`, `share_count`, `publisher_name`, `uid`, `last_comment_time`, `public_time`, `create_time`, `modify_time`) VALUES
(1, '24332423', 0, '4324', '', '', '', '', '431243214123', 'upload/common/1555745054.gif', '', '', 0, 0, 1, 1, 2, '', '23', 0, 0, '10', 10, 0, 1555646196, 1555646196, 1555745056);

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_article_class`
--

CREATE TABLE IF NOT EXISTS `nc_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='cms文章分类表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `nc_cms_article_class`
--

INSERT INTO `nc_cms_article_class` (`class_id`, `pid`, `name`, `sort`) VALUES
(6, 0, '影视专栏', 1),
(7, 0, '游戏天地', 2);

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_comment`
--

CREATE TABLE IF NOT EXISTS `nc_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `text` varchar(2000) NOT NULL COMMENT '评论内容',
  `uid` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `quote_comment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论引用',
  `up` int(10) unsigned NOT NULL COMMENT '点赞数量',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='CMS评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nc_cms_topic`
--

CREATE TABLE IF NOT EXISTS `nc_cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `instance_id` int(10) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(255) NOT NULL COMMENT '专题标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '专题封面',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专题状态  0草稿  1发布',
  `content` text NOT NULL COMMENT '专题内容',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='专题' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `nc_cms_topic`
--

INSERT INTO `nc_cms_topic` (`topic_id`, `instance_id`, `title`, `image`, `status`, `content`, `create_time`, `modify_time`) VALUES
(2, 0, '复仇者联盟4你会去看吗', 'upload/common/1555569821.png', 1, '<p>复仇者联盟4，集结出发！</p>', 1555569832, 1555569850);

-- --------------------------------------------------------

--
-- 表的结构 `ns_account`
--

CREATE TABLE IF NOT EXISTS `ns_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单入账总额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取利润总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家提现总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金总额',
  `account_assistant` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '招商员支付总额',
  `account_user_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员提现金额',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商城资金统计' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_account`
--

INSERT INTO `ns_account` (`account_id`, `account_order_money`, `account_return`, `account_withdraw`, `account_deposit`, `account_assistant`, `account_user_withdraw`) VALUES
(1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_order_records`
--

CREATE TABLE IF NOT EXISTS `ns_account_order_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='金额账户记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_period`
--

CREATE TABLE IF NOT EXISTS `ns_account_period` (
  `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总提现额',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商城账期结算表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_records`
--

CREATE TABLE IF NOT EXISTS `ns_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='金额账户记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_return_records`
--

CREATE TABLE IF NOT EXISTS `ns_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `account_type` int(11) NOT NULL DEFAULT '0' COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='平台的利润的记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_withdraw_records`
--

CREATE TABLE IF NOT EXISTS `ns_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='金额账户记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_account_withdraw_user_records`
--

CREATE TABLE IF NOT EXISTS `ns_account_withdraw_user_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_arrival_guide`
--

CREATE TABLE IF NOT EXISTS `ns_arrival_guide` (
  `guide_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` text COMMENT '内容',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ns_arrival_guide`
--

INSERT INTO `ns_arrival_guide` (`guide_id`, `title`, `sort`, `image`, `content`, `modify_time`) VALUES
(1, '招商方向', 0, '', '<p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">平台招商方向</p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><h1 style="box-sizing: content-box; margin: 0px; padding: 0px; font-size: 1em; font-weight: normal; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">1.&nbsp;&nbsp;&nbsp; 品牌</h1><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p><span style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 国际国内知名品牌</span><br style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/></p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; &nbsp;开放平台将一如既往的最大程度地维护卖家的品牌利益，尊重品牌传统和内涵，欢迎优质品牌旗</p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">舰店入驻，请参见《2014年开放平台重点招募品牌》。</p><h1 style="box-sizing: content-box; margin: 0px; padding: 0px; font-size: 1em; font-weight: normal; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);"><br/></h1><h1 style="box-sizing: content-box; margin: 0px; padding: 0px; font-size: 1em; font-weight: normal; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">2.&nbsp;&nbsp;&nbsp; 货品</h1><p><span style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 能够满足用户群体优质、有特色的货品。</span><br style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据类目结构细分的货品配置。类目规划详见《2014年开放平台类目一览表》。</span><br style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/></p><h1 style="box-sizing: content-box; margin: 0px; padding: 0px; font-size: 1em; font-weight: normal; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);">3.&nbsp;&nbsp; 垂直电商</h1><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">&nbsp; &nbsp; &nbsp; 开放平台欢迎垂直类电商入驻。开放平台愿意和专业的垂直电商企业分享其优质用户群体，</p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">并且欢迎垂直电商为用户提供该领域专业的货品及服务。</p><p><br/></p>', 1511776231),
(2, '招商标准', 0, '', '<p><span style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; background-color: rgb(255, 255, 255);">本标准适用于除虚拟业务（包括但不限于旅游、酒店、票务、充值、彩票）外的平台开放平台所有卖家。</span></p>', 1511776261),
(3, '资质要求', 0, '', '<p><strong style="color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">平台开放平台招商资质标准细则</strong></p>', 1511776317),
(4, '资费标准', 0, '', '<p style="box-sizing: content-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;microsoft yahei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);">资费标准</p><p><br/></p>', 1511776535);

-- --------------------------------------------------------

--
-- 表的结构 `ns_attribute`
--

CREATE TABLE IF NOT EXISTS `ns_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品相关属性' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ns_attribute`
--

INSERT INTO `ns_attribute` (`attr_id`, `attr_name`, `is_use`, `spec_id_array`, `sort`, `create_time`, `modify_time`) VALUES
(2, '书籍', 1, '', 0, 1555568512, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_attribute_value`
--

CREATE TABLE IF NOT EXISTS `ns_attribute_value` (
  `attr_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT '1999' COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品属性值' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_attribute_value`
--

INSERT INTO `ns_attribute_value` (`attr_value_id`, `attr_value_name`, `attr_id`, `value`, `type`, `sort`, `is_search`) VALUES
(3, '书籍', 2, '', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_bureau`
--

CREATE TABLE IF NOT EXISTS `ns_bureau` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报名id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `realname` varchar(10) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别，默认为1男',
  `idtype` tinyint(2) NOT NULL DEFAULT '1' COMMENT '证件类型:1=居民身份证,2=护照',
  `national` varchar(10) NOT NULL DEFAULT '' COMMENT '民族',
  `idcard` varchar(255) DEFAULT NULL COMMENT '证件号码',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `residence` varchar(120) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `company_province_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地市ID',
  `company_district_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `mobile2` varchar(20) NOT NULL DEFAULT '' COMMENT '备用手机',
  `idcardimg` varchar(255) DEFAULT NULL COMMENT '身份证照片',
  `headimg` varchar(255) DEFAULT NULL COMMENT '证件照照片',
  `school` varchar(255) DEFAULT NULL COMMENT '考点',
  `category` varchar(255) NOT NULL COMMENT '科目',
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '考试状态:1=待审核,2=已审核,3=未通过',
  `price` decimal(5,0) NOT NULL DEFAULT '600' COMMENT '价格',
  `create_dt` datetime DEFAULT NULL COMMENT '创建时间',
  `exam_dt` date DEFAULT '0000-00-00' COMMENT '考试时间',
  `email` varchar(30) NOT NULL COMMENT '电子邮箱',
  `email2` varchar(30) NOT NULL COMMENT '备用邮箱',
  `bureau_type` tinyint(2) DEFAULT '1' COMMENT '司局类型:1=安监局,2=质检局,3=人保部',
  `category2` int(5) NOT NULL COMMENT '二级学科',
  `grade` int(5) NOT NULL COMMENT '职称',
  `graduationimg` varchar(255) NOT NULL COMMENT '学历照',
  `applicationimg` varchar(255) NOT NULL COMMENT '申请表',
  `commitmentimg` varchar(255) NOT NULL COMMENT '承诺书',
  `highlightimg` varchar(255) NOT NULL COMMENT '高级证书',
  `politics` varchar(100) NOT NULL COMMENT '政治面貌',
  `education` varchar(100) NOT NULL COMMENT '文化程度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司局报名信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_cart`
--

CREATE TABLE IF NOT EXISTS `ns_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='购物车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_category`
--

CREATE TABLE IF NOT EXISTS `ns_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表' AUTO_INCREMENT=302 ;

--
-- 转存表中的数据 `ns_category`
--

INSERT INTO `ns_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal'),
(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal'),
(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal'),
(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal'),
(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal'),
(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal'),
(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal'),
(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal'),
(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal'),
(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal'),
(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal'),
(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal'),
(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal'),
(14, 0, 'shop_goods', '手机数码', '手机数码', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '手机数码', 'phone', '', 1539134626, 1543139795, 14, 'normal'),
(15, 0, 'express', '申通快递', '申通快递', '', '', '申通快递', '申通快递', '', 1539135184, 1543136517, 15, 'normal'),
(16, 0, 'express', '顺丰速运', '顺丰速运', '', '', '顺丰速运', '顺丰速运', '', 1539135206, 1543136550, 16, 'normal'),
(17, 0, 'spec_type', '存储容量', '存储容量', '', '', '存储容量', '16G , 32G , 64G , 128G，256，512', '', 1539139620, 1543212192, 17, 'normal'),
(18, 0, 'spec_type', '颜色分类', '颜色分类', '', '', '颜色分类', '土豪金 , 象牙白 , 宝石蓝', '', 1539139835, 1543212205, 18, 'normal'),
(19, 0, 'shop_goods', '生活用品', '生活用品', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '生活用品', 'shyp', '', 1540006452, 1543147747, 19, 'normal'),
(21, 0, 'shop_goods', '数码电器', '数码电器', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '数码电器', '数码电器', '', 1540006724, 1543146532, 21, 'normal'),
(22, 0, 'shop_goods', '服饰内衣', '服饰内衣', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '服饰内衣', '服饰内衣', '', 1540006776, 1543147377, 22, 'normal'),
(23, 0, 'shop_goods', '时尚轻奢', '时尚轻奢', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '时尚轻奢', '时尚轻奢', '', 1540006806, 1543145960, 23, 'normal'),
(24, 0, 'shop_goods', '母婴用品', '母婴用品', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '母婴用品', 'myyp', '', 1540006841, 1543142168, 24, 'normal'),
(27, 14, 'shop_goods', 'HUWEI', 'HUWEI', '', '/uploads/20181125/9875af6f8129628df421821c53c10d35.jpg', 'HUWEI', 'HUWEI', '', 1540019508, 1543139732, 27, 'normal'),
(28, 14, 'shop_goods', 'MI', 'MI', '', '/uploads/20181125/ea1615367c63d252db8d446693649aba.jpg', 'MI', 'MI', '', 1540019528, 1543137529, 28, 'normal'),
(29, 14, 'shop_goods', 'IPhone', 'IPhone', '', '/uploads/20181125/f1a2a0bcc26c03e4ce0652a20bd84f31.jpg', 'IPhone', 'IPhone', '', 1540019553, 1543137700, 29, 'normal'),
(30, 0, 'article', '新手指南', '新手指南', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '新手指南', '新手指南', '', 1542782056, 1543083423, 30, 'normal'),
(35, 0, 'article', '新闻资讯', '新闻资讯', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '新闻资讯', '新闻资讯', '', 1543083415, 1543083415, 35, 'normal'),
(37, 0, 'express', '圆通速递', '圆通速递', '', '/uploads/20181125/a6f6705c1936f636c713d80e7cc870c5.png', '圆通速递', '圆通速递', '', 1543136150, 1543136533, 37, 'normal'),
(38, 0, 'express', '中通速递', '中通速递', '', '', '中通速递', '中通速递', '', 1543136173, 1543136570, 38, 'normal'),
(39, 0, 'express', '百世快递', '百世快递', '', '', '百世快递', '百世快递', '', 1543136190, 1543136602, 39, 'normal'),
(40, 0, 'express', '韵达快递', '韵达快递', '', '', '韵达快递', '韵达快递', '', 1543136220, 1543136612, 40, 'normal'),
(41, 0, 'express', '天天快递', '天天快递', '', '', '天天快递', '天天快递', '', 1543136267, 1543136267, 41, 'normal'),
(42, 0, 'express', '邮政EMS', '邮政EMS', '', '', '邮政EMS', '邮政EMS', '', 1543136357, 1543136645, 42, 'normal'),
(43, 0, 'express', '宅急送', '宅急送', '', '', '宅急送', '宅急送', '', 1543136474, 1543136474, 43, 'normal'),
(44, 14, 'shop_goods', 'VIVO', 'VIVO', '', '/uploads/20181125/279fdccc8c5f7427b44d1cf8c410a91b.jpg', 'VIVO', 'VIVO', '', 1543138153, 1543138225, 44, 'normal'),
(45, 14, 'shop_goods', 'OPPO', 'OPPO', '', '/uploads/20181125/9f519d1ba8afc13cf18d172083475d97.png', 'OPPO', 'OPPO', '', 1543138487, 1543138487, 45, 'normal'),
(46, 14, 'shop_goods', 'GEMRY', 'GEMRY', '', '/uploads/20181125/1604c997a279d6b4e90ee620ab933037.jpg', 'GEMRY', 'GEMRY', '', 1543139037, 1543139037, 46, 'normal'),
(47, 14, 'shop_goods', '8848', '8848', '', '/uploads/20181125/120ba6ff69b5ab565ed53dcd945cfcba.jpg', '8848', '8848', '', 1543139605, 1543139605, 47, 'normal'),
(49, 19, 'shop_goods', '厨房用品', '厨房用品', '', '/uploads/20181125/66ea852b52474aeb1748e190f457b4bf.jpg', '厨房用品', '厨房用品', '', 1543140323, 1543148860, 49, 'normal'),
(50, 19, 'shop_goods', '床上用品', '床上用品', '', '/uploads/20181125/f747f250d00dd7c3f2cf75ed236b27f0.jpg', '床上用品', '床上用品', '', 1543140494, 1543148180, 50, 'normal'),
(51, 19, 'shop_goods', '家装主材', '家装主材', '', '/uploads/20181125/0693cd67609bbc8dc49d57b65190347e.jpg', '家装主材', '家装主材', '', 1543141223, 1543147931, 51, 'normal'),
(53, 24, 'shop_goods', '婴儿奶粉', '婴儿奶粉', '', '/uploads/20181125/65ae9b1ebad851c3de7e014a98b38ac6.jpg', '婴儿奶粉', '婴儿奶粉', '', 1543141881, 1543141881, 53, 'normal'),
(54, 24, 'shop_goods', '婴儿食品', '婴儿食品', '', '/uploads/20181125/cf8db9e1af38395c87928659033b802d.jpg', '婴儿食品', '婴儿食品', '', 1543142055, 1543142055, 54, 'normal'),
(55, 24, 'shop_goods', '婴儿营养品', '婴儿营养品', '', '/uploads/20181125/b6475766d9fe5bc04d874bc303db244e.jpg', '婴儿营养品', '婴儿营养品', '', 1543142154, 1543144430, 55, 'normal'),
(56, 24, 'shop_goods', '纸尿裤', '纸尿裤', '', '/uploads/20181125/80f45603e673eda1a141a925fc1f0654.jpg', '纸尿裤', '纸尿裤', '', 1543144649, 1543144649, 56, 'normal'),
(57, 24, 'shop_goods', '湿巾', '湿巾', '', '/uploads/20181125/22a4a558a52580bfe47f6ea49a36011c.jpg', '湿巾', '湿巾', '', 1543144849, 1543144849, 57, 'normal'),
(58, 24, 'shop_goods', '孕妈用品', '孕妈用品', '', '/uploads/20181125/a7f802c9738d8a7800e9cfdfa74fd82a.jpg', '孕妈用品', '孕妈用品', '', 1543145053, 1543145074, 58, 'normal'),
(59, 24, 'shop_goods', '出行用品', '出行用品', '', '/uploads/20181125/e7d0b71f11e4369e861a71d37e3d42fa.jpg', '出行用品', '出行用品', '', 1543145228, 1543145228, 59, 'normal'),
(60, 0, 'shop_goods', '美容护肤', '美容护肤', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '美容护肤', '美容护肤', '', 1543145306, 1543145306, 60, 'normal'),
(61, 60, 'shop_goods', '卸妆洁面', '卸妆洁面', '', '/uploads/20181125/8df468c9973a65e0ec2fee8422dbb5cb.jpg', '卸妆洁面', '卸妆洁面', '', 1543145505, 1543145505, 61, 'normal'),
(62, 60, 'shop_goods', '化妆水', '化妆水', '', '/uploads/20181125/f5abc5d4850c966ebba9abc644e06ade.jpg', '化妆水', '化妆水', '', 1543145577, 1543145716, 62, 'normal'),
(63, 60, 'shop_goods', '乳液/面霜', '乳液/面霜', '', '/uploads/20181125/18fc1d4c1740b8eb7e15a35c89e3c41e.jpg', '乳液/面霜', '乳液/面霜', '', 1543145734, 1543145734, 63, 'normal'),
(64, 60, 'shop_goods', '面膜', '面膜', '', '/uploads/20181125/54a545d93ddb90c2347b16ba0fd24574.jpg', '面膜', '面膜', '', 1543145796, 1543145796, 64, 'normal'),
(65, 60, 'shop_goods', '化妆品', '化妆品', '', '/uploads/20181125/a7d42006d7a13ab71a81aaca6add38f8.jpg', '化妆品', '化妆品', '', 1543145909, 1543145909, 65, 'normal'),
(66, 23, 'shop_goods', '女包', '女包', '', '/uploads/20181125/b413f7f8bcbb347d1f2a9a072a125c0d.jpg', '女包', '女包', '', 1543146162, 1543146162, 66, 'normal'),
(67, 23, 'shop_goods', '男包', '男包', '', '/uploads/20181125/0ae8bae11ff891ad353863d1071c94a2.jpg', '男包', '男包', '', 1543146206, 1543146206, 67, 'normal'),
(68, 23, 'shop_goods', '名表', '名表', '', '/uploads/20181125/e194c46d2c88c5029cb501acf70cd82e.jpg', '名表', '名表', '', 1543146270, 1543146270, 68, 'normal'),
(69, 23, 'shop_goods', '眼镜', '眼镜', '', '/uploads/20181125/5e5b92ff3d344fce97e00514e651b86f.jpg', '眼镜', '眼镜', '', 1543146379, 1543152872, 69, 'normal'),
(70, 23, 'shop_goods', '轻奢饰品', '轻奢饰品', '', '/uploads/20181125/31dff8c598225f0a35cd8e63ee1c40df.jpg', '轻奢饰品', '轻奢饰品', '', 1543146485, 1543151785, 70, 'normal'),
(71, 21, 'shop_goods', '厨房家电', '厨房家电', '', '/uploads/20181125/19e14c2fcacecbb9ac1a7bf1fdaa72fa.jpg', '厨房家电', '厨房家电', '', 1543146879, 1543146879, 71, 'normal'),
(72, 21, 'shop_goods', '影音电器', '影音电器', '', '/uploads/20181125/b80bdca01a1c5cd2b565fc3152e77a42.jpg', '影音电器', '影音电器', '', 1543147077, 1543147077, 72, 'normal'),
(73, 21, 'shop_goods', '生活电器', '生活电器', '', '/uploads/20181125/3f13cd1837872f9dd245a13bfeb21a77.jpg', '生活电器', '生活电器', '', 1543147160, 1543147160, 73, 'normal'),
(74, 21, 'shop_goods', '办公用品', '办公用品', '', '/uploads/20181125/00b811f101a9794e2c09e51536d96e78.jpg', '办公用品', '办公用品', '', 1543147249, 1543147249, 74, 'normal'),
(75, 21, 'shop_goods', '美体美容', '美体美容', '', '/uploads/20181125/d9568cf7b771776f0b17787fd81c3c20.jpg', '美体美容', '美体美容', '', 1543147311, 1543147311, 75, 'normal'),
(76, 22, 'shop_goods', '轻奢男装', '轻奢男装', '', '/uploads/20181125/9dec1d6eb6de2b8ffc93e058886edaab.jpg', '轻奢男装', '轻奢男装', '', 1543149747, 1543151737, 76, 'normal'),
(77, 22, 'shop_goods', '轻奢女装', '轻奢女装', '', '/uploads/20181125/bb1a5dad912457564f6926ac186cab98.jpg', '轻奢女装', '轻奢女装', '', 1543149781, 1543151727, 77, 'normal'),
(78, 22, 'shop_goods', '轻奢男鞋', '轻奢男鞋', '', '/uploads/20181125/ae8d04057e287af5c8e7da43a59a0275.jpg', '轻奢男鞋', '轻奢男鞋', '', 1543150157, 1543150157, 78, 'normal'),
(79, 22, 'shop_goods', '轻奢女鞋', '轻奢女鞋', '', '/uploads/20181125/af18573246bf886b331c37903344ee0c.jpg', '轻奢女鞋', '轻奢女鞋', '', 1543150238, 1543150238, 79, 'normal'),
(80, 23, 'shop_goods', '轻奢腰带', '轻奢腰带', '', '/uploads/20181125/3cbc48d1275ca377955fb7146c9fe790.jpg', '轻奢腰带', '轻奢腰带', '', 1543150366, 1543150366, 80, 'normal'),
(82, 0, 'shop_goods', '酒水', '酒水', '', '/uploads/20181125/4dcae11803a449e415cd9a418b56841f.png', '品牌酒水', '酒水', '', 1543152816, 1543152882, 82, 'normal'),
(83, 82, 'shop_goods', '红酒', '红酒', '', '/uploads/20181125/3ef9c21fc5d5fa505f833b9ccda91e54.jpg', '红酒', '红酒', '', 1543152923, 1543152923, 83, 'normal'),
(84, 82, 'shop_goods', '洋酒', '洋酒', '', '/uploads/20181125/56b619d1bf6dae74bfb8d54c6ef1d641.jpg', '洋酒', '洋酒', '', 1543153176, 1543153176, 84, 'normal'),
(85, 82, 'shop_goods', '白酒', '白酒', '', '/uploads/20181125/223b9a83c2060a73911ab73aa42aa885.jpg', '白酒', '白酒', '', 1543153747, 1543153767, 85, 'normal'),
(86, 0, 'article', '公告', '公告', '', '/uploads/20181126/4dcae11803a449e415cd9a418b56841f.png', '公告', '公告', '', 1543200258, 1543200959, 86, 'normal'),
(87, 0, 'spec_type', '尺码', '尺码', '', '', '尺码', '', '', 1543212228, 1543212241, 87, 'normal'),
(88, 14, 'shop_goods', 'SAMSUNG', 'SAMSUNG', '', '/uploads/20181225/12b75398b0d4d3f13874e6d865901a59.jpg', 'SAMSUNG', 'SAMSUNG', '', 1545750087, 1545806045, 88, 'normal'),
(89, 19, 'shop_goods', '餐饮用品', '餐饮用品', '', '/uploads/20181226/149cb8c77e4d9422842425108b7b0e39.jpg', '餐饮用品', '餐饮用品', '', 1545806014, 1545806032, 89, 'normal'),
(92, 0, 'school', '郑州大学', '郑州大学', '', '/uploads/20190109/31a61885ad594f27b0cc66c3d63cfbb2.jpg', '郑州大学', '郑州大学', '', 1546996602, 1546996602, 92, 'normal'),
(93, 0, 'school', '湖南大学', '湖南大学', '', '/uploads/20190109/857736a81b2216dbf91e9187761de0fb.jpg', '湖南大学', '湖南大学', '', 1546996720, 1546996720, 93, 'normal'),
(94, 0, 'school', '河南农业大学', '河南农业大学', '', '/uploads/20190109/c655a6ed150924e80f02f1ff8e435f0c.jpg', '河南农业大学', '河南农业大学', '', 1546996872, 1546996872, 94, 'normal'),
(95, 0, 'professional', '经济学', '经济学', '', '', '经济学', '经济学', '', 1546997072, 1546997072, 95, 'normal'),
(96, 0, 'professional', '工程质量监督与管理', '工程质量监督与管理', '', '', '工程质量监督与管理', '工程质量监督与管理', '', 1546997157, 1546997157, 96, 'normal'),
(97, 0, 'professional', '计算机信息管理', '计算机信息管理', '', '', '计算机信息管理', '计算机信息管理', '', 1546997394, 1546997394, 97, 'normal'),
(98, 0, 'professional', '计算机科学与技术', '计算机科学与技术', '', '', '计算机科学与技术', '计算机科学与技术', '', 1546997407, 1546997407, 98, 'normal'),
(99, 0, 'professional', '机械制造与自动化', '机械制造与自动化', '', '', '机械制造与自动化', '机械制造与自动化', '', 1546997420, 1546997420, 99, 'normal'),
(100, 0, 'professional', '机电一体化技术', '机电一体化技术', '', '', '机电一体化技术', '机电一体化技术', '', 1546997430, 1546997430, 100, 'normal'),
(101, 0, 'professional', '电气自动化技术', '电气自动化技术', '', '', '电气自动化技术', '电气自动化技术', '', 1546997441, 1546997441, 101, 'normal'),
(102, 0, 'professional', '工商企业管理', '工商企业管理', '', '', '工商企业管理', '工商企业管理', '', 1546997451, 1546997451, 102, 'normal'),
(103, 0, 'professional', '市场营销', '市场营销', '', '', '市场营销', '市场营销', '', 1546997463, 1546997463, 103, 'normal'),
(104, 0, 'professional', '电力工程管理', '电力工程管理', '', '', '电力工程管理', '电力工程管理', '', 1546997478, 1546997478, 104, 'normal'),
(105, 0, 'professional', '电子信息工程技术', '电子信息工程技术', '', '', '电子信息工程技术', '电子信息工程技术', '', 1546997489, 1546997489, 105, 'normal'),
(106, 0, 'professional', '资源勘查工程通信技术', '资源勘查工程通信技术', '', '', '资源勘查工程通信技术', '资源勘查工程通信技术', '', 1546997503, 1546997503, 106, 'normal'),
(107, 0, 'professional', '工程管理软件技术', '工程管理软件技术', '', '', '工程管理软件技术', '工程管理软件技术', '', 1546997515, 1546997515, 107, 'normal'),
(108, 0, 'professional', '安全工程', '安全工程', '', '', '安全工程', '安全工程', '', 1546997527, 1546997527, 108, 'normal'),
(109, 0, 'professional', '土地资源管理', '土地资源管理', '', '', '土地资源管理', '土地资源管理', '', 1546997539, 1546997539, 109, 'normal'),
(110, 0, 'professional', '机电一体化技术', '机电一体化技术', '', '', '机电一体化技术', '机电一体化技术', '', 1546997551, 1546997551, 110, 'normal'),
(111, 0, 'professional', '土木工程', '土木工程', '', '', '土木工程', '土木工程', '', 1546997562, 1546997562, 111, 'normal'),
(112, 0, 'professional', '工程造价', '工程造价', '', '', '工程造价', '工程造价', '', 1546997573, 1546997573, 112, 'normal'),
(113, 0, 'professional', '行政管理', '行政管理', '', '', '行政管理', '行政管理', '', 1546997585, 1546997585, 113, 'normal'),
(114, 0, 'professional', '物流管理', '物流管理', '', '', '物流管理', '物流管理', '', 1546997598, 1546997598, 114, 'normal'),
(115, 0, 'professional', '建筑工程技术', '建筑工程技术', '', '', '建筑工程技术', '建筑工程技术', '', 1546997609, 1546997609, 115, 'normal'),
(116, 0, 'professional', '人力资源管理', '人力资源管理', '', '', '人力资源管理', '人力资源管理', '', 1546997619, 1546997619, 116, 'normal'),
(117, 0, 'professional', '电脑艺术设计', '电脑艺术设计', '', '', '电脑艺术设计', '电脑艺术设计', '', 1546997630, 1546997630, 117, 'normal'),
(118, 0, 'professional', '财务管理', '财务管理', '', '', '财务管理', '财务管理', '', 1546997642, 1546997642, 118, 'normal'),
(119, 0, 'professional', '教育学', '教育学', '', '', '教育学', '教育学', '', 1546997653, 1546997653, 119, 'normal'),
(120, 0, 'professional', '会计', '会计', '', '', '会计', '会计', '', 1546997664, 1546997664, 120, 'normal'),
(121, 0, 'professional', '金融', '金融', '', '', '金融', '金融', '', 1546997679, 1546997679, 121, 'normal'),
(122, 0, 'professional', '法律', '法律', '', '', '法律', '法律', '', 1546997689, 1546997689, 122, 'normal'),
(123, 0, 'professional', '护理', '护理', '', '', '护理', '护理', '', 1546997701, 1546997701, 123, 'normal'),
(124, 0, 'professional', '药学', '药学', '', '', '药学', '药学', '', 1546997711, 1546997711, 124, 'normal'),
(125, 0, 'professional', '电子商务', '电子商务', '', '', '电子商务', '电子商务', '', 1546997724, 1546997724, 125, 'normal'),
(126, 0, 'professional', '采购管理', '采购管理', '', '', '采购管理', '采购管理', '', 1546997735, 1546997735, 126, 'normal'),
(127, 0, 'professional', '能源管理', '能源管理', '', '', '能源管理', '能源管理', '', 1546997746, 1546997746, 127, 'normal'),
(128, 0, 'professional', '金融管理', '金融管理', '', '', '金融管理', '金融管理', '', 1546997756, 1546997756, 128, 'normal'),
(129, 0, 'professional', '商务管理', '商务管理', '', '', '商务管理', '商务管理', '', 1546997767, 1546997767, 129, 'normal'),
(130, 0, 'school', '苏州大学', '苏州大学', '', '/uploads/20190109/73127db8ff6d5744a73ca25f300c05c0.jpg', '苏州大学', '苏州大学', '', 1546997879, 1546997879, 130, 'normal'),
(131, 0, 'record', '无学历升专科', '无学历升专科', '', '', '无学历升专科', '无学历升专科', '', 1547001370, 1547001370, 131, 'normal'),
(132, 0, 'record', '无学历升本科', '无学历升本科', '', '', '无学历升本科', '无学历升本科', '', 1547001385, 1547001385, 132, 'normal'),
(133, 0, 'record', '高中生专科', '高中生专科', '', '', '高中生专科', '高中生专科', '', 1547021038, 1547021038, 133, 'normal'),
(134, 0, 'record', '专科生本科', '专科生本科', '', '', '专科生本科', '专科生本科', '', 1547021063, 1547021063, 134, 'normal'),
(135, 0, 'record', '修第二学历', '修第二学历', '', '', '修第二学历', '修第二学历', '', 1547021083, 1547021083, 135, 'normal'),
(136, 0, 'classtype', '全日制', '全日制', '', '', '全日制', '全日制', '', 1547107741, 1547107741, 136, 'normal'),
(137, 0, 'classtype', '寒假班', '寒假班', '', '', '寒假班', '寒假班', '', 1547107752, 1547107752, 137, 'normal'),
(138, 0, 'classtype', '暑假班', '暑假班', '', '', '暑假班', '暑假班', '', 1547107761, 1547107761, 138, 'normal'),
(139, 0, 'classtype', '周末班', '周末班', '', '', '周末班', '周末班', '', 1547107769, 1547107769, 139, 'normal'),
(140, 0, 'classtype', '随到随学', '随到随学', '', '', '随到随学', '随到随学', '', 1547107777, 1547107777, 140, 'normal'),
(141, 0, 'classtype', '晚班', '晚班', '', '', '晚班', '晚班', '', 1547107786, 1547107786, 141, 'normal'),
(142, 0, 'classtype', '业余班', '业余班', '', '', '业余班', '业余班', '', 1547107795, 1547107795, 142, 'normal'),
(143, 0, 'classtype', '一对一班', '一对一班', '', '', '一对一班', '一对一班', '', 1547107808, 1547107808, 143, 'normal'),
(144, 0, 'subject', '电工作业', '电工作业', '', '', '电工作业', '电工作业', '', 1554194496, 1554194535, 144, 'normal'),
(145, 0, 'subject', '焊接与热切割作业', '焊接与热切割作业', '', '', '焊接与热切割作业', '焊接与热切割作业', '', 1554194620, 1554194620, 145, 'normal'),
(146, 0, 'subject', '制冷与空调作业', '制冷与空调作业', '', '', '制冷与空调作业', '制冷与空调作业', '', 1554194632, 1554194632, 146, 'normal'),
(147, 0, 'subject', '危险化学品安全作业', '危险化学品安全作业', '', '', '危险化学品安全作业', '危险化学品安全作业', '', 1554194644, 1554194644, 147, 'normal'),
(148, 0, 'subject', '高处作业', '高处作业', '', '', '高处作业', '高处作业', '', 1554194660, 1554194660, 148, 'normal'),
(149, 0, 'subject', '冶金安全生产作业', '冶金安全生产作业', '', '', '冶金安全生产作业', '冶金安全生产作业', '', 1554194672, 1554194672, 149, 'normal'),
(150, 0, 'subject', '烟花爆竹安全作业', '烟花爆竹安全作业', '', '', '烟花爆竹安全作业', '烟花爆竹安全作业', '', 1554194688, 1554194688, 150, 'normal'),
(151, 0, 'subject', '金属非金属矿山安全作业', '金属非金属矿山安全作业', '', '', '金属非金属矿山安全作业', '金属非金属矿山安全作业', '', 1554194708, 1554194708, 151, 'normal'),
(152, 144, 'subject', '低压电工作业', '低压电工作业', '', '', '低压电工作业', '低压电工作业', '', 1554194739, 1554194739, 152, 'normal'),
(153, 144, 'subject', '高压电工作业', '高压电工作业', '', '', '高压电工作业', '高压电工作业', '', 1554194762, 1554194762, 153, 'normal'),
(154, 144, 'subject', '防爆电气作业', '防爆电气作业', '', '', '防爆电气作业', '防爆电气作业', '', 1554194774, 1554194774, 154, 'normal'),
(155, 144, 'subject', '继电保护作业', '继电保护作业', '', '', '继电保护作业', '继电保护作业', '', 1554194792, 1554194792, 155, 'normal'),
(156, 144, 'subject', '电力电缆作业', '电力电缆作业', '', '', '电力电缆作业', '电力电缆作业', '', 1554194815, 1554194815, 156, 'normal'),
(157, 144, 'subject', '电气试验作业', '电气试验作业', '', '', '电气试验作业', '电气试验作业', '', 1554194835, 1554194835, 157, 'normal'),
(158, 145, 'subject', '熔化焊接与热切割作业', '熔化焊接与热切割作业', '', '', '熔化焊接与热切割作业', '熔化焊接与热切割作业', '', 1554194851, 1554194851, 158, 'normal'),
(159, 145, 'subject', '压力焊作业', '压力焊作业', '', '', '压力焊作业', '压力焊作业', '', 1554194866, 1554194866, 159, 'normal'),
(160, 145, 'subject', '钎焊作业', '钎焊作业', '', '', '钎焊作业', '钎焊作业', '', 1554194880, 1554194880, 160, 'normal'),
(161, 146, 'subject', '制冷设备安装修理作业', '制冷设备安装修理作业', '', '', '制冷设备安装修理作业', '制冷设备安装修理作业', '', 1554194937, 1554194937, 161, 'normal'),
(162, 146, 'subject', '制冷设备运行操作作业', '制冷设备运行操作作业', '', '', '制冷设备运行操作作业', '制冷设备运行操作作业', '', 1554194951, 1554194951, 162, 'normal'),
(163, 147, 'subject', '氯碱电解工艺作业', '氯碱电解工艺作业', '', '', '氯碱电解工艺作业', '氯碱电解工艺作业', '', 1554194966, 1554194966, 163, 'normal'),
(164, 147, 'subject', '氯化工艺作业', '氯化工艺作业', '', '', '氯化工艺作业', '氯化工艺作业', '', 1554195052, 1554195052, 164, 'normal'),
(165, 147, 'subject', '硝化工艺作业', '硝化工艺作业', '', '', '硝化工艺作业', '硝化工艺作业', '', 1554195065, 1554195065, 165, 'normal'),
(166, 147, 'subject', '裂解工艺作业', '裂解工艺作业', '', '', '裂解工艺作业', '裂解工艺作业', '', 1554195079, 1554195079, 166, 'normal'),
(167, 147, 'subject', '氟化工艺作业', '氟化工艺作业', '', '', '氟化工艺作业', '氟化工艺作业', '', 1554195093, 1554195093, 167, 'normal'),
(168, 147, 'subject', '氧化工艺作业', '氧化工艺作业', '', '', '氧化工艺作业', '氧化工艺作业', '', 1554195106, 1554195106, 168, 'normal'),
(169, 147, 'subject', '聚合工艺作业', '聚合工艺作业', '', '', '聚合工艺作业', '聚合工艺作业', '', 1554195119, 1554195119, 169, 'normal'),
(170, 147, 'subject', '化工仪表作业', '化工仪表作业', '', '', '化工仪表作业', '化工仪表作业', '', 1554195132, 1554195132, 170, 'normal'),
(171, 147, 'subject', '光气化工艺作业', '光气化工艺作业', '', '', '光气化工艺作业', '光气化工艺作业', '', 1554195146, 1554195146, 171, 'normal'),
(172, 147, 'subject', '重氮化工作业', '重氮化工作业', '', '', '重氮化工作业', '重氮化工作业', '', 1554195162, 1554195162, 172, 'normal'),
(173, 147, 'subject', '过氧化工作业', '过氧化工作业', '', '', '过氧化工作业', '过氧化工作业', '', 1554195173, 1554195173, 173, 'normal'),
(174, 147, 'subject', '氨基化工作业', '氨基化工作业', '', '', '氨基化工作业', '氨基化工作业', '', 1554195187, 1554195187, 174, 'normal'),
(175, 147, 'subject', '过氧化工作业', '过氧化工作业', '', '', '过氧化工作业', '过氧化工作业', '', 1554195200, 1554195200, 175, 'normal'),
(176, 147, 'subject', '胺基化工作业', '胺基化工作业', '', '', '胺基化工作业', '胺基化工作业', '', 1554195213, 1554195213, 176, 'normal'),
(177, 147, 'subject', '磺化工艺作业', '磺化工艺作业', '', '', '磺化工艺作业', '磺化工艺作业', '', 1554195225, 1554195225, 177, 'normal'),
(178, 147, 'subject', '烷基化工作业', '烷基化工作业', '', '', '烷基化工作业', '烷基化工作业', '', 1554195242, 1554195242, 178, 'normal'),
(179, 147, 'subject', '合成氨工艺作业', '合成氨工艺作业', '', '', '合成氨工艺作业', '合成氨工艺作业', '', 1554195254, 1554195254, 179, 'normal'),
(180, 147, 'subject', '加氢工艺作业', '加氢工艺作业', '', '', '加氢工艺作业', '加氢工艺作业', '', 1554195265, 1554195265, 180, 'normal'),
(181, 148, 'subject', '登高架设作业', '登高架设作业', '', '', '登高架设作业', '登高架设作业', '', 1554195316, 1554195316, 181, 'normal'),
(182, 148, 'subject', '高处安装、维护、拆除作业', '高处安装、维护、拆除作业', '', '', '高处安装、维护、拆除作业', '高处安装、维护、拆除作业', '', 1554195332, 1554195332, 182, 'normal'),
(183, 149, 'subject', '煤气作业', '煤气作业', '', '', '煤气作业', '煤气作业', '', 1554195346, 1554195346, 183, 'normal'),
(184, 150, 'subject', '烟花储存作业', '烟花储存作业', '', '', '烟花储存作业', '烟花储存作业', '', 1554195358, 1554195358, 184, 'normal'),
(185, 151, 'subject', '地下矿山安全作业', '地下矿山安全作业', '', '', '地下矿山安全作业', '地下矿山安全作业', '', 1554195373, 1554195373, 185, 'normal'),
(186, 151, 'subject', '小型露天采石场', '小型露天采石场', '', '', '小型露天采石场', '小型露天采石场', '', 1554195477, 1554195477, 186, 'normal'),
(187, 151, 'subject', '矿井通风作业', '矿井通风作业', '', '', '矿井通风作业', '矿井通风作业', '', 1554195489, 1554195489, 187, 'normal'),
(188, 151, 'subject', '尾矿作业', '尾矿作业', '', '', '尾矿作业', '尾矿作业', '', 1554195499, 1554195499, 188, 'normal'),
(189, 151, 'subject', '露天矿山安全作业', '露天矿山安全作业', '', '', '露天矿山安全作业', '露天矿山安全作业', '', 1554195510, 1554195510, 189, 'normal'),
(190, 151, 'subject', '提升机操作作业', '提升机操作作业', '', '', '提升机操作作业', '提升机操作作业', '', 1554195524, 1554195524, 190, 'normal'),
(191, 151, 'subject', '露天矿山安全作业', '露天矿山安全作业', '', '', '露天矿山安全作业', '露天矿山安全作业', '', 1554195539, 1554195539, 191, 'normal'),
(192, 151, 'subject', '提升机操作作业', '提升机操作作业', '', '', '提升机操作作业', '提升机操作作业', '', 1554195554, 1554195554, 192, 'normal'),
(193, 151, 'subject', '支柱作业', '支柱作业', '', '', '支柱作业', '支柱作业', '', 1554195565, 1554195565, 193, 'normal'),
(194, 151, 'subject', '井下电气作业', '井下电气作业', '', '', '井下电气作业', '井下电气作业', '', 1554195576, 1554195576, 194, 'normal'),
(195, 151, 'subject', '排水作业', '排水作业', '', '', '排水作业', '排水作业', '', 1554195587, 1554195587, 195, 'normal'),
(196, 151, 'subject', '爆破作业', '爆破作业', '', '', '爆破作业', '爆破作业', '', 1554195597, 1554195597, 196, 'normal'),
(197, 0, 'subject', '焊接作业', '焊接作业', '', '', '焊接作业', '焊接作业', '', 1554195927, 1554195927, 197, 'normal'),
(198, 0, 'subject', '电梯', '电梯', '', '', '电梯', '电梯', '', 1554195939, 1554195939, 198, 'normal'),
(199, 0, 'subject', '压力容器作业', '压力容器作业', '', '', '压力容器作业', '压力容器作业', '', 1554195953, 1554195953, 199, 'normal'),
(200, 0, 'subject', '厂内专业机动车辆作业', '厂内专业机动车辆作业', '', '', '厂内专业机动车辆作业', '厂内专业机动车辆作业', '', 1554195968, 1554195968, 200, 'normal'),
(201, 0, 'subject', '锅炉作业', '锅炉作业', '', '', '锅炉作业', '锅炉作业', '', 1554196145, 1554196145, 201, 'normal'),
(202, 0, 'subject', '起重机械作业', '起重机械作业', '', '', '起重机械作业', '起重机械作业', '', 1554196195, 1554196195, 202, 'normal'),
(203, 0, 'subject', '特种设备相关管理', '特种设备相关管理', '', '', '特种设备相关管理', '特种设备相关管理', '', 1554196211, 1554196211, 203, 'normal'),
(204, 0, 'subject', '压力管道作业', '压力管道作业', '', '', '压力管道作业', '压力管道作业', '', 1554196222, 1554196222, 204, 'normal'),
(205, 0, 'subject', '安全附件维修作业', '安全附件维修作业', '', '', '安全附件维修作业', '安全附件维修作业', '', 1554196232, 1554196232, 205, 'normal'),
(206, 0, 'subject', '气瓶作业', '气瓶作业', '', '', '气瓶作业', '气瓶作业', '', 1554196242, 1554196242, 206, 'normal'),
(207, 0, 'subject', '大型游乐设施作业', '大型游乐设施作业', '', '', '大型游乐设施作业', '大型游乐设施作业', '', 1554196253, 1554196253, 207, 'normal'),
(208, 197, 'subject', '承压焊', '承压焊', '', '', '承压焊', '承压焊', '', 1554196386, 1554196386, 208, 'normal'),
(209, 197, 'subject', '结构焊', '结构焊', '', '', '结构焊', '结构焊', '', 1554196518, 1554196518, 209, 'normal'),
(210, 198, 'subject', 'T1电梯机械安装维修', 'T1电梯机械安装维修', '', '', 'T1电梯机械安装维修', 'T1电梯机械安装维修', '', 1554196533, 1554196533, 210, 'normal'),
(211, 198, 'subject', 'T2电梯电气安装维修', 'T2电梯电气安装维修', '', '', 'T2电梯电气安装维修', 'T2电梯电气安装维修', '', 1554196551, 1554196551, 211, 'normal'),
(212, 198, 'subject', 'T3电梯司机', 'T3电梯司机', '', '', 'T3电梯司机', 'T3电梯司机', '', 1554196564, 1554196564, 212, 'normal'),
(213, 198, 'subject', 'A4电梯安全管理', 'A4电梯安全管理', '', '', 'A4电梯安全管理', 'A4电梯安全管理', '', 1554196583, 1554196583, 213, 'normal'),
(214, 199, 'subject', 'R1固定式压力容器操作', 'R1固定式压力容器操作', '', '', 'R1固定式压力容器操作', 'R1固定式压力容器操作', '', 1554196659, 1554196659, 214, 'normal'),
(215, 199, 'subject', 'R2移动式压力容器充装', 'R2移动式压力容器充装', '', '', 'R2移动式压力容器充装', 'R2移动式压力容器充装', '', 1554196672, 1554196672, 215, 'normal'),
(216, 199, 'subject', 'R3氧舱维护保养', 'R3氧舱维护保养', '', '', 'R3氧舱维护保养', 'R3氧舱维护保养', '', 1554196687, 1554196687, 216, 'normal'),
(217, 200, 'subject', 'N1车辆维修', 'N1车辆维修', '', '', 'N1车辆维修', 'N1车辆维修', '', 1554196701, 1554196701, 217, 'normal'),
(218, 200, 'subject', 'N2叉车司机', 'N2叉车司机', '', '', 'N2叉车司机', 'N2叉车司机', '', 1554196714, 1554196714, 218, 'normal'),
(219, 200, 'subject', 'N3搬运车牵引车推顶车司机', 'N3搬运车牵引车推顶车司机', '', '', 'N3搬运车牵引车推顶车司机', 'N3搬运车牵引车推顶车司机', '', 1554196727, 1554196727, 219, 'normal'),
(220, 200, 'subject', 'N4内燃观光车司机', 'N4内燃观光车司机', '', '', 'N4内燃观光车司机', 'N4内燃观光车司机', '', 1554196742, 1554196742, 220, 'normal'),
(221, 200, 'subject', 'N5蓄电池观光车司机', 'N5蓄电池观光车司机', '', '', 'N5蓄电池观光车司机', 'N5蓄电池观光车司机', '', 1554196756, 1554196756, 221, 'normal'),
(222, 201, 'subject', 'G1一级锅炉司炉', 'G1一级锅炉司炉', '', '', 'G1一级锅炉司炉', 'G1一级锅炉司炉', '', 1554196772, 1554196772, 222, 'normal'),
(223, 201, 'subject', 'G2二级锅炉司炉', 'G2二级锅炉司炉', '', '', 'G2二级锅炉司炉', 'G2二级锅炉司炉', '', 1554196784, 1554196784, 223, 'normal'),
(224, 201, 'subject', 'G2二级锅炉司炉', 'G2二级锅炉司炉', '', '', 'G2二级锅炉司炉', 'G2二级锅炉司炉', '', 1554196796, 1554196796, 224, 'normal'),
(225, 201, 'subject', 'G4一级锅炉水处理', 'G4一级锅炉水处理', '', '', 'G4一级锅炉水处理', 'G4一级锅炉水处理', '', 1554196810, 1554196810, 225, 'normal'),
(226, 201, 'subject', 'G5二级锅炉水处理', 'G5二级锅炉水处理', '', '', 'G5二级锅炉水处理', 'G5二级锅炉水处理', '', 1554196821, 1554196821, 226, 'normal'),
(227, 202, 'subject', 'Q1起重机械机械安装维修', 'Q1起重机械机械安装维修', '', '', 'Q1起重机械机械安装维修', 'Q1起重机械机械安装维修', '', 1554196835, 1554196835, 227, 'normal'),
(228, 202, 'subject', 'Q2起重机械电气安装维修', 'Q2起重机械电气安装维修', '', '', 'Q2起重机械电气安装维修', 'Q2起重机械电气安装维修', '', 1554196847, 1554196896, 228, 'normal'),
(229, 202, 'subject', 'Q3起重机械指挥', 'Q3起重机械指挥', '', '', 'Q3起重机械指挥', 'Q3起重机械指挥', '', 1554196912, 1554196912, 229, 'normal'),
(230, 202, 'subject', 'Q4桥门式起重机司机', 'Q4桥门式起重机司机', '', '', 'Q4桥门式起重机司机', 'Q4桥门式起重机司机', '', 1554196925, 1554196925, 230, 'normal'),
(231, 202, 'subject', 'Q5塔式起重机司机', 'Q5塔式起重机司机', '', '', 'Q5塔式起重机司机', 'Q5塔式起重机司机', '', 1554196936, 1554196936, 231, 'normal'),
(232, 202, 'subject', 'Q6门坐式起重机司机', 'Q6门坐式起重机司机', '', '', 'Q6门坐式起重机司机', 'Q6门坐式起重机司机', '', 1554196948, 1554196948, 232, 'normal'),
(233, 202, 'subject', 'Q7缆索式起重机司机', 'Q7缆索式起重机司机', '', '', 'Q7缆索式起重机司机', 'Q7缆索式起重机司机', '', 1554196963, 1554196963, 233, 'normal'),
(234, 202, 'subject', 'Q8流动式起重机司机', 'Q8流动式起重机司机', '', '', 'Q8流动式起重机司机', 'Q8流动式起重机司机', '', 1554196977, 1554196977, 234, 'normal'),
(235, 202, 'subject', 'Q9升降机司机', 'Q9升降机司机', '', '', 'Q9升降机司机', 'Q9升降机司机', '', 1554196990, 1554196990, 235, 'normal'),
(236, 202, 'subject', 'Q10机械式停车设备司机', 'Q10机械式停车设备司机', '', '', 'Q10机械式停车设备司机', 'Q10机械式停车设备司机', '', 1554197002, 1554197002, 236, 'normal'),
(237, 203, 'subject', 'A3锅炉压力容器压力管道安全管理', 'A3锅炉压力容器压力管道安全管理', '', '', 'A3锅炉压力容器压力管道安全管理', 'A3锅炉压力容器压力管道安全管理', '', 1554197017, 1554197017, 237, 'normal'),
(238, 203, 'subject', 'A3锅炉压力容器压力管道安全管理', 'A3锅炉压力容器压力管道安全管理', '', '', 'A3锅炉压力容器压力管道安全管理', 'A3锅炉压力容器压力管道安全管理', '', 1554197029, 1554197029, 238, 'normal'),
(239, 203, 'subject', 'A8场（厂）内专用机动车辆安全管理', 'A8场（厂）内专用机动车辆安全管理', '', '', 'A8场（厂）内专用机动车辆安全管理', 'A8场（厂）内专用机动车辆安全管理', '', 1554197042, 1554197042, 239, 'normal'),
(240, 204, 'subject', 'D1压力管道巡检维护', 'D1压力管道巡检维护', '', '', 'D1压力管道巡检维护', 'D1压力管道巡检维护', '', 1554197054, 1554197054, 240, 'normal'),
(241, 204, 'subject', 'D2带压封堵', 'D2带压封堵', '', '', 'D2带压封堵', 'D2带压封堵', '', 1554197066, 1554197066, 241, 'normal'),
(242, 204, 'subject', 'D3带压密封', 'D3带压密封', '', '', 'D3带压密封', 'D3带压密封', '', 1554197078, 1554197078, 242, 'normal'),
(243, 205, 'subject', 'F1安全阀校验', 'F1安全阀校验', '', '', 'F1安全阀校验', 'F1安全阀校验', '', 1554197095, 1554197095, 243, 'normal'),
(244, 205, 'subject', 'F2安全阀维修', 'F2安全阀维修', '', '', 'F2安全阀维修', 'F2安全阀维修', '', 1554197107, 1554197107, 244, 'normal'),
(245, 206, 'subject', 'P1永久气体气瓶充装', 'P1永久气体气瓶充装', '', '', 'P1永久气体气瓶充装', 'P1永久气体气瓶充装', '', 1554197121, 1554197121, 245, 'normal'),
(246, 206, 'subject', 'P2液化气体气瓶充装', 'P2液化气体气瓶充装', '', '', 'P2液化气体气瓶充装', 'P2液化气体气瓶充装', '', 1554197135, 1554197135, 246, 'normal'),
(247, 206, 'subject', 'P3溶解乙炔气瓶充装', 'P3溶解乙炔气瓶充装', '', '', 'P3溶解乙炔气瓶充装', 'P3溶解乙炔气瓶充装', '', 1554197147, 1554197248, 247, 'normal'),
(248, 206, 'subject', 'P4液化石油气瓶充装', 'P4液化石油气瓶充装', '', '', 'P4液化石油气瓶充装', 'P4液化石油气瓶充装', '', 1554197160, 1554197160, 248, 'normal'),
(250, 206, 'subject', 'P5车用气瓶充装', 'P5车用气瓶充装', '', '', 'P5车用气瓶充装', 'P5车用气瓶充装', '', 1554197265, 1554197265, 250, 'normal'),
(251, 207, 'subject', 'Y3大型游乐设施操作', 'Y3大型游乐设施操作', '', '', 'Y3大型游乐设施操作', 'Y3大型游乐设施操作', '', 1554197282, 1554197282, 251, 'normal'),
(252, 207, 'subject', 'Y4水上游乐设施操作与维修', 'Y4水上游乐设施操作与维修', '', '', 'Y4水上游乐设施操作与维修', 'Y4水上游乐设施操作与维修', '', 1554197297, 1554197297, 252, 'normal'),
(253, 0, 'subject', '服务行业', '服务行业', '', '', '服务行业', '服务行业', '', 1554283560, 1554283560, 253, 'normal'),
(254, 0, 'subject', '机械电子行业', '机械电子行业', '', '', '机械电子行业', '机械电子行业', '', 1554283605, 1554283605, 254, 'normal'),
(255, 0, 'subject', '五金动力行业', '五金动力行业', '', '', '五金动力行业', '五金动力行业', '', 1554283620, 1554283620, 255, 'normal'),
(256, 0, 'subject', '社区家政服务', '社区家政服务', '', '', '社区家政服务', '社区家政服务', '', 1554283633, 1554283633, 256, 'normal'),
(257, 0, 'subject', '商业服务行业', '商业服务行业', '', '', '商业服务行业', '商业服务行业', '', 1554283648, 1554283648, 257, 'normal'),
(258, 0, 'subject', '塑料化工行业', '塑料化工行业', '', '', '塑料化工行业', '塑料化工行业', '', 1554283665, 1554283665, 258, 'normal'),
(259, 0, 'subject', '建材建筑行业', '建材建筑行业', '', '', '建材建筑行业', '建材建筑行业', '', 1554283676, 1554283676, 259, 'normal'),
(260, 0, 'subject', '农林矿产畜牧水利', '农林矿产畜牧水利', '', '', '农林矿产畜牧水利', '农林矿产畜牧水利', '', 1554283685, 1554283685, 260, 'normal'),
(261, 0, 'subject', '安全运输行业 ', '安全运输行业 ', '', '', '安全运输行业 ', '安全运输行业 ', '', 1554283697, 1554283697, 261, 'normal'),
(262, 253, 'subject', '中式烹调师', '中式烹调师', '', '', '中式烹调师', '中式烹调师', '', 1554283720, 1554283720, 262, 'normal'),
(263, 253, 'subject', '中式面点师', '中式面点师', '', '', '中式面点师', '中式面点师', '', 1554283733, 1554283733, 263, 'normal'),
(264, 253, 'subject', '茶艺师', '茶艺师', '', '', '茶艺师', '茶艺师', '', 1554283749, 1554283749, 264, 'normal'),
(265, 253, 'subject', '西式烹调师', '西式烹调师', '', '', '西式烹调师', '西式烹调师', '', 1554283764, 1554283764, 265, 'normal'),
(266, 253, 'subject', '西式面点师', '西式面点师', '', '', '西式面点师', '西式面点师', '', 1554283778, 1554283778, 266, 'normal'),
(267, 253, 'subject', '眼睛验光员', '眼睛验光员', '', '', '眼睛验光员', '眼睛验光员', '', 1554283794, 1554283794, 267, 'normal'),
(268, 253, 'subject', '眼睛定配工', '眼睛定配工', '', '', '眼睛定配工', '眼睛定配工', '', 1554283814, 1554283814, 268, 'normal'),
(269, 254, 'subject', '数控车工', '数控车工', '', '', '数控车工', '数控车工', '', 1554283827, 1554283827, 269, 'normal'),
(270, 254, 'subject', '车工', '车工', '', '', '车工', '车工', '', 1554283838, 1554283838, 270, 'normal'),
(271, 254, 'subject', '钳工', '钳工', '', '', '钳工', '钳工', '', 1554283851, 1554283851, 271, 'normal'),
(272, 254, 'subject', '汽车修理工', '汽车修理工', '', '', '汽车修理工', '汽车修理工', '', 1554283868, 1554283868, 272, 'normal'),
(273, 254, 'subject', '数控铣工', '数控铣工', '', '', '数控铣工', '数控铣工', '', 1554283881, 1554283881, 273, 'normal'),
(274, 254, 'subject', '铣工', '铣工', '', '', '铣工', '铣工', '', 1554283893, 1554283893, 274, 'normal'),
(275, 254, 'subject', '加工中心操作工', '加工中心操作工', '', '', '加工中心操作工', '加工中心操作工', '', 1554283911, 1554283911, 275, 'normal'),
(276, 254, 'subject', '焊工', '焊工', '', '', '焊工', '焊工', '', 1554283926, 1554283926, 276, 'normal'),
(277, 254, 'subject', '镗工', '镗工', '', '', '镗工', '镗工', '', 1554283939, 1554283939, 277, 'normal'),
(278, 254, 'subject', '铸造工', '铸造工', '', '', '铸造工', '铸造工', '', 1554283951, 1554283951, 278, 'normal'),
(279, 254, 'subject', '锻造工', '锻造工', '', '', '锻造工', '锻造工', '', 1554283964, 1554283964, 279, 'normal'),
(280, 255, 'subject', '维修电工', '维修电工', '', '', '维修电工', '维修电工', '', 1554284014, 1554284014, 280, 'normal'),
(281, 255, 'subject', '电工', '电工', '', '', '电工', '电工', '', 1554284026, 1554284026, 281, 'normal'),
(282, 255, 'subject', '金属热处理工', '金属热处理工', '', '', '金属热处理工', '金属热处理工', '', 1554284037, 1554284037, 282, 'normal'),
(283, 255, 'subject', '锅炉运行值班员', '锅炉运行值班员', '', '', '锅炉运行值班员', '锅炉运行值班员', '', 1554284047, 1554284047, 283, 'normal'),
(284, 256, 'subject', '保育员', '保育员', '', '', '保育员', '保育员', '', 1554284059, 1554284059, 284, 'normal'),
(285, 256, 'subject', '育婴员', '育婴员', '', '', '育婴员', '育婴员', '', 1554284070, 1554284070, 285, 'normal'),
(286, 256, 'subject', '家政服务员', '家政服务员', '', '', '家政服务员', '家政服务员', '', 1554284080, 1554284080, 286, 'normal'),
(287, 257, 'subject', '美容师', '美容师', '', '', '美容师', '美容师', '', 1554284096, 1554284096, 287, 'normal'),
(288, 257, 'subject', '美发师', '美发师', '', '', '美发师', '美发师', '', 1554284106, 1554284106, 288, 'normal'),
(289, 257, 'subject', '锅炉操作工', '锅炉操作工', '', '', '锅炉操作工', '锅炉操作工', '', 1554284120, 1554284120, 289, 'normal'),
(290, 258, 'subject', '制冷工', '制冷工', '', '', '制冷工', '制冷工', '', 1554343252, 1554343252, 290, 'normal'),
(291, 259, 'subject', '钢筋工', '钢筋工', '', '', '钢筋工', '钢筋工', '', 1554343271, 1554343271, 291, 'normal'),
(292, 259, 'subject', '架子工', '架子工', '', '', '架子工', '架子工', '', 1554343289, 1554343289, 292, 'normal'),
(293, 259, 'subject', '防水工', '防水工', '', '', '防水工', '防水工', '', 1554343311, 1554343311, 293, 'normal'),
(294, 260, 'subject', '手工木工', '手工木工', '', '', '手工木工', '手工木工', '', 1554343324, 1554343324, 294, 'normal'),
(295, 260, 'subject', '花卉园艺工', '花卉园艺工', '', '', '花卉园艺工', '花卉园艺工', '', 1554343337, 1554343337, 295, 'normal'),
(296, 261, 'subject', '起重机装卸机械操作员', '起重机装卸机械操作员', '', '', '起重机装卸机械操作员', '起重机装卸机械操作员', '', 1554343351, 1554343351, 296, 'normal'),
(298, 0, 'grade', '中', '中', '', '', '中', '中', '', 1554343500, 1554343500, 298, 'normal'),
(299, 0, 'grade', '高', '高', '', '', '高', '高', '', 1554343512, 1554343512, 299, 'normal'),
(300, 0, 'grade', '高技', '高技', '', '', '高技', '高技', '', 1554343524, 1554343524, 300, 'normal'),
(301, 0, 'grade', '一级', '一级', '', '', '一级', '一级', '', 1554343542, 1554343542, 301, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `ns_click_fabulous`
--

CREATE TABLE IF NOT EXISTS `ns_click_fabulous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `create_time` int(11) DEFAULT '0' COMMENT '点赞时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '点赞状态 0 未点赞 1 点赞',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品点赞记录表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_click_fabulous`
--

INSERT INTO `ns_click_fabulous` (`id`, `uid`, `shop_id`, `goods_id`, `create_time`, `status`, `number`) VALUES
(1, 14, 0, 6, 1555572121, 1, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ns_complain`
--

CREATE TABLE IF NOT EXISTS `ns_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) NOT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) NOT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) NOT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) NOT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) NOT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) NOT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) NOT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) NOT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) NOT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) NOT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) NOT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-\n\n\n\n投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通\n\n\n\n过平台审批(1未通过/2通过)',
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_complain_subject`
--

CREATE TABLE IF NOT EXISTS `ns_complain_subject` (
  `complain_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉\n\n\n\n主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描\n\n\n\n述',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态\n\n\n\n(1-有效/2-失效)',
  PRIMARY KEY (`complain_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='投诉主题表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_complain_talk`
--

CREATE TABLE IF NOT EXISTS `ns_complain_talk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人\n\n\n\n/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显\n\n\n\n示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对\n\n\n\n话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉对话表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_consult`
--

CREATE TABLE IF NOT EXISTS `ns_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询内容',
  `consult_reply` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询回复内容',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  `consult_addtime` int(11) DEFAULT '0' COMMENT '咨询发布时间',
  `consult_reply_time` int(11) DEFAULT '0' COMMENT '咨询回复时间',
  PRIMARY KEY (`consult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='咨询类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_consult_type`
--

CREATE TABLE IF NOT EXISTS `ns_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(50) NOT NULL DEFAULT '' COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='咨询类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon`
--

CREATE TABLE IF NOT EXISTS `ns_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `fetch_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领取时间',
  `use_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表' AUTO_INCREMENT=101 ;

--
-- 转存表中的数据 `ns_coupon`
--

INSERT INTO `ns_coupon` (`coupon_id`, `coupon_type_id`, `shop_id`, `coupon_code`, `uid`, `use_order_id`, `create_order_id`, `money`, `fetch_time`, `use_time`, `state`, `start_time`, `end_time`, `get_type`) VALUES
(1, 1, 28, '1555571009170', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 1, 28, '1555571009446', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 1, 28, '1555571009242', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(4, 1, 28, '1555571009976', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(5, 1, 28, '1555571009857', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(6, 1, 28, '1555571009519', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(7, 1, 28, '1555571009737', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(8, 1, 28, '1555571009885', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(9, 1, 28, '1555571009585', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(10, 1, 28, '1555571009958', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(11, 1, 28, '1555571009373', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(12, 1, 28, '1555571009562', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(13, 1, 28, '1555571009563', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(14, 1, 28, '1555571009119', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(15, 1, 28, '1555571009329', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(16, 1, 28, '1555571009182', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(17, 1, 28, '1555571009269', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(18, 1, 28, '1555571009905', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(19, 1, 28, '1555571009792', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(20, 1, 28, '1555571009498', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(21, 1, 28, '1555571009143', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(22, 1, 28, '1555571009559', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(23, 1, 28, '1555571009569', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(24, 1, 28, '1555571009143', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(25, 1, 28, '1555571009908', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(26, 1, 28, '1555571009366', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(27, 1, 28, '1555571009994', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(28, 1, 28, '1555571009455', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(29, 1, 28, '1555571009775', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(30, 1, 28, '1555571009380', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(31, 1, 28, '1555571009505', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(32, 1, 28, '1555571009952', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(33, 1, 28, '1555571009210', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(34, 1, 28, '1555571009783', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(35, 1, 28, '1555571009484', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(36, 1, 28, '1555571009179', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(37, 1, 28, '1555571009420', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(38, 1, 28, '1555571009768', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(39, 1, 28, '1555571009691', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(40, 1, 28, '1555571009152', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(41, 1, 28, '1555571009790', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(42, 1, 28, '1555571009552', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(43, 1, 28, '1555571009468', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(44, 1, 28, '1555571009658', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(45, 1, 28, '1555571009983', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(46, 1, 28, '1555571009975', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(47, 1, 28, '1555571009931', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(48, 1, 28, '1555571009328', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(49, 1, 28, '1555571009491', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(50, 1, 28, '1555571009943', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(51, 1, 28, '1555571009310', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(52, 1, 28, '1555571009513', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(53, 1, 28, '1555571009463', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(54, 1, 28, '1555571009517', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(55, 1, 28, '1555571009791', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(56, 1, 28, '1555571009431', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(57, 1, 28, '1555571009593', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(58, 1, 28, '1555571009127', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(59, 1, 28, '1555571009327', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(60, 1, 28, '1555571009947', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(61, 1, 28, '1555571009337', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(62, 1, 28, '1555571009149', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(63, 1, 28, '1555571009233', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(64, 1, 28, '1555571009124', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(65, 1, 28, '1555571009807', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(66, 1, 28, '1555571009215', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(67, 1, 28, '1555571009252', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(68, 1, 28, '1555571009582', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(69, 1, 28, '1555571009603', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(70, 1, 28, '1555571009730', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(71, 1, 28, '1555571009350', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(72, 1, 28, '1555571009228', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(73, 1, 28, '1555571009596', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(74, 1, 28, '1555571009614', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(75, 1, 28, '1555571009475', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(76, 1, 28, '1555571009631', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(77, 1, 28, '1555571009267', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(78, 1, 28, '1555571009864', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(79, 1, 28, '1555571009664', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(80, 1, 28, '1555571009165', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(81, 1, 28, '1555571009606', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(82, 1, 28, '1555571009842', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(83, 1, 28, '1555571009724', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(84, 1, 28, '1555571009841', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(85, 1, 28, '1555571009616', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(86, 1, 28, '1555571009434', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(87, 1, 28, '1555571009976', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(88, 1, 28, '1555571009412', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(89, 1, 28, '1555571009663', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(90, 1, 28, '1555571009334', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(91, 1, 28, '1555571009640', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(92, 1, 28, '1555571009446', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(93, 1, 28, '1555571009593', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(94, 1, 28, '1555571009243', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(95, 1, 28, '1555571009661', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(96, 1, 28, '1555571009170', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(97, 1, 28, '1555571009532', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(98, 1, 28, '1555571009587', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(99, 1, 28, '1555571009460', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(100, 1, 28, '1555571009557', 0, 0, 0, '10.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon_goods`
--

CREATE TABLE IF NOT EXISTS `ns_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_coupon_type`
--

CREATE TABLE IF NOT EXISTS `ns_coupon_type` (
  `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT '0' COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用范围0部分产品使用 1全场产品使用',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效日期开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效日期结束时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许首页显示0不显示1显示',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_coupon_type`
--

INSERT INTO `ns_coupon_type` (`coupon_type_id`, `shop_id`, `coupon_name`, `money`, `count`, `max_fetch`, `at_least`, `need_user_level`, `range_type`, `start_time`, `end_time`, `create_time`, `update_time`, `is_show`) VALUES
(1, 28, '满50返10元', '10.00', 100, 1, '50.00', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_company`
--

CREATE TABLE IF NOT EXISTS `ns_express_company` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_express_company`
--

INSERT INTO `ns_express_company` (`co_id`, `shop_id`, `company_name`, `express_no`, `is_enabled`, `image`, `phone`, `orders`, `express_logo`, `is_default`) VALUES
(3, 28, '百世快递', '001', 1, '', '', 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping`
--

CREATE TABLE IF NOT EXISTS `ns_express_shipping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片',
  PRIMARY KEY (`sid`),
  KEY `IDX_express_shipping_co_id` (`co_id`),
  KEY `IDX_express_shipping_shopId` (`shop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运单模板' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_express_shipping`
--

INSERT INTO `ns_express_shipping` (`sid`, `shop_id`, `template_name`, `co_id`, `size_type`, `width`, `height`, `image`) VALUES
(3, 28, '百世快递', 3, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping_items`
--

CREATE TABLE IF NOT EXISTS `ns_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';

--
-- 转存表中的数据 `ns_express_shipping_items`
--

INSERT INTO `ns_express_shipping_items` (`sid`, `field_name`, `field_display_name`, `is_print`, `x`, `y`) VALUES
(1, 'A1', '订单编号', 1, 10, 11),
(1, 'A10', '收件人邮编', 1, 10, 86),
(1, 'A11', '货到付款物流编号', 1, 10, 286),
(1, 'A12', '代收金额', 1, 10, 186),
(1, 'A13', '备注', 1, 10, 311),
(1, 'A2', '发件人公司', 1, 10, 36),
(1, 'A3', '发件人地址', 1, 10, 136),
(1, 'A4', '发件人姓名', 1, 10, 111),
(1, 'A5', '发件人电话', 1, 10, 211),
(1, 'A6', '发件人邮编', 1, 10, 236),
(1, 'A7', '收件人地址', 1, 10, 261),
(1, 'A8', '收件人姓名', 1, 10, 61),
(1, 'A9', '收件人电话', 1, 10, 161);

-- --------------------------------------------------------

--
-- 表的结构 `ns_express_shipping_items_library`
--

CREATE TABLE IF NOT EXISTS `ns_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ns_express_shipping_items_library`
--

INSERT INTO `ns_express_shipping_items_library` (`Id`, `shop_id`, `field_name`, `field_display_name`, `is_enabled`) VALUES
(1, 0, 'A1', '订单编号', b'1'),
(2, 0, 'A2', '发件人公司', b'1'),
(3, 0, 'A8', '收件人姓名', b'1'),
(4, 0, 'A10', '收件人邮编', b'1'),
(5, 0, 'A4', '发件人姓名', b'1'),
(6, 0, 'A3', '发件人地址', b'1'),
(7, 0, 'A9', '收件人电话', b'1'),
(8, 0, 'A12', '代收金额', b'1'),
(9, 0, 'A5', '发件人电话', b'1'),
(10, 0, 'A6', '发件人邮编', b'1'),
(11, 0, 'A7', '收件人地址', b'1'),
(12, 0, 'A11', '货到付款物流编号', b'1'),
(13, 0, 'A13', '备注', b'1');

-- --------------------------------------------------------

--
-- 表的结构 `ns_gift_grant_records`
--

CREATE TABLE IF NOT EXISTS `ns_gift_grant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gift_id` int(11) NOT NULL COMMENT '赠送活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠送商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '赠送商品名称',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '赠送商品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠送数量',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发放方式',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放相关ID',
  `memo` text NOT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '赠送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品发放记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods`
--

CREATE TABLE IF NOT EXISTS `ns_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(11) DEFAULT '0',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件',
  PRIMARY KEY (`goods_id`),
  KEY `UK_ns_goods_brand_id` (`brand_id`),
  KEY `UK_ns_goods_category_id` (`category_id`),
  KEY `UK_ns_goods_category_id_1` (`category_id_1`),
  KEY `UK_ns_goods_category_id_2` (`category_id_2`),
  KEY `UK_ns_goods_category_id_3` (`category_id_3`),
  KEY `UK_ns_goods_extend_category_id` (`extend_category_id`),
  KEY `UK_ns_goods_extend_category_id_1` (`extend_category_id_1`),
  KEY `UK_ns_goods_extend_category_id_2` (`extend_category_id_2`),
  KEY `UK_ns_goods_extend_category_id_3` (`extend_category_id_3`),
  KEY `UK_ns_goods_goods_attribute_id` (`goods_attribute_id`),
  KEY `UK_ns_goods_group_id_array` (`group_id_array`),
  KEY `UK_ns_goods_promotion_price` (`promotion_price`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ns_goods`
--

INSERT INTO `ns_goods` (`goods_id`, `goods_name`, `shop_id`, `category_id`, `category_id_1`, `category_id_2`, `category_id_3`, `brand_id`, `group_id_array`, `promotion_type`, `promote_id`, `goods_type`, `market_price`, `price`, `promotion_price`, `cost_price`, `point_exchange_type`, `point_exchange`, `give_point`, `is_member_discount`, `shipping_fee`, `shipping_fee_id`, `stock`, `max_buy`, `clicks`, `min_stock_alarm`, `sales`, `collects`, `star`, `evaluates`, `shares`, `province_id`, `city_id`, `picture`, `keywords`, `introduction`, `description`, `QRcode`, `code`, `is_stock_visible`, `is_hot`, `is_recommend`, `is_new`, `is_pre_sale`, `is_bill`, `state`, `sort`, `img_id_array`, `sku_img_array`, `match_point`, `match_ratio`, `real_sales`, `goods_attribute_id`, `goods_spec_format`, `goods_weight`, `goods_volume`, `shipping_fee_type`, `extend_category_id`, `extend_category_id_1`, `extend_category_id_2`, `extend_category_id_3`, `supplier_id`, `sale_date`, `create_time`, `update_time`, `min_buy`) VALUES
(6, '怪化猫手机壳', 28, 6, 6, 0, 0, 3, '', 0, 0, 1, '30.00', '25.00', '25.00', '10.00', 0, 0, 0, 0, '0.00', 0, 100, 0, 1, 10, 101, 1, 0, 0, 1, 1, 1, 5, '形、真、理', '形、真、理', '<p>喜欢药郎的朋友们~让我看到你们的双手~~~~~~~酱酱~</p>', 'upload/goods_qrcode/goods_qrcode_6.png', '', 1, 0, 0, 0, 0, 0, 1, 0, '5', '', NULL, NULL, 1, 2, '[]', '0.00', '0.00', 3, '6', '6', '0', '0', 0, 1555570868, 1555570868, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute`
--

CREATE TABLE IF NOT EXISTS `ns_goods_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`attr_id`),
  KEY `UK_ns_goods_attribute_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_goods_attribute`
--

INSERT INTO `ns_goods_attribute` (`attr_id`, `goods_id`, `shop_id`, `attr_value_id`, `attr_value`, `attr_value_name`, `sort`, `create_time`) VALUES
(1, 6, 28, 3, '书籍', '', 0, 1555570868);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute_deleted`
--

CREATE TABLE IF NOT EXISTS `ns_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_attribute_value`
--

CREATE TABLE IF NOT EXISTS `ns_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`attr_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`attr_value`),
  KEY `UK_ns_goods_attribute_value_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_brand`
--

CREATE TABLE IF NOT EXISTS `ns_goods_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `sort` int(11) DEFAULT NULL,
  `brand_category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `category_id_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '所属分类id组',
  `brand_ads` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌推荐广告',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌所属分类名称',
  `category_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `category_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  `category_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级分类ID',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1024 COMMENT='品牌表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_goods_brand`
--

INSERT INTO `ns_goods_brand` (`brand_id`, `shop_id`, `brand_name`, `brand_initial`, `brand_pic`, `brand_recommend`, `sort`, `brand_category_name`, `category_id_array`, `brand_ads`, `category_name`, `category_id_1`, `category_id_2`, `category_id_3`) VALUES
(3, 0, 'V社', 'V', 'upload/common/1555568590.png', 1, 1, '', '', 'upload/common/1555568593.png', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_category`
--

CREATE TABLE IF NOT EXISTS `ns_goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244 COMMENT='商品分类表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ns_goods_category`
--

INSERT INTO `ns_goods_category` (`category_id`, `category_name`, `short_name`, `pid`, `level`, `is_visible`, `attr_id`, `attr_name`, `keywords`, `description`, `sort`, `category_pic`) VALUES
(6, '日韩动漫', '动漫', 0, 1, 1, 2, '书籍', '动漫', '动漫作品', 1, 'upload/common/1555568623.png');

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_category_block`
--

CREATE TABLE IF NOT EXISTS `ns_goods_category_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `category_alias` varchar(50) NOT NULL DEFAULT '' COMMENT '分类别名',
  `color` varchar(255) DEFAULT '#FFFFFF' COMMENT '颜色',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 0 不显示',
  `is_show_lower_category` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示下级分类',
  `is_show_brand` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示品牌',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `ad_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图  {["title":"","subtitle":"","picture":"","url":"","background":""]}',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `short_name` varchar(255) DEFAULT '' COMMENT '分类简称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品分类楼层表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ns_goods_category_block`
--

INSERT INTO `ns_goods_category_block` (`id`, `shop_id`, `category_name`, `category_id`, `category_alias`, `color`, `is_show`, `is_show_lower_category`, `is_show_brand`, `sort`, `ad_picture`, `create_time`, `modify_time`, `short_name`) VALUES
(7, 0, '日韩动漫', 6, '日韩动漫', '#FFFFFF', 1, 0, 0, 0, '', 1555568630, 0, '日韩动漫');

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_comment`
--

CREATE TABLE IF NOT EXISTS `ns_goods_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `create_time` int(11) DEFAULT '0' COMMENT '评论创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '评论状态 0未评论 1已评论',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品评论送积分记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_deleted`
--

CREATE TABLE IF NOT EXISTS `ns_goods_deleted` (
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id(SKU)',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  `sale_date` int(11) DEFAULT '0' COMMENT '上下架时间',
  `create_time` int(11) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT '0' COMMENT '最少买几件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_evaluate`
--

CREATE TABLE IF NOT EXISTS `ns_goods_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `explain_first` varchar(255) NOT NULL DEFAULT '' COMMENT '解释内容',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '评价人名称',
  `uid` int(11) NOT NULL COMMENT '评价人编号',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `again_content` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价内容',
  `again_image` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价图片',
  `again_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '追加解释内容',
  `explain_type` int(11) DEFAULT '0' COMMENT '1好评2中评3差评',
  `is_show` int(1) DEFAULT '1' COMMENT '1显示 0隐藏',
  `addtime` int(11) DEFAULT '0' COMMENT '评价时间',
  `again_addtime` int(11) DEFAULT '0' COMMENT '追加评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='商品评价表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_group`
--

CREATE TABLE IF NOT EXISTS `ns_goods_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id 最多2级',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `is_visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否可视',
  `group_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=160 COMMENT='商品本店分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku`
--

CREATE TABLE IF NOT EXISTS `ns_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ns_goods_sku`
--

INSERT INTO `ns_goods_sku` (`sku_id`, `goods_id`, `sku_name`, `attr_value_items`, `attr_value_items_format`, `market_price`, `price`, `promote_price`, `cost_price`, `stock`, `picture`, `code`, `QRcode`, `create_date`, `update_date`) VALUES
(7, 6, '', '', '', '30.00', '25.00', '25.00', '10.00', 100, 0, '', '', 1555570868, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_deleted`
--

CREATE TABLE IF NOT EXISTS `ns_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='商品skui规格价格库存信息回收站表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_picture`
--

CREATE TABLE IF NOT EXISTS `ns_goods_sku_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku多图' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_sku_picture_delete`
--

CREATE TABLE IF NOT EXISTS `ns_goods_sku_picture_delete` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品sku多图';

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_spec`
--

CREATE TABLE IF NOT EXISTS `ns_goods_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `show_type` int(11) NOT NULL DEFAULT '1' COMMENT '展示方式 1 文字 2 颜色 3 图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `is_screen` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否参与筛选 0 不参与 1 参与',
  `is_platform` int(11) NOT NULL DEFAULT '1' COMMENT '是否是平台规格',
  `goods_attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型id',
  PRIMARY KEY (`spec_id`),
  KEY `IDX_category_props_categoryId` (`shop_id`),
  KEY `IDX_category_props_orders` (`sort`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='商品属性（规格）表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ns_goods_spec`
--

INSERT INTO `ns_goods_spec` (`spec_id`, `shop_id`, `spec_name`, `is_visible`, `sort`, `show_type`, `create_time`, `is_screen`, `is_platform`, `goods_attr_id`) VALUES
(7, 0, '纸质品', 1, 255, 1, 1555568536, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_goods_spec_value`
--

CREATE TABLE IF NOT EXISTS `ns_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`spec_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`spec_value_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ns_goods_spec_value`
--

INSERT INTO `ns_goods_spec_value` (`spec_value_id`, `spec_id`, `spec_value_name`, `spec_value_data`, `is_visible`, `sort`, `create_time`) VALUES
(8, 7, '纸质品', '', 1, 255, 1555568536);

-- --------------------------------------------------------

--
-- 表的结构 `ns_inform`
--

CREATE TABLE IF NOT EXISTS `ns_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名\n\n\n\n称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理\n\n\n\n)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效\n\n\n\n举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信\n\n\n\n息',
  `inform_handle_datetime` int(11) NOT NULL DEFAULT '0' COMMENT '举报处\n\n\n\n理时间',
  `inform_handle_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员\n\n\n\nid',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_inform_subject`
--

CREATE TABLE IF NOT EXISTS `ns_inform_subject` (
  `inform_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主\n\n\n\n题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容\n\n\n\n',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名\n\n\n\n称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1\n\n\n\n可用/2失效)',
  PRIMARY KEY (`inform_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='举报主题表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_inform_subject_type`
--

CREATE TABLE IF NOT EXISTS `ns_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型\n\n\n\nid',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有\n\n\n\n效/2失效)',
  PRIMARY KEY (`inform_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='举报类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_member`
--

CREATE TABLE IF NOT EXISTS `ns_member` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '前台用户名',
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=147 COMMENT='前台用户表';

--
-- 转存表中的数据 `ns_member`
--

INSERT INTO `ns_member` (`uid`, `member_name`, `member_level`, `memo`, `reg_time`) VALUES
(10, 'admin', 47, '', 2019),
(11, 'dingzt', 47, NULL, 1555569345),
(12, 'wulala', 47, NULL, 1555569674),
(13, 'lulu', 47, NULL, 1555570311),
(14, 'xiaojia', 47, NULL, 1555571526),
(15, 'laoli', 47, NULL, 1555657878);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_account`
--

CREATE TABLE IF NOT EXISTS `ns_member_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '购物币',
  `member_cunsum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员消费',
  `member_sum_point` int(11) NOT NULL DEFAULT '0' COMMENT '会员累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='会员账户统计表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ns_member_account`
--

INSERT INTO `ns_member_account` (`id`, `uid`, `shop_id`, `point`, `balance`, `coin`, `member_cunsum`, `member_sum_point`) VALUES
(6, 13, 0, 0, '0.00', 0, '0.00', 0),
(7, 14, 0, 0, '0.00', 0, '0.00', 0),
(8, 15, 0, 0, '0.00', 0, '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_account_records`
--

CREATE TABLE IF NOT EXISTS `ns_member_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '账户类型1.积分2.余额3.购物币',
  `sign` smallint(6) NOT NULL DEFAULT '1' COMMENT '正负号',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `from_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '产生方式1.商城订单2.订单退还3.兑换4.充值5.签到6.分享7.注册8.提现9提现退还',
  `data_id` int(11) NOT NULL DEFAULT '0' COMMENT '相关表的数据ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '数据相关内容描述文本',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='会员流水账表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ns_member_account_records`
--

INSERT INTO `ns_member_account_records` (`id`, `uid`, `shop_id`, `account_type`, `sign`, `number`, `from_type`, `data_id`, `text`, `create_time`) VALUES
(13, 13, 0, 1, 1, '0.00', 7, 0, '注册会员赠送积分', 1555570311),
(14, 14, 0, 1, 1, '0.00', 7, 0, '注册会员赠送积分', 1555571526),
(15, 14, 0, 1, 1, '0.00', 19, 0, '点赞赠送积分', 1555572121),
(16, 14, 0, 1, 1, '0.00', 5, 0, '签到赠送积分', 1555572201),
(17, 15, 0, 1, 1, '0.00', 7, 0, '注册会员赠送积分', 1555657878);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_balance_withdraw`
--

CREATE TABLE IF NOT EXISTS `ns_member_balance_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ask_for_date` int(11) DEFAULT '0' COMMENT '提现日期',
  `payment_date` int(11) DEFAULT '0' COMMENT '到账日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='会员余额提现记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_bank_account`
--

CREATE TABLE IF NOT EXISTS `ns_member_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `IDX_member_bank_account_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员提现账号' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_express_address`
--

CREATE TABLE IF NOT EXISTS `ns_member_express_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  PRIMARY KEY (`id`),
  KEY `IDX_member_express_address_uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='会员收货地址管理' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ns_member_express_address`
--

INSERT INTO `ns_member_express_address` (`id`, `uid`, `consigner`, `mobile`, `phone`, `province`, `city`, `district`, `address`, `zip_code`, `alias`, `is_default`) VALUES
(5, 14, '丁忠太', '18500074454', '', 34, 345, 2869, '澎湖湾', '457600', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_favorites`
--

CREATE TABLE IF NOT EXISTS `ns_member_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品或店铺ID',
  `fav_type` varchar(20) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,shop为店铺,默认为商品',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(300) DEFAULT NULL,
  `log_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '收藏备注',
  `fav_time` int(11) DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='收藏表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ns_member_favorites`
--

INSERT INTO `ns_member_favorites` (`log_id`, `uid`, `fav_id`, `fav_type`, `shop_id`, `shop_name`, `shop_logo`, `goods_name`, `goods_image`, `log_price`, `log_msg`, `fav_time`) VALUES
(15, 14, 6, 'goods', 0, '佳家生活商城', 'upload/common/1555559063.png', '怪化猫手机壳', 'upload/goods/20190418/b791f630679523b8ec1632920100af7e3.jpg', '25.00', '怪化猫手机壳', 1555572119);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_feedback`
--

CREATE TABLE IF NOT EXISTS `ns_member_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `opinion` text NOT NULL COMMENT '建议内容',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `reply` text NOT NULL COMMENT '回复内容',
  `reply_time` int(10) NOT NULL DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_gift`
--

CREATE TABLE IF NOT EXISTS `ns_member_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `promotion_gift_id` int(11) NOT NULL COMMENT '赠品活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠品ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '赠品名称',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '赠品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠品数量',
  `get_type` int(11) NOT NULL DEFAULT '1' COMMENT '获取方式',
  `get_type_id` int(11) NOT NULL COMMENT '获取方式对应ID',
  `desc` text NOT NULL COMMENT '说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员赠品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_level`
--

CREATE TABLE IF NOT EXISTS `ns_member_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_integral` int(11) NOT NULL DEFAULT '0' COMMENT '累计积分',
  `goods_discount` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '等级描述',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '消费额度',
  `upgrade` int(11) NOT NULL COMMENT '升级条件  1.累计积分 2.消费额度 3.同时满足',
  `relation` int(11) NOT NULL DEFAULT '1' COMMENT '1.或 2. 且',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员等级' AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `ns_member_level`
--

INSERT INTO `ns_member_level` (`level_id`, `shop_id`, `level_name`, `min_integral`, `goods_discount`, `desc`, `is_default`, `quota`, `upgrade`, `relation`) VALUES
(47, 0, '普通会员', 0, '1.00', '', 1, 0, 1, 1),
(50, 0, '白银会员', 100, '0.99', '白银会员', 0, 100, 3, 1),
(51, 0, '黄金会员', 10000, '0.98', '累积满10000积分，享受98折黄金会员优惠。', 0, 10000, 3, 1),
(52, 0, '铂金会员', 100000, '0.95', '累积积分满100000份，享受95折铂金会员优惠', 0, 100000, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ns_member_recharge`
--

CREATE TABLE IF NOT EXISTS `ns_member_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `uid` varchar(255) NOT NULL COMMENT '用户uid',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_pay` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员充值余额记录' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_member_recharge`
--

INSERT INTO `ns_member_recharge` (`id`, `recharge_money`, `uid`, `out_trade_no`, `create_time`, `is_pay`, `status`) VALUES
(1, '100.00', '14', '1555572018', '0', '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `ns_notice`
--

CREATE TABLE IF NOT EXISTS `ns_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `notice_content` text NOT NULL COMMENT '公告内容',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺公告表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_offpay_area`
--

CREATE TABLE IF NOT EXISTS `ns_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text COMMENT '省Id组合',
  `city_id` text COMMENT '市Id组合',
  `district_id` text COMMENT '县Id组合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='货到付款支持地区表';

-- --------------------------------------------------------

--
-- 表的结构 `ns_order`
--

CREATE TABLE IF NOT EXISTS `ns_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型。取值范围：\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN (微信自有支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN_DAIXIAO (微信代销支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单配送方式',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time_adjust` int(11) NOT NULL DEFAULT '0' COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `tax_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流公司ID',
  `give_point_type` int(11) NOT NULL DEFAULT '1' COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  `pay_time` int(11) DEFAULT '0' COMMENT '订单付款时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '买家要求配送时间',
  `sign_time` int(11) DEFAULT '0' COMMENT '买家签收时间',
  `consign_time` int(11) DEFAULT '0' COMMENT '卖家发货时间',
  `create_time` int(11) DEFAULT '0' COMMENT '订单创建时间',
  `finish_time` int(11) DEFAULT '0' COMMENT '订单完成时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '订单是否已删除',
  `operator_type` int(1) NOT NULL DEFAULT '0' COMMENT '操作人类型  1店铺  2用户',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  PRIMARY KEY (`order_id`),
  KEY `UK_ns_order_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_order_no` (`order_no`),
  KEY `UK_ns_order_pay_status` (`pay_status`),
  KEY `UK_ns_order_status` (`order_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表' AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `ns_order`
--

INSERT INTO `ns_order` (`order_id`, `order_no`, `out_trade_no`, `order_type`, `payment_type`, `shipping_type`, `order_from`, `buyer_id`, `user_name`, `buyer_ip`, `buyer_message`, `buyer_invoice`, `receiver_mobile`, `receiver_province`, `receiver_city`, `receiver_district`, `receiver_address`, `receiver_zip`, `receiver_name`, `shop_id`, `shop_name`, `seller_star`, `seller_memo`, `consign_time_adjust`, `goods_money`, `order_money`, `point`, `point_money`, `coupon_money`, `coupon_id`, `user_money`, `user_platform_money`, `promotion_money`, `shipping_money`, `pay_money`, `refund_money`, `coin_money`, `give_point`, `give_coin`, `order_status`, `pay_status`, `shipping_status`, `review_status`, `feedback_status`, `is_evaluate`, `tax_money`, `shipping_company_id`, `give_point_type`, `pay_time`, `shipping_time`, `sign_time`, `consign_time`, `create_time`, `finish_time`, `is_deleted`, `operator_type`, `operator_id`, `refund_balance_money`) VALUES
(46, '201904180000001', '155557186417191000', 1, 0, 1, '3', 14, 'xiaojia', '1', '', '', '18500074454', 34, 345, 2869, '澎湖湾', '457600', '丁忠太', 28, '怪化猫', 0, '', 0, '25.00', '25.00', 0, '0.00', '0.00', 0, '0.00', '0.00', '0.00', '0.00', '25.00', '0.00', '0.00', 0, '0.00', 5, 0, 0, 0, 0, 0, '0.00', 3, 0, 0, 0, 0, 0, 1555571864, 0, 0, 0, 0, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_action`
--

CREATE TABLE IF NOT EXISTS `ns_order_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`action_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1706 COMMENT='订单操作表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods`
--

CREATE TABLE IF NOT EXISTS `ns_order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  `refund_type` int(11) NOT NULL DEFAULT '1' COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `tmp_express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时物流公司',
  `tmp_express_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '批量打印时添加的临时物流公司id',
  `tmp_express_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时订单编号',
  PRIMARY KEY (`order_goods_id`),
  KEY `UK_ns_order_goods_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_goods_goods_id` (`goods_id`),
  KEY `UK_ns_order_goods_order_id` (`order_id`),
  KEY `UK_ns_order_goods_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_goods_sku_id` (`sku_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=289 COMMENT='订单商品表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_order_goods`
--

INSERT INTO `ns_order_goods` (`order_goods_id`, `order_id`, `goods_id`, `goods_name`, `sku_id`, `sku_name`, `price`, `cost_price`, `num`, `adjust_money`, `goods_money`, `goods_picture`, `shop_id`, `buyer_id`, `point_exchange_type`, `goods_type`, `promotion_id`, `promotion_type_id`, `order_type`, `order_status`, `give_point`, `shipping_status`, `refund_type`, `refund_require_money`, `refund_reason`, `refund_shipping_code`, `refund_shipping_company`, `refund_real_money`, `refund_status`, `memo`, `is_evaluate`, `refund_time`, `refund_balance_money`, `tmp_express_company`, `tmp_express_company_id`, `tmp_express_no`) VALUES
(1, 46, 6, '怪化猫手机壳', 7, '', '25.00', '10.00', '1', '0.00', '25.00', 5, 0, 14, 0, '1', 0, 0, 1, 0, 0, 0, 1, '0.00', '', '', '0', '0.00', 0, '', 0, 0, '0.00', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods_express`
--

CREATE TABLE IF NOT EXISTS `ns_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_goods_express_order_goods_id_array` (`order_goods_id_array`),
  KEY `UK_ns_order_goods_express_order_id` (`order_id`),
  KEY `UK_ns_order_goods_express_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_goods_promotion_details`
--

CREATE TABLE IF NOT EXISTS `ns_order_goods_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `promotion_type` varbinary(255) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ns_order_goods_promotion_d_order_id` (`order_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_id` (`promotion_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_type` (`promotion_type`),
  KEY `IDX_ns_order_goods_promotion_d_sku_id` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单商品优惠详情' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_payment`
--

CREATE TABLE IF NOT EXISTS `ns_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '交易号，支付宝退款用，微信传入空',
  KEY `IDX_ns_order_payment_out_trade_no` (`out_trade_no`),
  KEY `IDX_ns_order_payment_pay_status` (`pay_status`),
  KEY `IDX_ns_order_payment_pay_type` (`pay_type`),
  KEY `IDX_ns_order_payment_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='订单支付表';

--
-- 转存表中的数据 `ns_order_payment`
--

INSERT INTO `ns_order_payment` (`out_trade_no`, `shop_id`, `type`, `type_alis_id`, `pay_body`, `pay_detail`, `pay_money`, `pay_status`, `pay_type`, `create_time`, `pay_time`, `trade_no`) VALUES
('155557186417191000', 28, 1, 46, '怪化猫订单', '怪化猫订单', '25.00', 0, 1, 1555571864, 0, ''),
('155557201215091000', 0, 4, 1, '余额充值', '用户通知余额', '100.00', 0, 1, 1555572018, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_pickup`
--

CREATE TABLE IF NOT EXISTS `ns_order_pickup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `buyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `buyer_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '提货人电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提货备注信息',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='订单自提点管理' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_promotion_details`
--

CREATE TABLE IF NOT EXISTS `ns_order_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `promotion_type_id` int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `promotion_type` varchar(255) NOT NULL COMMENT '优惠类型',
  `promotion_name` varchar(50) NOT NULL COMMENT '该优惠活动的名称',
  `promotion_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠使用条件说明',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_promotion_details_order_id` (`order_id`),
  KEY `UK_ns_order_promotion_details_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_promotion_details_promotion_type` (`promotion_type`),
  KEY `UK_ns_order_promotion_details_promotion_type_id` (`promotion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=364 COMMENT='订单优惠详情' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_refund`
--

CREATE TABLE IF NOT EXISTS `ns_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `refund_status` varchar(255) NOT NULL COMMENT '操作状态\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n4	等待卖家确认退款	卖家同意退款\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
  `action` varchar(255) NOT NULL COMMENT '退款操作内容描述',
  `action_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作方 1 买家 2 卖家',
  `action_userid` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `action_username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='订单商品退货退款操作表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_refund_account_records`
--

CREATE TABLE IF NOT EXISTS `ns_order_refund_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项id',
  `refund_trade_no` varchar(55) NOT NULL COMMENT '退款交易号',
  `refund_money` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_way` int(11) NOT NULL COMMENT '退款方式（1：微信，2：支付宝，10：线下）',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `refund_time` int(11) NOT NULL COMMENT '退款时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款账户记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_shipping_fee`
--

CREATE TABLE IF NOT EXISTS `ns_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `city_id_array` text NOT NULL COMMENT '市ID组',
  `weight_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用重量运费',
  `weight_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首重',
  `weight_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首重运费',
  `weight_xnum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '续重',
  `weight_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续重运费',
  `volume_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用体积计算运费',
  `volume_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首体积量',
  `volume_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首体积运费',
  `volume_xnum` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积量',
  `volume_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积运费',
  `bynum_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用计件方式运费',
  `bynum_snum` int(11) NOT NULL DEFAULT '0' COMMENT '首件',
  `bynum_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首件运费',
  `bynum_xnum` int(11) NOT NULL DEFAULT '1' COMMENT '续件',
  `bynum_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续件运费',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `district_id_array` text COMMENT '区县ID组',
  PRIMARY KEY (`shipping_fee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='运费模板' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_order_shipping_fee`
--

INSERT INTO `ns_order_shipping_fee` (`shipping_fee_id`, `shipping_fee_name`, `is_default`, `co_id`, `shop_id`, `province_id_array`, `city_id_array`, `weight_is_use`, `weight_snum`, `weight_sprice`, `weight_xnum`, `weight_xprice`, `volume_is_use`, `volume_snum`, `volume_sprice`, `volume_xnum`, `volume_xprice`, `bynum_is_use`, `bynum_snum`, `bynum_sprice`, `bynum_xnum`, `bynum_xprice`, `create_time`, `update_time`, `district_id_array`) VALUES
(3, '百世快递', 0, 3, 28, '34,32,33', '345,343,344', 1, '0.00', '0.00', '0.00', '0.00', 1, '0.00', '0.00', '0.00', '0.00', 1, 0, '0.00', 0, '0.00', 1555571835, 0, '2869');

-- --------------------------------------------------------

--
-- 表的结构 `ns_order_shop_return`
--

CREATE TABLE IF NOT EXISTS `ns_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺退货设置';

--
-- 转存表中的数据 `ns_order_shop_return`
--

INSERT INTO `ns_order_shop_return` (`shop_id`, `shop_address`, `seller_name`, `seller_mobile`, `seller_zipcode`, `create_time`, `modify_time`) VALUES
(28, '', '', '', '', 1555571838, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_pickup_point`
--

CREATE TABLE IF NOT EXISTS `ns_pickup_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='自提点管理' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_adv`
--

CREATE TABLE IF NOT EXISTS `ns_platform_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL DEFAULT '' COMMENT '广告内容描述',
  `adv_url` text,
  `adv_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '广告内容图片',
  `slide_sort` int(11) DEFAULT NULL,
  `click_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告点击率',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='广告表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_adv_position`
--

CREATE TABLE IF NOT EXISTS `ns_platform_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_price` int(10) NOT NULL DEFAULT '0' COMMENT '广告位单价',
  `adv_num` int(10) NOT NULL DEFAULT '0' COMMENT '拥有的广告数',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '广告位点击率',
  `default_content` varchar(300) DEFAULT NULL,
  `ap_background_color` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '广告位背景色 默认白色',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '广告位所在位置类型   1 pc端  2 手机端',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_del` int(11) DEFAULT '0',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='广告位表' AUTO_INCREMENT=1168 ;

--
-- 转存表中的数据 `ns_platform_adv_position`
--

INSERT INTO `ns_platform_adv_position` (`ap_id`, `ap_name`, `ap_intro`, `ap_class`, `ap_display`, `is_use`, `ap_height`, `ap_width`, `ap_price`, `adv_num`, `click_num`, `default_content`, `ap_background_color`, `type`, `instance_id`, `is_del`) VALUES
(1051, '商城首页最顶部广告位', '商城首页最顶部广告位', 0, 2, 1, 1000, 1000, 0, 0, 0, '', '#000000', 1, 0, 1),
(1052, '商城首页logo右侧小广告', '商城首页logo右侧小广告', 0, 2, 1, 90, 170, 0, 0, 0, 'public/static/images/default_img_url/shouyelogo.png', '#FFFFFF', 1, 0, 1),
(1053, '商城首页滚动图广告位', '商城首页滚动图广告位', 0, 2, 1, 443, 800, 0, 0, 0, 'upload/image_collection/1555636883.jpg', '#ffffff', 1, 0, 1),
(1054, '商城首页中部推荐广告位', '商城首页中部推荐广告位（140*242）', 0, 2, 1, 140, 242, 0, 0, 0, '', '', 1, 0, 1),
(1055, '商城首页店铺街', '商城首页店铺街', 0, 2, 1, 278, 400, 0, 0, 0, 'public/static/images/default_img_url/dianpujie.jpg', '#ffffff', 1, 0, 1),
(1056, '商城限时折扣轮播广告位', '商城限时折扣轮播广告位', 0, 2, 1, 443, 1903, 0, 0, 0, 'public/static/images/default_img_url/xianshizhekou.png', '#FFFFFF', 1, 0, 1),
(1075, '商城品牌专区轮播广告位', '商城品牌专区轮播广告位', 0, 0, 1, 443, 1210, 0, 0, 0, 'public/static/images/default_img_url/pinpaizhuanqu.png', '#000000', 1, 0, 1),
(1076, '商城积分中心轮播广告位', '商城积分中心轮播广告位', 0, 2, 1, 320, 910, 0, 0, 0, 'public/static/images/default_img_url/jifenzhongxin.jpg', '#000000', 1, 0, 1),
(1102, '商城积分中心中部广告位', '商城积分中心中部广告位', 0, 2, 1, 60, 1210, 0, 0, 0, 'public/static/images/default_img_url/jifenzhongxinzhongbu.jpg', '#000000', 1, 0, 1),
(1103, '商城登录页面轮播广告位', '商城登录页面轮播广告位', 0, 0, 1, 0, 0, 0, 0, 0, '', '', 1, 0, 1),
(1105, '手机端首页轮播广告位', '手机端首页轮播广告位', 0, 1, 1, 175, 320, 0, 0, 0, 'public/static/images/default_img_url/waplunbo.png', '', 2, 0, 1),
(1152, '手机端会员中心广告位', '手机端会员中心广告位', 0, 2, 1, 100, 750, 0, 0, 0, 'public/static/images/default_img_url/waphuiyuanzhongxin.png', '', 2, 0, 1),
(1162, '手机端品牌专区广告位', '品牌专区广告', 0, 2, 1, 192, 720, 0, 0, 0, 'public/static/images/default_img_url/wappinpaizhuanqu.png', '', 2, 0, 1),
(1163, '手机端限时折扣专区广告位', '限时折扣专区广告位', 0, 2, 1, 130, 720, 0, 0, 0, 'public/static/images/default_img_url/wapxianshizhekou.png', '', 2, 0, 1),
(1164, '手机端首页商城热卖广告位', '手机端商城热卖', 0, 2, 1, 100, 100, 0, 0, 0, 'public/static/images/default_img_url/wapshangchengremai.png', '#000000', 2, 0, 1),
(1165, '手机端积分中心广告位', '积分中心广告位', 0, 2, 1, 100, 100, 0, 0, 0, 'public/static/images/default_img_url/wapjifenzhongxin.png', '#000000', 2, 0, 1),
(1166, '首页轮播图', '首页轮播图', 0, 0, 1, 443, 800, 0, 0, 0, 'upload/image_collection/1555642291.jpg', '#000000', 1, 0, 0),
(1167, '手机端首页轮播图', '手机端首页轮播图', 0, 1, 1, 175, 320, 0, 0, 0, 'upload/image_collection/1555748632.png', '#000000', 2, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_block`
--

CREATE TABLE IF NOT EXISTS `ns_platform_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_display` smallint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `block_color` varchar(255) NOT NULL COMMENT '颜色风格',
  `sort` int(11) DEFAULT NULL,
  `block_name` varchar(50) NOT NULL DEFAULT '' COMMENT '板块名称',
  `block_short_name` varchar(50) DEFAULT NULL COMMENT '板块简称',
  `recommend_ad_image_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐单图广告位名称',
  `recommend_ad_image` int(11) NOT NULL DEFAULT '0' COMMENT '推荐单图广告位',
  `recommend_ad_slide_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐幻灯广告位名称',
  `recommend_ad_slide` int(11) NOT NULL COMMENT '推荐幻灯广告位',
  `recommend_ad_images_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位名称',
  `recommend_ad_images` int(11) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位',
  `recommend_brands` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐品牌',
  `recommend_categorys` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐商品分类',
  `recommend_goods_category_name_1` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_1` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_2` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_2` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_3` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_3` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `block_data` longtext COMMENT '板块数据',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='首页促销板块' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_goods_recommend`
--

CREATE TABLE IF NOT EXISTS `ns_platform_goods_recommend` (
  `recommend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '推荐商品ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '推荐状态',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '推荐类型',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=442 COMMENT='平台商品推荐' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ns_platform_goods_recommend`
--

INSERT INTO `ns_platform_goods_recommend` (`recommend_id`, `goods_id`, `state`, `class_id`, `create_time`, `modify_time`) VALUES
(19, 6, 1, 2, 1555571323, 1555571323);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_goods_recommend_class`
--

CREATE TABLE IF NOT EXISTS `ns_platform_goods_recommend_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `class_type` int(11) NOT NULL DEFAULT '1' COMMENT '推荐模块1.系统固有模块2.平台增加模块',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `sort` int(11) NOT NULL DEFAULT '255' COMMENT '排序号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `show_type` int(11) NOT NULL DEFAULT '0' COMMENT '展示类型  0电脑端  1手机端',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺商品推荐类别' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ns_platform_goods_recommend_class`
--

INSERT INTO `ns_platform_goods_recommend_class` (`class_id`, `class_name`, `class_type`, `is_use`, `sort`, `shop_id`, `show_type`) VALUES
(2, '促销', 2, 1, 1, 28, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_help_class`
--

CREATE TABLE IF NOT EXISTS `ns_platform_help_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.帮助类别2.会员协议类别3.开店协议类别',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='平台说明类型' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ns_platform_help_class`
--

INSERT INTO `ns_platform_help_class` (`class_id`, `type`, `class_name`, `parent_class_id`, `sort`) VALUES
(1, 1, '新手上路', 0, 1),
(2, 1, '配送与支付', 0, 2),
(3, 1, '会员中心', 0, 3),
(4, 1, '服务保证', 0, 4),
(5, 1, '联系我们', 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_help_document`
--

CREATE TABLE IF NOT EXISTS `ns_platform_help_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `uid` int(11) NOT NULL COMMENT '最后修改人ID',
  `class_id` int(11) NOT NULL COMMENT '所属说明类型ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modufy_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='平台说明内容' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ns_platform_help_document`
--

INSERT INTO `ns_platform_help_document` (`id`, `uid`, `class_id`, `title`, `link_url`, `sort`, `content`, `image`, `create_time`, `modufy_time`) VALUES
(1, 1, 1, '购物流程', '', 0, '<p>1</p>', '', 0, 1509699669),
(2, 2, 2, '支付方式说明', '', 5, '<p>支付方式说明</p>', '', 0, 1493810155),
(3, 87, 3, '售后流程', '', 1, '', '', 0, 1499240296),
(5, 2, 3, '资金管理', '', 6, '<p>资金管理</p>', '', 0, 1493964639),
(6, 2, 3, '我的收藏', '', 7, '<p>我的收藏</p>', '', 0, 1493809215),
(7, 2, 2, '货到付款区域', '', 3, '<p>货到付款区域</p>', '', 1487559901, 1493810113),
(8, 2, 2, '配送支付智能查询', '', 4, '<p>配送支付智能查询</p>', '', 1487559942, 1493810133),
(9, 2, 4, '退换货原则', '', 9, '<p>退换货原则</p>', '', 1487560238, 1493809406),
(10, 2, 4, '售后服务保证', '', 9, '<p>售后服务保证</p>', '', 1487560263, 1493809427),
(11, 2, 4, '产品质量保证', '', 10, '<p>产品质量保证</p>', '', 1487560296, 1493809443),
(12, 2, 5, '网站故障报告', '', 11, '<p>网站故障报告</p>', '', 1487560338, 1493809546),
(13, 1, 1, '订购方式', '', 2, '<p>订购方式</p>', '', 1493206148, 1511251867),
(14, 1, 3, '我的订单', '', 8, '<p>我的订单</p>', '', 1493809066, 1497102958),
(15, 2, 5, '选机咨询', '', 12, '<p>选机咨询</p>', '', 1493809482, 1493809565),
(16, 2, 5, '投诉与建议', '', 13, '<p>投诉与建议</p>', '', 1493809511, 1493964721),
(17, 1, 1, '用户注册协议', '', 0, '<p><span style="color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Verdana, Lucida, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);">牛酷商城用户注册协议本协议是您与牛酷商城网站（简称&quot;本站&quot;）所有者（以下简称为&quot;牛酷商城&quot;）之间就牛酷商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击&quot;同意并继续&quot;按钮后，本协议即构成对双方有约束力的法律文件。第1条 本站服务条款的确认和接纳1.1本站的各项电子服务的所有权和运作权归牛酷商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。第2条 本站服务2.1牛酷商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。第3条 用户信息3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且牛酷商城保留终止用户使用牛酷商城各项服务的权利。3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。第4条 用户依法言行义务本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；第5条 其他5.1牛酷商城网站所有者是指在政府部门依法许可或备案的牛酷商城网站经营主体。5.2您点击本协议下方的&quot;同意并继续&quot;按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</span></p>', '', 1499325553, 1511251847);

-- --------------------------------------------------------

--
-- 表的结构 `ns_platform_link`
--

CREATE TABLE IF NOT EXISTS `ns_platform_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) NOT NULL COMMENT '标题',
  `link_url` varchar(100) NOT NULL COMMENT '链接',
  `link_pic` varchar(100) NOT NULL COMMENT '图片',
  `link_sort` int(11) DEFAULT NULL,
  `is_blank` int(11) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开 1.是 2.否',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示 1.是 2.否',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='友情链接表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_point_config`
--

CREATE TABLE IF NOT EXISTS `ns_point_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启动',
  `convert_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '1积分对应金额',
  `desc` text NOT NULL COMMENT '积分说明',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='积分设置表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ns_point_config`
--

INSERT INTO `ns_point_config` (`id`, `shop_id`, `is_open`, `convert_rate`, `desc`, `create_time`, `modify_time`) VALUES
(1, 0, 0, '1.00', '每消费1元。积分+1', 1509418871, 1555568206);

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_bundling`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `bl_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `shipping_fee_type` tinyint(1) NOT NULL COMMENT '运费承担方式 1卖家承担运费 2买家承担运费',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_bundling_goods`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_discount`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` text NOT NULL COMMENT '备注',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='限时折扣' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_discount_goods`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_discount_goods` (
  `discount_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`discount_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='限时折扣商品列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_full_mail`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_full_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启 0未开启 1已开启',
  `full_mail_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '包邮所需订单金额',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `no_mail_province_id_array` text NOT NULL COMMENT '不包邮省id组',
  `no_mail_city_id_array` text NOT NULL COMMENT '不包邮市id组',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='满额包邮' AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `ns_promotion_full_mail`
--

INSERT INTO `ns_promotion_full_mail` (`mail_id`, `shop_id`, `is_open`, `full_mail_money`, `create_time`, `modify_time`, `no_mail_province_id_array`, `no_mail_city_id_array`) VALUES
(89, 0, 0, '0.00', 1555570869, 0, '', ''),
(90, 28, 0, '0.00', 1555570918, 0, '', ''),
(91, 27, 0, '0.00', 1555583818, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_gift`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ',
  `days` int(10) unsigned NOT NULL COMMENT '领取有效期(多少天)',
  `max_num` varchar(50) NOT NULL COMMENT '领取限制(次/人 (0表示不限领取次数))',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `start_time` int(11) DEFAULT '0' COMMENT '赠品有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '赠品有效期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='赠品活动表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_gift_goods`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_gift_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `gift_id` int(10) unsigned NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品赠品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `shop_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `status` tinyint(1) unsigned NOT NULL COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.普通优惠  2.多级优惠',
  `range_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品 0部分商品',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '活动结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='满就送活动表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong_goods`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_mansong_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mansong_id` int(11) NOT NULL COMMENT '满减送ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动状态',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='满减送商品' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_promotion_mansong_rule`
--

CREATE TABLE IF NOT EXISTS `ns_promotion_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '级别价格(满多少)',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减现金优惠金额（减多少金额）',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0' COMMENT '免邮费',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '送积分数量（0表示不送）',
  `give_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '送优惠券的id（0表示不送）',
  `gift_id` int(11) NOT NULL COMMENT '礼品(赠品)id',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='满就送活动规则表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_reward_rule`
--

CREATE TABLE IF NOT EXISTS `ns_reward_rule` (
  `shop_id` int(10) unsigned NOT NULL,
  `sign_point` int(11) NOT NULL DEFAULT '0' COMMENT '签到送积分',
  `share_point` int(11) NOT NULL DEFAULT '0' COMMENT '分享送积分',
  `reg_member_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 自己获得的积分',
  `reg_member_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上级获得的积分',
  `reg_member_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上级获得的积分',
  `reg_member_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上上级获得的积分',
  `reg_promoter_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 自己获得的积分',
  `reg_promoter_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上级获得的积分',
  `reg_promoter_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上级获得的积分',
  `reg_promoter_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上上级获得的积分',
  `reg_partner_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 自己获得的积分',
  `reg_partner_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上级获得的积分',
  `reg_partner_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上级获得的积分',
  `reg_partner_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上上级获得的积分',
  `into_store_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '进店领用优惠券  存入优惠券id(coupon_id)',
  `share_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '分享领用优惠券  存入优惠券id(coupon_id)',
  `click_point` int(11) NOT NULL DEFAULT '0' COMMENT '点赞送积分',
  `comment_point` int(11) NOT NULL DEFAULT '0' COMMENT '评论送积分',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='奖励规则表';

--
-- 转存表中的数据 `ns_reward_rule`
--

INSERT INTO `ns_reward_rule` (`shop_id`, `sign_point`, `share_point`, `reg_member_self_point`, `reg_member_one_point`, `reg_member_two_point`, `reg_member_three_point`, `reg_promoter_self_point`, `reg_promoter_one_point`, `reg_promoter_two_point`, `reg_promoter_three_point`, `reg_partner_self_point`, `reg_partner_one_point`, `reg_partner_two_point`, `reg_partner_three_point`, `into_store_coupon`, `share_coupon`, `click_point`, `comment_point`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_school_info`
--

CREATE TABLE IF NOT EXISTS `ns_school_info` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '招生标题',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报名费用',
  `content` text COMMENT '课程详情',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '宣传图',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上架时间',
  `sort` smallint(4) unsigned DEFAULT '50' COMMENT '排序',
  `is_on` enum('0','1') NOT NULL DEFAULT '0' COMMENT '上架:1=是,0=否',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提升层次(单选)',
  `classtype_id` int(10) NOT NULL DEFAULT '0' COMMENT '上课类型(单选)',
  `shop_id` int(11) DEFAULT '0' COMMENT '店铺id',
  `province` mediumint(8) DEFAULT '0' COMMENT '省',
  `city` mediumint(8) DEFAULT '0' COMMENT '市',
  `area` mediumint(8) DEFAULT '0' COMMENT '县',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='招考信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_school_resume`
--

CREATE TABLE IF NOT EXISTS `ns_school_resume` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `realname` varchar(10) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别，默认1为男',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '证件类型,1为身份证，2为护照',
  `national` varchar(10) NOT NULL DEFAULT '' COMMENT '民族',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `address2` varchar(120) NOT NULL DEFAULT '' COMMENT '收货地址',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `mobile2` varchar(20) NOT NULL DEFAULT '' COMMENT '备用手机',
  `idcardimg` varchar(255) DEFAULT NULL COMMENT '身份证照片',
  `graduationimg` varchar(255) DEFAULT NULL COMMENT '毕业证照片',
  `headimg` varchar(255) DEFAULT NULL COMMENT '本人照片',
  `school` int(10) DEFAULT NULL COMMENT '报考院校',
  `professional` int(10) DEFAULT NULL COMMENT '报考院校',
  `record` int(10) DEFAULT NULL COMMENT '报考院校',
  `classtype` int(10) DEFAULT NULL COMMENT '报考院校',
  `province_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地市ID',
  `district_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `apply_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1为已同意，2为已拒绝，默认为正在申请中',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学历提升报名信息' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ns_school_resume`
--

INSERT INTO `ns_school_resume` (`uid`, `realname`, `sex`, `type`, `national`, `idcard`, `birthday`, `address`, `address2`, `mobile`, `mobile2`, `idcardimg`, `graduationimg`, `headimg`, `school`, `professional`, `record`, `classtype`, `province_id`, `city_id`, `district_id`, `apply_state`) VALUES
(13, 'dfsa', 0, 0, 'fasd', '410927109821091345', '0000-00-00', 'fdsafads', 'fad', '18877431109', '', 'upload/common/1555740192.gif', 'upload/common/1555740193.gif', 'upload/common/1555740190.gif', 0, 0, 0, 0, 21, 232, 1979, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop`
--

CREATE TABLE IF NOT EXISTS `ns_shop` (
  `shop_id` int(11) NOT NULL COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL DEFAULT '0' COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `shop_company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `shop_banner` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺横幅',
  `shop_avatar` varchar(150) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_qq` varchar(50) NOT NULL DEFAULT '' COMMENT 'QQ',
  `shop_ww` varchar(50) NOT NULL DEFAULT '' COMMENT '阿里旺旺',
  `shop_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '商家电话',
  `shop_domain` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺二级域名',
  `shop_domain_times` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '二级域名修改次数',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `shop_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `shop_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `shop_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_stamp` varchar(200) NOT NULL DEFAULT '' COMMENT '店铺印章',
  `shop_printdesc` varchar(500) NOT NULL DEFAULT '' COMMENT '打印订单页面下方说明文字',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺可提现金额',
  `shop_workingtime` varchar(100) NOT NULL DEFAULT '' COMMENT '工作时间',
  `live_store_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺名称',
  `live_store_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `live_store_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺电话',
  `live_store_bus` varchar(255) NOT NULL DEFAULT '' COMMENT '公交线路',
  `shop_vrcode_prefix` char(3) NOT NULL DEFAULT '' COMMENT '商家兑换码前缀',
  `store_qtian` tinyint(1) NOT NULL DEFAULT '0' COMMENT '7天退换',
  `shop_zhping` tinyint(1) NOT NULL DEFAULT '0' COMMENT '正品保障',
  `shop_erxiaoshi` tinyint(1) NOT NULL DEFAULT '0' COMMENT '两小时发货',
  `shop_tuihuo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退货承诺',
  `shop_shiyong` tinyint(1) NOT NULL DEFAULT '0' COMMENT '试用中心',
  `shop_shiti` tinyint(1) NOT NULL DEFAULT '0' COMMENT '实体验证',
  `shop_xiaoxie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消协保证',
  `shop_huodaofk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '货到付款',
  `shop_free_time` varchar(10) NOT NULL DEFAULT '' COMMENT '商家配送时间',
  `shop_region` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺默认配送区域',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  `shop_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺公众号',
  `shop_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '店铺时间',
  `shop_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '店铺关闭时间',
  `shop_platform_commission_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取佣金比率',
  `latitude_longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '线下店铺地图经纬度',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';

--
-- 转存表中的数据 `ns_shop`
--

INSERT INTO `ns_shop` (`shop_id`, `shop_name`, `shop_type`, `uid`, `shop_group_id`, `shop_company_name`, `province_id`, `city_id`, `shop_address`, `shop_zip`, `shop_state`, `shop_close_info`, `shop_sort`, `shop_logo`, `shop_banner`, `shop_avatar`, `shop_keywords`, `shop_description`, `shop_qq`, `shop_ww`, `shop_phone`, `shop_domain`, `shop_domain_times`, `shop_recommend`, `shop_credit`, `shop_desccredit`, `shop_servicecredit`, `shop_deliverycredit`, `shop_collect`, `shop_stamp`, `shop_printdesc`, `shop_sales`, `shop_account`, `shop_cash`, `shop_workingtime`, `live_store_name`, `live_store_address`, `live_store_tel`, `live_store_bus`, `shop_vrcode_prefix`, `store_qtian`, `shop_zhping`, `shop_erxiaoshi`, `shop_tuihuo`, `shop_shiyong`, `shop_shiti`, `shop_xiaoxie`, `shop_huodaofk`, `shop_free_time`, `shop_region`, `recommend_uid`, `shop_qrcode`, `shop_create_time`, `shop_end_time`, `shop_platform_commission_rate`, `latitude_longitude`) VALUES
(0, '官方旗舰店', 1, 0, 1, '', 0, 0, '', '', 1, '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 1, 1, 1, 1, 1, '', '', '0.00', '0.00', '0.00', '', '官方旗舰店', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, '5.00', '111.491085,40.138736'),
(27, '招标文件', 2, 11, 2, '', 0, 0, '', '', 1, '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '0.00', '0.00', '0.00', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, '0.00', ''),
(28, '怪化猫', 2, 13, 2, '赛尔互联网络科技有限公司', 1, 1, '清华科技园', '', 1, '', 1999, 'upload/common/1555571146.gif', 'upload/common/1555636599.jpg', 'upload/common/1555571244.jpg', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '0.00', '0.00', '0.00', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, '0.00', ''),
(29, '41234213', 2, 15, 2, '312321312', 20, 229, '321321', '', 1, '', 1999, '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '0.00', '0.00', '0.00', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, '0.00', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account` (
  `shop_id` int(11) NOT NULL,
  `shop_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总营业额',
  `shop_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺入账总额',
  `shop_proceeds` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺收益总额',
  `shop_platform_commission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取店铺利润总额',
  `shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺提现总额',
  `shop_point` int(11) NOT NULL DEFAULT '0' COMMENT '店铺发放的积分总额',
  `shop_point_use` int(11) NOT NULL DEFAULT '0' COMMENT '会员已使用多少积分',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺账户表';

--
-- 转存表中的数据 `ns_shop_account`
--

INSERT INTO `ns_shop_account` (`shop_id`, `shop_profit`, `shop_total_money`, `shop_proceeds`, `shop_platform_commission`, `shop_withdraw`, `shop_point`, `shop_point_use`) VALUES
(0, '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0),
(27, '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0),
(28, '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0),
(29, '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_money_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_money_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺入账总额的记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_proceeds_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_proceeds_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺收益总额的记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_profit_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_profit_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺营业额的记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '发生方式',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺的可用余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺账户记录管理' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_return_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='平台抽取利润的记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_account_withdraw_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现的记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_ad`
--

CREATE TABLE IF NOT EXISTS `ns_shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺广告设置' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_apply`
--

CREATE TABLE IF NOT EXISTS `ns_shop_apply` (
  `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID申请成功之前为0',
  `apply_type` int(11) NOT NULL DEFAULT '2' COMMENT '申请类型1.个人2.公司',
  `uid` int(10) unsigned NOT NULL COMMENT '用户编号',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主用户名',
  `company_province_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地市ID',
  `company_district_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `company_address_detail` varchar(50) NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `company_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '公司电话',
  `company_type` varchar(255) NOT NULL DEFAULT '私企' COMMENT '私企.个体.外企.中外合资',
  `company_employee_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '员工总数',
  `company_registered_capital` int(10) NOT NULL DEFAULT '0' COMMENT '注册资金',
  `contacts_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `contacts_email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `contacts_card_no` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证号',
  `contacts_card_electronic_1` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人手持身份证电子版',
  `contacts_card_electronic_2` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证正面',
  `contacts_card_electronic_3` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证反面',
  `business_licence_number` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照号',
  `business_sphere` varchar(1000) NOT NULL DEFAULT '' COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照电子版',
  `organization_code` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(255) NOT NULL DEFAULT '' COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行开户名',
  `bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '公司银行账号',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行支行名称',
  `bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '支行联行号',
  `bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号',
  `tax_registration_certificate_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号电子版',
  `taxpayer_id` varchar(50) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `apply_state` varchar(50) NOT NULL DEFAULT '1' COMMENT '申请状态 1-已提交申请 -1-审核失败 2-审核通过开店',
  `apply_message` varchar(200) NOT NULL DEFAULT '' COMMENT '管理员审核信息',
  `apply_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `shop_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺等级名称',
  `shop_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级id',
  `shop_group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺类型名称',
  `shop_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺类型ID',
  `paying_money_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) NOT NULL DEFAULT '' COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='店铺申请表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ns_shop_apply`
--

INSERT INTO `ns_shop_apply` (`apply_id`, `shop_id`, `apply_type`, `uid`, `company_name`, `user_name`, `company_province_id`, `company_city_id`, `company_district_id`, `company_address_detail`, `company_phone`, `company_type`, `company_employee_count`, `company_registered_capital`, `contacts_name`, `contacts_phone`, `contacts_email`, `contacts_card_no`, `contacts_card_electronic_1`, `contacts_card_electronic_2`, `contacts_card_electronic_3`, `business_licence_number`, `business_sphere`, `business_licence_number_electronic`, `organization_code`, `organization_code_electronic`, `general_taxpayer`, `bank_account_name`, `bank_account_number`, `bank_name`, `bank_code`, `bank_address`, `bank_licence_electronic`, `is_settlement_account`, `settlement_bank_account_name`, `settlement_bank_account_number`, `settlement_bank_name`, `settlement_bank_code`, `settlement_bank_address`, `tax_registration_certificate`, `tax_registration_certificate_electronic`, `taxpayer_id`, `shop_name`, `apply_state`, `apply_message`, `apply_year`, `shop_type_name`, `shop_type_id`, `shop_group_name`, `shop_group_id`, `paying_money_certificate`, `paying_money_certificate_explain`, `paying_amount`, `recommend_uid`) VALUES
(2, 28, 1, 13, '赛尔互联网络科技有限公司', '', 1, 1, 8, '清华科技园', '', '1', 1, 0, '丁丁', '18500074454', '1341324@qq.com', '410927199810982235', 'upload/common/1555570413.png', 'upload/common/1555570416.png', 'upload/common/1555570419.png', '', '', '', '', '', '', '2314123', '1234', '1243', '4132', '', '', 1, '', '', '', '', '', '', '', '', '怪化猫', '2', '', 1, '普通店铺', 2, '电子商务', 2, '', '', '0.00', 0),
(3, 29, 1, 15, '312321312', '', 20, 229, 1961, '321321', '', '1', 1, 0, '321312', '18500074454', '591529183@qq.com', '410927198912101077', 'upload/common/1555658917.jpg', 'upload/common/1555658926.jpg', 'upload/common/1555658938.jpg', '', '', '', '', '', '', '32414321', '41234321', '41234213', '41234321', '', '', 1, '', '', '', '', '', '', '', '', '41234213', '2', '', 1, '普通店铺', 2, '电子商务', 2, '', '', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_bank_account`
--

CREATE TABLE IF NOT EXISTS `ns_shop_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) NOT NULL DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺提现账号' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_coin_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_coin_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币数量',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '增加或减少类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺购物币记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_express_address`
--

CREATE TABLE IF NOT EXISTS `ns_shop_express_address` (
  `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收货地址标记',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`express_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='物流地址' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_group`
--

CREATE TABLE IF NOT EXISTS `ns_shop_group` (
  `shop_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分组排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`shop_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='店铺分组表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ns_shop_group`
--

INSERT INTO `ns_shop_group` (`shop_group_id`, `group_name`, `group_sort`, `create_time`, `modify_time`) VALUES
(1, '蔬菜水果', 1, 1510027210, 1510294312),
(2, '电子商务', 2, 1510294324, 1510294324);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_navigation`
--

CREATE TABLE IF NOT EXISTS `ns_shop_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `align` int(11) NOT NULL DEFAULT '1' COMMENT '横向所在位置1 左  2  右',
  `nav_type` int(11) DEFAULT '1',
  `is_blank` int(11) DEFAULT '0',
  `template_name` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='店铺导航管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ns_shop_navigation`
--

INSERT INTO `ns_shop_navigation` (`nav_id`, `shop_id`, `nav_title`, `nav_url`, `type`, `sort`, `align`, `nav_type`, `is_blank`, `template_name`, `create_time`, `modify_time`) VALUES
(1, 0, '首页', '/index', 1, 1, 0, 0, 0, '首页', 1510132528, 1510903912),
(2, 0, '店铺街', '/shop/shopstreet', 1, 2, 0, 0, 0, '店铺街', 1510394265, 1510394265);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_navigation_template`
--

CREATE TABLE IF NOT EXISTS `ns_shop_navigation_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问路径',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `use_type` int(11) NOT NULL COMMENT '1 shop端 0wap端',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='导航 的 系统默认模板' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ns_shop_navigation_template`
--

INSERT INTO `ns_shop_navigation_template` (`template_id`, `template_name`, `template_url`, `is_use`, `use_type`, `create_time`) VALUES
(1, '首页', '/index', 1, 1, 1497706628),
(2, '限时折扣', '/index/discount', 1, 1, 1497706628),
(3, '品牌列表', '/goods/brandlist', 1, 1, 1497706628),
(4, '积分中心', '/goods/integralcenter', 1, 1, 1500717235),
(5, '店铺街', '/shop/shopstreet', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_order_account_records`
--

CREATE TABLE IF NOT EXISTS `ns_shop_order_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单项实际支付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品平台佣金比率',
  `shop_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺获取金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台获取金额',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否产生退款',
  `refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `shop_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺扣减余额',
  `platform_refund_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台扣减余额',
  `is_issue` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经结算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=655 COMMENT='店铺针对订单的金额分配' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_order_goods_return`
--

CREATE TABLE IF NOT EXISTS `ns_shop_order_goods_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单项id',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单项实付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成比率',
  `return_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '抽成时间',
  `remake` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单项的利润抽成记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_order_return`
--

CREATE TABLE IF NOT EXISTS `ns_shop_order_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实际付款金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台获取金额',
  `is_issue` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否发放  0未发放  1 已发放',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=655 COMMENT='店铺针对订单的金额分配' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_weixin_share`
--

CREATE TABLE IF NOT EXISTS `ns_shop_weixin_share` (
  `shop_id` int(11) NOT NULL,
  `goods_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享价格标示',
  `goods_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享内容',
  `shop_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享标题',
  `shop_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享主题',
  `shop_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享内容',
  `qrcode_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享主题',
  `qrcode_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享内容',
  `platform_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享标题',
  `platform_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享主题',
  `platform_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享内容',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺分享内容设置';

--
-- 转存表中的数据 `ns_shop_weixin_share`
--

INSERT INTO `ns_shop_weixin_share` (`shop_id`, `goods_param_1`, `goods_param_2`, `shop_param_1`, `shop_param_2`, `shop_param_3`, `qrcode_param_1`, `qrcode_param_2`, `platform_param_1`, `platform_param_2`, `platform_param_3`) VALUES
(0, '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ns_shop_withdraw`
--

CREATE TABLE IF NOT EXISTS `ns_shop_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `ask_for_date` int(11) NOT NULL DEFAULT '0' COMMENT '提现日期',
  `payment_date` int(11) NOT NULL DEFAULT '0' COMMENT '到账日期',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ns_supplier`
--

CREATE TABLE IF NOT EXISTS `ns_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商',
  `supplier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '供货商描述',
  `linkman_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `linkman_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `linkman_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='供货商表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_addons`
--

CREATE TABLE IF NOT EXISTS `sys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `has_addonslist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有插件列表',
  `content` text NOT NULL COMMENT '详情',
  `config_hook` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义配置文件钩子',
  `create_time` int(11) DEFAULT '0' COMMENT '安装时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=100 COMMENT='插件表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sys_addons`
--

INSERT INTO `sys_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `has_adminlist`, `has_addonslist`, `content`, `config_hook`, `create_time`) VALUES
(2, 'wxtemplatemsg', '微信模板消息', '微信模板消息', 1, '[]', 'niushop', '1.0', 0, 0, '', 'wxtemplatemsg', 1510210852);

-- --------------------------------------------------------

--
-- 表的结构 `sys_addons_weixin_template_msg`
--

CREATE TABLE IF NOT EXISTS `sys_addons_weixin_template_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sys_addons_weixin_template_msg`
--

INSERT INTO `sys_addons_weixin_template_msg` (`id`, `instance_id`, `template_no`, `template_id`, `title`, `is_enable`, `headtext`, `bottomtext`) VALUES
(1, 0, 'OPENTM203347141', '', '会员注册成功通知', 1, '恭喜，您已成功注册为会员！', '恭喜，您已成为会员，您将享受会员所有权利！'),
(2, 0, 'OPENTM200444240', '', '订单提交成功通知', 1, '亲！您已成功创建订单，点击进入完成付款。', '感谢您的支持，我们将为您提供更好的服务。'),
(3, 0, 'OPENTM201541214', '', '订单发货通知', 1, '亲，你的订单已发货', '请关注订单,注意查收'),
(4, 0, 'OPENTM200444326', '', '订单付款成功通知', 1, '亲！您的订单已成功付款。', ''),
(5, 0, 'OPENTM207103254', '', '退款申请', 1, '您已申请退款，我们将尽快处理您提交的退款申请。您可以在“退换货”中查看退款进度', '如您的退款有疑问，请联系我们的客服人员，帮助您解决处理！'),
(6, 0, 'OPENTM205986235', '', '退款结果通知', 1, '亲，您的退款已处理。', '如您还有疑问，请与客服人员联系。'),
(7, 0, 'OPENTM207292959', '', '提现申请提醒', 1, '亲，您的提现申请已提交', '我们将在1到3个工作日内处理完毕，请耐心等待。'),
(8, 0, 'OPENTM207292959', '', '提现审核结果通知', 1, '亲，您提现申请已通过', '我们将在1到3个工作日内处理完毕，请耐心等待。'),
(9, 0, 'OPENTM409846856', '', '申请通过通知', 1, '您的推广员申请已经通过', '如您还有疑问，请与客服人员联系。'),
(10, 0, 'OPENTM409846856', '', '下级申请通过通知', 1, '您的下级推广员申请已经通过', '如您还有疑问，请与客服人员联系。'),
(11, 0, 'OPENTM409846856', '', '下下级申请通过通知', 1, '您的下下级推广员申请已经通过', '如您还有疑问，请与客服人员联系。'),
(12, 0, 'OPENTM201010537', '', '本店分销订单提成通知', 1, '亲，您已成功分销出一笔订单，继续努力哦', ''),
(13, 0, 'OPENTM201010537', '', '下级分店分销订单提成通知', 1, '亲，您的下级推广员成功分销出一笔订单，继续努力哦', ''),
(14, 0, 'OPENTM201010537', '', '下下级分店分销订单提成通知', 1, '亲，您的下下级推广员成功分销出一笔订单，继续努力哦', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_album_class`
--

CREATE TABLE IF NOT EXISTS `sys_album_class` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='相册表' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `sys_album_class`
--

INSERT INTO `sys_album_class` (`album_id`, `shop_id`, `pid`, `album_name`, `album_cover`, `is_default`, `sort`, `create_time`) VALUES
(30, 0, 0, '默认相册', '0', 1, 1, 1497064831),
(32, 28, 0, '默认相册', '', 1, 0, 1555570489),
(33, 29, 0, '默认相册', '', 1, 0, 1555742949);

-- --------------------------------------------------------

--
-- 表的结构 `sys_album_picture`
--

CREATE TABLE IF NOT EXISTS `sys_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` int(11) DEFAULT '0' COMMENT '图片上传时间',
  `upload_type` int(11) DEFAULT '1' COMMENT '图片外链',
  `domain` varchar(255) DEFAULT '' COMMENT '图片外链',
  `bucket` varchar(255) DEFAULT '' COMMENT '存储空间名称',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sys_album_picture`
--

INSERT INTO `sys_album_picture` (`pic_id`, `shop_id`, `album_id`, `is_wide`, `pic_name`, `pic_tag`, `pic_cover`, `pic_size`, `pic_spec`, `pic_cover_big`, `pic_size_big`, `pic_spec_big`, `pic_cover_mid`, `pic_size_mid`, `pic_spec_mid`, `pic_cover_small`, `pic_size_small`, `pic_spec_small`, `pic_cover_micro`, `pic_size_micro`, `pic_spec_micro`, `upload_time`, `upload_type`, `domain`, `bucket`) VALUES
(5, 0, 32, 0, 'f603918fa0ec08fa0054f9a859ee3d6d55fbda6d1555570821', 'f603918fa0ec08fa0054f9a859ee3d6d55fbda6d', 'upload/goods/20190418/d42d0fd1cd281bd27c543fd192a6553c.jpg', '268,386', '268,386', 'upload/goods/20190418/b791f630679523b8ec1632920100af7e1.jpg', '700,700', '700,700', 'upload/goods/20190418/b791f630679523b8ec1632920100af7e2.jpg', '360,360', '360,360', 'upload/goods/20190418/b791f630679523b8ec1632920100af7e3.jpg', '240,240', '240,240', 'upload/goods/20190418/b791f630679523b8ec1632920100af7e4.jpg', '60,60', '60,60', 1555570822, 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_area`
--

CREATE TABLE IF NOT EXISTS `sys_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='全部区域表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `sys_area`
--

INSERT INTO `sys_area` (`area_id`, `area_name`, `sort`) VALUES
(1, '华东', 0),
(2, '华北', 0),
(3, '华南', 0),
(4, '华中', 0),
(5, '东北', 0),
(6, '西北', 0),
(7, '西南', 0),
(8, '港澳台', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_city`
--

CREATE TABLE IF NOT EXISTS `sys_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135 AUTO_INCREMENT=346 ;

--
-- 转存表中的数据 `sys_city`
--

INSERT INTO `sys_city` (`city_id`, `province_id`, `city_name`, `zipcode`, `sort`) VALUES
(1, 1, '北京市', '100000', 1),
(2, 2, '天津市', '100000', 0),
(3, 3, '石家庄市', '050000', 0),
(4, 3, '唐山市', '063000', 0),
(5, 3, '秦皇岛市', '066000', 0),
(6, 3, '邯郸市', '056000', 0),
(7, 3, '邢台市', '054000', 0),
(8, 3, '保定市', '071000', 0),
(9, 3, '张家口市', '075000', 0),
(10, 3, '承德市', '067000', 0),
(11, 3, '沧州市', '061000', 0),
(12, 3, '廊坊市', '065000', 0),
(13, 3, '衡水市', '053000', 0),
(14, 4, '太原市', '030000', 0),
(15, 4, '大同市', '037000', 0),
(16, 4, '阳泉市', '045000', 0),
(17, 4, '长治市', '046000', 0),
(18, 4, '晋城市', '048000', 0),
(19, 4, '朔州市', '036000', 0),
(20, 4, '晋中市', '030600', 0),
(21, 4, '运城市', '044000', 0),
(22, 4, '忻州市', '034000', 0),
(23, 4, '临汾市', '041000', 0),
(24, 4, '吕梁市', '030500', 0),
(25, 5, '呼和浩特市', '010000', 0),
(26, 5, '包头市', '014000', 0),
(27, 5, '乌海市', '016000', 0),
(28, 5, '赤峰市', '024000', 0),
(29, 5, '通辽市', '028000', 0),
(30, 5, '鄂尔多斯市', '010300', 0),
(31, 5, '呼伦贝尔市', '021000', 0),
(32, 5, '巴彦淖尔市', '014400', 0),
(33, 5, '乌兰察布市', '011800', 0),
(34, 5, '兴安盟', '137500', 0),
(35, 5, '锡林郭勒盟', '011100', 0),
(36, 5, '阿拉善盟', '016000', 0),
(37, 6, '沈阳市', '110000', 0),
(38, 6, '大连市', '116000', 0),
(39, 6, '鞍山市', '114000', 0),
(40, 6, '抚顺市', '113000', 0),
(41, 6, '本溪市', '117000', 0),
(42, 6, '丹东市', '118000', 0),
(43, 6, '锦州市', '121000', 0),
(44, 6, '营口市', '115000', 0),
(45, 6, '阜新市', '123000', 0),
(46, 6, '辽阳市', '111000', 0),
(47, 6, '盘锦市', '124000', 0),
(48, 6, '铁岭市', '112000', 0),
(49, 6, '朝阳市', '122000', 0),
(50, 6, '葫芦岛市', '125000', 0),
(51, 7, '长春市', '130000', 0),
(52, 7, '吉林市', '132000', 0),
(53, 7, '四平市', '136000', 0),
(54, 7, '辽源市', '136200', 0),
(55, 7, '通化市', '134000', 0),
(56, 7, '白山市', '134300', 0),
(57, 7, '松原市', '131100', 0),
(58, 7, '白城市', '137000', 0),
(59, 7, '延边朝鲜族自治州', '133000', 0),
(60, 8, '哈尔滨市', '150000', 0),
(61, 8, '齐齐哈尔市', '161000', 0),
(62, 8, '鸡西市', '158100', 0),
(63, 8, '鹤岗市', '154100', 0),
(64, 8, '双鸭山市', '155100', 0),
(65, 8, '大庆市', '163000', 0),
(66, 8, '伊春市', '152300', 0),
(67, 8, '佳木斯市', '154000', 0),
(68, 8, '七台河市', '154600', 0),
(69, 8, '牡丹江市', '157000', 0),
(70, 8, '黑河市', '164300', 0),
(71, 8, '绥化市', '152000', 0),
(72, 8, '大兴安岭地区', '165000', 0),
(73, 9, '上海市', '200000', 0),
(74, 10, '南京市', '210000', 0),
(75, 10, '无锡市', '214000', 0),
(76, 10, '徐州市', '221000', 0),
(77, 10, '常州市', '213000', 0),
(78, 10, '苏州市', '215000', 0),
(79, 10, '南通市', '226000', 0),
(80, 10, '连云港市', '222000', 0),
(81, 10, '淮安市', '223200', 0),
(82, 10, '盐城市', '224000', 0),
(83, 10, '扬州市', '225000', 0),
(84, 10, '镇江市', '212000', 0),
(85, 10, '泰州市', '225300', 0),
(86, 10, '宿迁市', '223800', 0),
(87, 11, '杭州市', '310000', 0),
(88, 11, '宁波市', '315000', 0),
(89, 11, '温州市', '325000', 0),
(90, 11, '嘉兴市', '314000', 0),
(91, 11, '湖州市', '313000', 0),
(92, 11, '绍兴市', '312000', 0),
(93, 11, '金华市', '321000', 0),
(94, 11, '衢州市', '324000', 0),
(95, 11, '舟山市', '316000', 0),
(96, 11, '台州市', '318000', 0),
(97, 11, '丽水市', '323000', 0),
(98, 12, '合肥市', '230000', 0),
(99, 12, '芜湖市', '241000', 0),
(100, 12, '蚌埠市', '233000', 0),
(101, 12, '淮南市', '232000', 0),
(102, 12, '马鞍山市', '243000', 0),
(103, 12, '淮北市', '235000', 0),
(104, 12, '铜陵市', '244000', 0),
(105, 12, '安庆市', '246000', 0),
(106, 12, '黄山市', '242700', 0),
(107, 12, '滁州市', '239000', 0),
(108, 12, '阜阳市', '236100', 0),
(109, 12, '宿州市', '234100', 0),
(110, 12, '巢湖市', '238000', 0),
(111, 12, '六安市', '237000', 0),
(112, 12, '亳州市', '236800', 0),
(113, 12, '池州市', '247100', 0),
(114, 12, '宣城市', '366000', 0),
(115, 13, '福州市', '350000', 0),
(116, 13, '厦门市', '361000', 0),
(117, 13, '莆田市', '351100', 0),
(118, 13, '三明市', '365000', 0),
(119, 13, '泉州市', '362000', 0),
(120, 13, '漳州市', '363000', 0),
(121, 13, '南平市', '353000', 0),
(122, 13, '龙岩市', '364000', 0),
(123, 13, '宁德市', '352100', 0),
(124, 14, '南昌市', '330000', 0),
(125, 14, '景德镇市', '333000', 0),
(126, 14, '萍乡市', '337000', 0),
(127, 14, '九江市', '332000', 0),
(128, 14, '新余市', '338000', 0),
(129, 14, '鹰潭市', '335000', 0),
(130, 14, '赣州市', '341000', 0),
(131, 14, '吉安市', '343000', 0),
(132, 14, '宜春市', '336000', 0),
(133, 14, '抚州市', '332900', 0),
(134, 14, '上饶市', '334000', 0),
(135, 15, '济南市', '250000', 0),
(136, 15, '青岛市', '266000', 0),
(137, 15, '淄博市', '255000', 0),
(138, 15, '枣庄市', '277100', 0),
(139, 15, '东营市', '257000', 0),
(140, 15, '烟台市', '264000', 0),
(141, 15, '潍坊市', '261000', 0),
(142, 15, '济宁市', '272100', 0),
(143, 15, '泰安市', '271000', 0),
(144, 15, '威海市', '265700', 0),
(145, 15, '日照市', '276800', 0),
(146, 15, '莱芜市', '271100', 0),
(147, 15, '临沂市', '276000', 0),
(148, 15, '德州市', '253000', 0),
(149, 15, '聊城市', '252000', 0),
(150, 15, '滨州市', '256600', 0),
(151, 15, '荷泽市', '255000', 0),
(152, 16, '郑州市', '450000', 0),
(153, 16, '开封市', '475000', 0),
(154, 16, '洛阳市', '471000', 0),
(155, 16, '平顶山市', '467000', 0),
(156, 16, '安阳市', '454900', 0),
(157, 16, '鹤壁市', '456600', 0),
(158, 16, '新乡市', '453000', 0),
(159, 16, '焦作市', '454100', 0),
(160, 16, '濮阳市', '457000', 0),
(161, 16, '许昌市', '461000', 0),
(162, 16, '漯河市', '462000', 0),
(163, 16, '三门峡市', '472000', 0),
(164, 16, '南阳市', '473000', 0),
(165, 16, '商丘市', '476000', 0),
(166, 16, '信阳市', '464000', 0),
(167, 16, '周口市', '466000', 0),
(168, 16, '驻马店市', '463000', 0),
(169, 17, '武汉市', '430000', 0),
(170, 17, '黄石市', '435000', 0),
(171, 17, '十堰市', '442000', 0),
(172, 17, '宜昌市', '443000', 0),
(173, 17, '襄樊市', '441000', 0),
(174, 17, '鄂州市', '436000', 0),
(175, 17, '荆门市', '448000', 0),
(176, 17, '孝感市', '432100', 0),
(177, 17, '荆州市', '434000', 0),
(178, 17, '黄冈市', '438000', 0),
(179, 17, '咸宁市', '437000', 0),
(180, 17, '随州市', '441300', 0),
(181, 17, '恩施土家族苗族自治州', '445000', 0),
(182, 17, '神农架', '442400', 0),
(183, 18, '长沙市', '410000', 0),
(184, 18, '株洲市', '412000', 0),
(185, 18, '湘潭市', '411100', 0),
(186, 18, '衡阳市', '421000', 0),
(187, 18, '邵阳市', '422000', 0),
(188, 18, '岳阳市', '414000', 0),
(189, 18, '常德市', '415000', 0),
(190, 18, '张家界市', '427000', 0),
(191, 18, '益阳市', '413000', 0),
(192, 18, '郴州市', '423000', 0),
(193, 18, '永州市', '425000', 0),
(194, 18, '怀化市', '418000', 0),
(195, 18, '娄底市', '417000', 0),
(196, 18, '湘西土家族苗族自治州', '416000', 0),
(197, 19, '广州市', '510000', 0),
(198, 19, '韶关市', '521000', 0),
(199, 19, '深圳市', '518000', 0),
(200, 19, '珠海市', '519000', 0),
(201, 19, '汕头市', '515000', 0),
(202, 19, '佛山市', '528000', 0),
(203, 19, '江门市', '529000', 0),
(204, 19, '湛江市', '524000', 0),
(205, 19, '茂名市', '525000', 0),
(206, 19, '肇庆市', '526000', 0),
(207, 19, '惠州市', '516000', 0),
(208, 19, '梅州市', '514000', 0),
(209, 19, '汕尾市', '516600', 1),
(210, 19, '河源市', '517000', 0),
(211, 19, '阳江市', '529500', 0),
(212, 19, '清远市', '511500', 0),
(213, 19, '东莞市', '511700', 0),
(214, 19, '中山市', '528400', 0),
(215, 19, '潮州市', '515600', 0),
(216, 19, '揭阳市', '522000', 0),
(217, 19, '云浮市', '527300', 0),
(218, 20, '南宁市', '530000', 0),
(219, 20, '柳州市', '545000', 0),
(220, 20, '桂林市', '541000', 0),
(221, 20, '梧州市', '543000', 0),
(222, 20, '北海市', '536000', 0),
(223, 20, '防城港市', '538000', 0),
(224, 20, '钦州市', '535000', 0),
(225, 20, '贵港市', '537100', 0),
(226, 20, '玉林市', '537000', 0),
(227, 20, '百色市', '533000', 0),
(228, 20, '贺州市', '542800', 0),
(229, 20, '河池市', '547000', 0),
(230, 20, '来宾市', '546100', 0),
(231, 20, '崇左市', '532200', 0),
(232, 21, '海口市', '570000', 0),
(233, 21, '三亚市', '572000', 0),
(234, 22, '重庆市', '400000', 0),
(235, 23, '成都市', '610000', 0),
(236, 23, '自贡市', '643000', 0),
(237, 23, '攀枝花市', '617000', 0),
(238, 23, '泸州市', '646100', 0),
(239, 23, '德阳市', '618000', 0),
(240, 23, '绵阳市', '621000', 0),
(241, 23, '广元市', '628000', 0),
(242, 23, '遂宁市', '629000', 0),
(243, 23, '内江市', '641000', 0),
(244, 23, '乐山市', '614000', 0),
(245, 23, '南充市', '637000', 0),
(246, 23, '眉山市', '612100', 0),
(247, 23, '宜宾市', '644000', 0),
(248, 23, '广安市', '638000', 0),
(249, 23, '达州市', '635000', 0),
(250, 23, '雅安市', '625000', 0),
(251, 23, '巴中市', '635500', 0),
(252, 23, '资阳市', '641300', 0),
(253, 23, '阿坝藏族羌族自治州', '624600', 0),
(254, 23, '甘孜藏族自治州', '626000', 0),
(255, 23, '凉山彝族自治州', '615000', 0),
(256, 24, '贵阳市', '55000', 0),
(257, 24, '六盘水市', '553000', 0),
(258, 24, '遵义市', '563000', 0),
(259, 24, '安顺市', '561000', 0),
(260, 24, '铜仁地区', '554300', 0),
(261, 24, '黔西南布依族苗族自治州', '551500', 0),
(262, 24, '毕节地区', '551700', 0),
(263, 24, '黔东南苗族侗族自治州', '551500', 0),
(264, 24, '黔南布依族苗族自治州', '550100', 0),
(265, 25, '昆明市', '650000', 0),
(266, 25, '曲靖市', '655000', 0),
(267, 25, '玉溪市', '653100', 0),
(268, 25, '保山市', '678000', 0),
(269, 25, '昭通市', '657000', 0),
(270, 25, '丽江市', '674100', 0),
(271, 25, '思茅市', '665000', 0),
(272, 25, '临沧市', '677000', 0),
(273, 25, '楚雄彝族自治州', '675000', 0),
(274, 25, '红河哈尼族彝族自治州', '654400', 0),
(275, 25, '文山壮族苗族自治州', '663000', 0),
(276, 25, '西双版纳傣族自治州', '666200', 0),
(277, 25, '大理白族自治州', '671000', 0),
(278, 25, '德宏傣族景颇族自治州', '678400', 0),
(279, 25, '怒江傈僳族自治州', '671400', 0),
(280, 25, '迪庆藏族自治州', '674400', 0),
(281, 26, '拉萨市', '850000', 0),
(282, 26, '昌都地区', '854000', 0),
(283, 26, '山南地区', '856000', 0),
(284, 26, '日喀则地区', '857000', 0),
(285, 26, '那曲地区', '852000', 0),
(286, 26, '阿里地区', '859100', 0),
(287, 26, '林芝地区', '860100', 0),
(288, 27, '西安市', '710000', 0),
(289, 27, '铜川市', '727000', 0),
(290, 27, '宝鸡市', '721000', 0),
(291, 27, '咸阳市', '712000', 0),
(292, 27, '渭南市', '714000', 0),
(293, 27, '延安市', '716000', 0),
(294, 27, '汉中市', '723000', 0),
(295, 27, '榆林市', '719000', 0),
(296, 27, '安康市', '725000', 0),
(297, 27, '商洛市', '711500', 0),
(298, 28, '兰州市', '730000', 0),
(299, 28, '嘉峪关市', '735100', 0),
(300, 28, '金昌市', '737100', 0),
(301, 28, '白银市', '730900', 0),
(302, 28, '天水市', '741000', 0),
(303, 28, '武威市', '733000', 0),
(304, 28, '张掖市', '734000', 0),
(305, 28, '平凉市', '744000', 0),
(306, 28, '酒泉市', '735000', 0),
(307, 28, '庆阳市', '744500', 0),
(308, 28, '定西市', '743000', 0),
(309, 28, '陇南市', '742100', 0),
(310, 28, '临夏回族自治州', '731100', 0),
(311, 28, '甘南藏族自治州', '747000', 0),
(312, 29, '西宁市', '810000', 0),
(313, 29, '海东地区', '810600', 0),
(314, 29, '海北藏族自治州', '810300', 0),
(315, 29, '黄南藏族自治州', '811300', 0),
(316, 29, '海南藏族自治州', '813000', 0),
(317, 29, '果洛藏族自治州', '814000', 0),
(318, 29, '玉树藏族自治州', '815000', 0),
(319, 29, '海西蒙古族藏族自治州', '817000', 0),
(320, 30, '银川市', '750000', 0),
(321, 30, '石嘴山市', '753000', 0),
(322, 30, '吴忠市', '751100', 0),
(323, 30, '固原市', '756000', 0),
(324, 30, '中卫市', '751700', 0),
(325, 31, '乌鲁木齐市', '830000', 0),
(326, 31, '克拉玛依市', '834000', 0),
(327, 31, '吐鲁番地区', '838000', 0),
(328, 31, '哈密地区', '839000', 0),
(329, 31, '昌吉回族自治州', '831100', 0),
(330, 31, '博尔塔拉蒙古自治州', '833400', 0),
(331, 31, '巴音郭楞蒙古自治州', '841000', 0),
(332, 31, '阿克苏地区', '843000', 0),
(333, 31, '克孜勒苏柯尔克孜自治州', '835600', 0),
(334, 31, '喀什地区', '844000', 0),
(335, 31, '和田地区', '848000', 0),
(336, 31, '伊犁哈萨克自治州', '833200', 0),
(337, 31, '塔城地区', '834700', 0),
(338, 31, '阿勒泰地区', '836500', 0),
(339, 31, '石河子市', '832000', 0),
(340, 31, '阿拉尔市', '843300', 0),
(341, 31, '图木舒克市', '843900', 0),
(342, 31, '五家渠市', '831300', 0),
(343, 32, '香港特别行政区', '000000', 0),
(344, 33, '澳门特别行政区', '000000', 0),
(345, 34, '台湾省', '000000', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表' AUTO_INCREMENT=771 ;

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`id`, `instance_id`, `key`, `value`, `desc`, `is_use`, `create_time`, `modify_time`) VALUES
(12, 0, 'USERNOTICE', '', '', 1, 1487830081, 1497102938),
(13, 0, 'HOTKEY', '[]', '', 1, 1487831749, 1510891513),
(14, 0, 'DEFAULTKEY', '""', '', 1, 1487831788, 1510387447),
(17, 0, 'QQLOGIN', '{"APP_KEY":"\\u7684\\u98ce\\u683c","APP_SECRET":"sdfsfsfsf","AUTHORIZE":"http:\\/\\/localhost","CALLBACK":"http:\\/\\/localhost\\/niushop_b2b2c_new\\/index.php\\/wap\\/login\\/callback"}', 'qq', 1, 1488350925, 1510134305),
(18, 0, 'WCHAT', '{"APP_KEY":"fgh","APP_SECRET":"ghj","AUTHORIZE":"http:\\/\\/localhost","CALLBACK":"http:\\/\\/localhost\\/niushop_b2b2c_new\\/index.php\\/wap\\/Login\\/callback"}', '微信', 1, 1488350947, 1510134300),
(21, 0, 'ALIPAY', '{"ali_partnerid":"25424","ali_seller":"54245","ali_key":"52542"}', '', 1, 1488442697, 1509614082),
(22, 0, 'EMAILMESSAGE', '{"email_host":"smtp.163.com","email_port":"465","email_addr":"88","email_id":"admin","email_pass":"123456","email_is_security":false}', '', 1, 1488524450, 1510372437),
(27, 0, 'WXOPENPLATFORM', '', '', 1, 1490845979, 1496903672),
(28, 0, 'LOGINVERIFYCODE', '{"platform":"1","admin":"1","pc":"1"}', '', 1, 1491014899, 1511598499),
(31, 0, 'COIN_CONFIG', '', '购物币现金转化关系', 1, 1492396593, 1496903672),
(38, 0, 'ORDER_BUY_CLOSE_TIME', '60', '订单自动关闭时间', 1, 1499391774, 1510644858),
(39, 0, 'ORDER_DELIVERY_COMPLETE_TIME', '0', '收货后多长时间自动完成', 1, 1499391779, 1510644858),
(40, 0, 'ORDER_AUTO_DELIVERY', '14', '订单多长时间自动完成', 1, 1499391781, 1510644857),
(41, 0, 'ORDER_BALANCE_PAY', '0', '是否开启余额支付', 1, 1499391784, 1510644857),
(42, 0, 'ORDER_INVOICE_TAX', '0', '发票税率', 1, 1499391786, 1510644858),
(43, 0, 'ORDER_INVOICE_CONTENT', '', '发票内容', 1, 1499391789, 1510644858),
(44, 0, 'ORDER_SHOW_BUY_RECORD', '0', '是否显示购买记录', 1, 1499391791, 1510644858),
(45, 0, 'SEO_TITLE', '佳家生活商城', '标题附加字', 1, 1496751194, 1555568069),
(46, 0, 'SEO_META', '佳家生活商城', '商城关键词', 1, 1496751194, 1555568069),
(47, 0, 'SEO_DESC', '佳家生活商城', '关键词描述', 1, 1496751194, 1555568069),
(48, 0, 'SEO_OTHER', '佳家生活商城', '其他页头信息', 1, 1496751194, 1555568069),
(107, 0, 'ORDER_DELIVERY_PAY', '0', '是否开启货到付款', 1, 1496825466, 1510644858),
(108, 0, 'WITHDRAW_BALANCE', '{"withdraw_cash_min":"100","withdraw_multiple":"1","withdraw_poundage":0,"withdraw_message":"\\u662f\\u5426\\u786e\\u8ba4\\u63d0\\u73b0"}', '会员余额提现设置', 1, 1496830716, 1555569472),
(109, 0, 'REGISTER_INTEGRAL', '1', '注册送积分', 1, 1496981877, 1509431860),
(111, 0, 'SHARE_INTEGRAL', '0', '分享送积分', 1, 1496981877, 1509431860),
(112, 0, 'SIGN_INTEGRAL', '1', '签到送积分', 1, 1496983370, 1509431860),
(116, 0, 'LOGINVERIFYCODE', '{"platform":"1","admin":"1","pc":"1"}', '', 1, 1497085371, 1511598499),
(122, 0, 'HOTKEY', '[]', '', 1, 1497087566, 1510891513),
(123, 0, 'DEFAULTKEY', '""', '', 1, 1497087582, 1510387447),
(125, 0, 'WPAY', '{"appid":"ddd","appkey":"dd","mch_id":"d","mch_key":"ddd"}', '', 1, 1497087123, 1510381945),
(127, 0, 'SHOPWCHAT', '{"appid":"11","appsecret":"22"}', '', 1, 1497088090, 1511251981),
(128, 0, 'BUYER_SELF_LIFTING', '0', '是否开启买家自提', 1, 1498730475, 1510644858),
(129, 0, 'ORDER_SELLER_DISPATCHING', '1', '是否开启商家配送', 1, 1498730475, 1510644858),
(130, 0, 'SHOPPING_BACK_POINTS', '1', '购物返积分设置', 1, 1498730475, 1510644858),
(136, 0, 'MOBILEMESSAGE', '{"appKey":"","secretKey":"","freeSignName":"","user_type":"1"}', '', 1, 1498894954, 1510209647),
(137, 0, 'REGISTERANDVISIT', '{"is_register":"1","register_info":"plain","name_keyword":"42","pwd_len":"6","pwd_complexity":"","is_requiretel":"1","terms_of_service":""}', '', 1, 1499310581, 1510213556),
(138, 0, 'SERVICE_ADDR', '{"service_addr":""}', '美洽客服链接地址设置', 0, 1508576044, 0),
(139, 0, 'ORDER_EXPRESS_MESSAGE', '{"appid":"","appkey":"","back_url":""}', '物流跟踪配置信息', 0, 1509328384, 1510222371),
(140, 0, 'ORDER_IS_LOGISTICS', '1', '是否允许选择物流', 1, 1509332537, 1510644858),
(141, 0, 'COPYRIGHT_LOGO', '', '版权logo', 1, 1509335724, 1555567689),
(142, 0, 'COPYRIGHT_META', '', '备案号', 1, 1509335724, 1555567689),
(143, 0, 'COPYRIGHT_LINK', 'http://yzg247.new.my', '版权链接', 1, 1509335724, 1555567689),
(144, 0, 'COPYRIGHT_DESC', '', '版权信息', 1, 1509335724, 1555567689),
(145, 0, 'COPYRIGHT_COMPANYNAME', '佳家生活商城', '公司名称', 1, 1509335725, 1555567689),
(146, 0, 'UPLOAD_TYPE', '1', '上传方式 1 本地  2 七牛', 1, 1509350605, 0),
(147, 0, 'IMG_THUMB', '{"thumb_type":"4","upload_size":"0","upload_ext":"gif,jpg,jpeg,bmp,png"}', 'thumb_type(缩略)  3 居中裁剪 2 缩放后填充 4 左上角裁剪 5 右下角裁剪 6 固定尺寸缩放', 1, 1509350605, 0),
(148, 0, 'QINIU_CONFIG', '{"Accesskey":"111","Secretkey":"222","Bucket":"333","QiniuUrl":"4444"}', '七牛云存储参数配置', 1, 1509353764, 0),
(149, 0, 'GOODS_CONFIG', '[]', '商品审核设置', 0, 1509504798, 0),
(150, 0, 'OPERATE_CONFIG', '{"is_discount_open":"1","is_discount_toExamine":"0","is_mansong_open":"0","is_mansong_toExamine":"0","is_groups_open":"0","is_groups_toExamine":"0","is_pickuPpoint_open":"0"}', '运营配置信息', 1, 1510133916, 1510133920),
(151, 0, 'SEO_TITLE', '佳家生活商城', '标题附加字', 1, 1510214503, 1555568069),
(152, 0, 'SEO_META', '佳家生活商城', '商城关键词', 1, 1510214503, 1555568069),
(153, 0, 'SEO_DESC', '佳家生活商城', '关键词描述', 1, 1510214503, 1555568069),
(154, 0, 'SEO_OTHER', '佳家生活商城', '其他页头信息', 1, 1510214503, 1555568069),
(155, 0, 'SERVICE_ADDR', '{"service_addr":""}', '美洽客服链接地址设置', 0, 1510214503, 0),
(156, 0, 'USE_WAP_TEMPLATE', 'default', '当前使用的手机端模板文件夹', 1, 1510216382, 1510216382),
(157, 0, 'IS_RECOMMEND', '{"is_recommend":""}', '首页商城促销版块显示设置', 0, 1510216383, 0),
(158, 0, 'IS_CATEGORY', '{"is_category":""}', '首页商品分类是否显示设置', 0, 1510216383, 0),
(159, 0, 'USE_PC_TEMPLATE', 'default', '当前使用的PC端模板文件夹', 1, 1510221578, 1510221578),
(207, 0, 'SEO_TITLE', '佳家生活商城', '标题附加字', 1, 1510221108, 1555568069),
(208, 0, 'SEO_META', '佳家生活商城', '商城关键词', 1, 1510221108, 1555568069),
(209, 0, 'SEO_DESC', '佳家生活商城', '关键词描述', 1, 1510221108, 1555568069),
(210, 0, 'SEO_OTHER', '佳家生活商城', '其他页头信息', 1, 1510221108, 1555568069),
(404, 24, 'REGISTER_INTEGRAL', '', '注册送积分', 1, 1510645134, 0),
(405, 24, 'SIGN_INTEGRAL', '', '签到送积分', 1, 1510645134, 0),
(406, 24, 'SHARE_INTEGRAL', '', '分享送积分', 1, 1510645134, 0),
(407, 0, 'SEO_TITLE', '佳家生活商城', '标题附加字', 1, 1510885322, 1555568069),
(408, 0, 'SEO_META', '佳家生活商城', '商城关键词', 1, 1510885322, 1555568069),
(409, 0, 'SEO_DESC', '佳家生活商城', '关键词描述', 1, 1510885322, 1555568069),
(410, 0, 'SEO_OTHER', '佳家生活商城', '其他页头信息', 1, 1510885322, 1555568069),
(756, 27, 'REGISTERANDVISIT', '{"is_register":"1","register_info":"plain","name_keyword":"","pwd_len":"5","pwd_complexity":"","terms_of_service":"","is_requiretel":0}', '', 1, 1555570311, 0),
(757, 27, 'SEO_TITLE', '', '标题附加字', 1, 1555580608, 0),
(758, 27, 'SEO_META', '', '商城关键词', 1, 1555580608, 0),
(759, 27, 'SEO_DESC', '', '关键词描述', 1, 1555580608, 0),
(760, 27, 'SEO_OTHER', '', '其他页头信息', 1, 1555580608, 0),
(761, 27, 'SERVICE_ADDR', '{"service_addr":""}', '美洽客服链接地址设置', 0, 1555583825, 0),
(762, 28, 'SEO_TITLE', '', '标题附加字', 1, 1555653819, 0),
(763, 28, 'SEO_META', '', '商城关键词', 1, 1555653819, 0),
(764, 28, 'SEO_DESC', '', '关键词描述', 1, 1555653819, 0),
(765, 28, 'SEO_OTHER', '', '其他页头信息', 1, 1555653819, 0),
(766, 28, 'REGISTERANDVISIT', '{"is_register":"1","register_info":"plain","name_keyword":"","pwd_len":"5","pwd_complexity":"","terms_of_service":"","is_requiretel":0}', '', 1, 1555657878, 0),
(767, 28, 'SERVICE_ADDR', '{"service_addr":""}', '美洽客服链接地址设置', 0, 1555748454, 0),
(768, 28, 'REGISTER_INTEGRAL', '', '注册送积分', 1, 1555753236, 0),
(769, 28, 'SIGN_INTEGRAL', '', '签到送积分', 1, 1555753236, 0),
(770, 28, 'SHARE_INTEGRAL', '', '分享送积分', 1, 1555753236, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_custom_template`
--

CREATE TABLE IF NOT EXISTS `sys_custom_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_name` varchar(250) DEFAULT NULL COMMENT '自定义模板名称（暂时预留）',
  `template_data` text NOT NULL COMMENT '模板数据（JSON格式）',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `modify_time` int(11) DEFAULT NULL COMMENT '修改时间戳',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 0 不启用 1 启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='手机端自定义模板' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_district`
--

CREATE TABLE IF NOT EXISTS `sys_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 AUTO_INCREMENT=2870 ;

--
-- 转存表中的数据 `sys_district`
--

INSERT INTO `sys_district` (`district_id`, `city_id`, `district_name`, `sort`) VALUES
(1, 1, '东城区', 0),
(2, 1, '西城区', 0),
(3, 1, '崇文区', 0),
(4, 1, '宣武区', 0),
(5, 1, '朝阳区', 0),
(6, 1, '丰台区', 0),
(7, 1, '石景山区', 0),
(8, 1, '海淀区', 0),
(9, 1, '门头沟区', 0),
(10, 1, '房山区', 0),
(11, 1, '通州区', 0),
(12, 1, '顺义区', 0),
(13, 1, '昌平区', 0),
(14, 1, '大兴区', 0),
(15, 1, '怀柔区', 0),
(16, 1, '平谷区', 0),
(17, 1, '密云县', 0),
(18, 1, '延庆县', 0),
(19, 2, '和平区', 0),
(20, 2, '河东区', 0),
(21, 2, '河西区', 0),
(22, 2, '南开区', 0),
(23, 2, '河北区', 0),
(24, 2, '红桥区', 0),
(25, 2, '塘沽区', 0),
(26, 2, '汉沽区', 0),
(27, 2, '大港区', 0),
(28, 2, '东丽区', 0),
(29, 2, '西青区', 0),
(30, 2, '津南区', 0),
(31, 2, '北辰区', 0),
(32, 2, '武清区', 0),
(33, 2, '宝坻区', 0),
(34, 2, '宁河县', 0),
(35, 2, '静海县', 0),
(36, 2, '蓟县', 0),
(37, 3, '长安区', 0),
(38, 3, '桥东区', 0),
(39, 3, '桥西区', 0),
(40, 3, '新华区', 0),
(41, 3, '井陉矿区', 0),
(42, 3, '裕华区', 0),
(43, 3, '井陉县', 0),
(44, 3, '正定县', 0),
(45, 3, '栾城县', 0),
(46, 3, '行唐县', 0),
(47, 3, '灵寿县', 0),
(48, 3, '高邑县', 0),
(49, 3, '深泽县', 0),
(50, 3, '赞皇县', 0),
(51, 3, '无极县', 0),
(52, 3, '平山县', 0),
(53, 3, '元氏县', 0),
(54, 3, '赵县', 0),
(55, 3, '辛集市', 0),
(56, 3, '藁城市', 0),
(57, 3, '晋州市', 0),
(58, 3, '新乐市', 0),
(59, 3, '鹿泉市', 0),
(60, 4, '路南区', 0),
(61, 4, '路北区', 0),
(62, 4, '古冶区', 0),
(63, 4, '开平区', 0),
(64, 4, '丰南区', 0),
(65, 4, '丰润区', 0),
(66, 4, '滦县', 0),
(67, 4, '滦南县', 0),
(68, 4, '乐亭县', 0),
(69, 4, '迁西县', 0),
(70, 4, '玉田县', 0),
(71, 4, '唐海县', 0),
(72, 4, '遵化市', 0),
(73, 4, '迁安市', 0),
(74, 5, '海港区', 0),
(75, 5, '山海关区', 0),
(76, 5, '北戴河区', 0),
(77, 5, '青龙满族自治县', 0),
(78, 5, '昌黎县', 0),
(79, 5, '抚宁县', 0),
(80, 5, '卢龙县', 0),
(81, 6, '邯山区', 0),
(82, 6, '丛台区', 0),
(83, 6, '复兴区', 0),
(84, 6, '峰峰矿区', 0),
(85, 6, '邯郸县', 0),
(86, 6, '临漳县', 0),
(87, 6, '成安县', 0),
(88, 6, '大名县', 0),
(89, 6, '涉县', 0),
(90, 6, '磁县', 0),
(91, 6, '肥乡县', 0),
(92, 6, '永年县', 0),
(93, 6, '邱县', 0),
(94, 6, '鸡泽县', 0),
(95, 6, '广平县', 0),
(96, 6, '馆陶县', 0),
(97, 6, '魏县', 0),
(98, 6, '曲周县', 0),
(99, 6, '武安市', 0),
(100, 7, '桥东区', 0),
(101, 7, '桥西区', 0),
(102, 7, '邢台县', 0),
(103, 7, '临城县', 0),
(104, 7, '内丘县', 0),
(105, 7, '柏乡县', 0),
(106, 7, '隆尧县', 0),
(107, 7, '任县', 0),
(108, 7, '南和县', 0),
(109, 7, '宁晋县', 0),
(110, 7, '巨鹿县', 0),
(111, 7, '新河县', 0),
(112, 7, '广宗县', 0),
(113, 7, '平乡县', 0),
(114, 7, '威县', 0),
(115, 7, '清河县', 0),
(116, 7, '临西县', 0),
(117, 7, '南宫市', 0),
(118, 7, '沙河市', 0),
(119, 8, '新市区', 0),
(120, 8, '北市区', 0),
(121, 8, '南市区', 0),
(122, 8, '满城县', 0),
(123, 8, '清苑县', 0),
(124, 8, '涞水县', 0),
(125, 8, '阜平县', 0),
(126, 8, '徐水县', 0),
(127, 8, '定兴县', 0),
(128, 8, '唐县', 0),
(129, 8, '高阳县', 0),
(130, 8, '容城县', 0),
(131, 8, '涞源县', 0),
(132, 8, '望都县', 0),
(133, 8, '安新县', 0),
(134, 8, '易县', 0),
(135, 8, '曲阳县', 0),
(136, 8, '蠡县', 0),
(137, 8, '顺平县', 0),
(138, 8, '博野县', 0),
(139, 8, '雄县', 0),
(140, 8, '涿州市', 0),
(141, 8, '定州市', 0),
(142, 8, '安国市', 0),
(143, 8, '高碑店市', 0),
(144, 9, '桥东区', 0),
(145, 9, '桥西区', 0),
(146, 9, '宣化区', 0),
(147, 9, '下花园区', 0),
(148, 9, '宣化县', 0),
(149, 9, '张北县', 0),
(150, 9, '康保县', 0),
(151, 9, '沽源县', 0),
(152, 9, '尚义县', 0),
(153, 9, '蔚县', 0),
(154, 9, '阳原县', 0),
(155, 9, '怀安县', 0),
(156, 9, '万全县', 0),
(157, 9, '怀来县', 0),
(158, 9, '涿鹿县', 0),
(159, 9, '赤城县', 0),
(160, 9, '崇礼县', 0),
(161, 10, '双桥区', 0),
(162, 10, '双滦区', 0),
(163, 10, '鹰手营子矿区', 0),
(164, 10, '承德县', 0),
(165, 10, '兴隆县', 0),
(166, 10, '平泉县', 0),
(167, 10, '滦平县', 0),
(168, 10, '隆化县', 0),
(169, 10, '丰宁满族自治县', 0),
(170, 10, '宽城满族自治县', 0),
(171, 10, '围场满族蒙古族自治县', 0),
(172, 11, '新华区', 0),
(173, 11, '运河区', 0),
(174, 11, '沧县', 0),
(175, 11, '青县', 0),
(176, 11, '东光县', 0),
(177, 11, '海兴县', 0),
(178, 11, '盐山县', 0),
(179, 11, '肃宁县', 0),
(180, 11, '南皮县', 0),
(181, 11, '吴桥县', 0),
(182, 11, '献县', 0),
(183, 11, '孟村回族自治县', 0),
(184, 11, '泊头市', 0),
(185, 11, '任丘市', 0),
(186, 11, '黄骅市', 0),
(187, 11, '河间市', 0),
(188, 12, '安次区', 0),
(189, 12, '广阳区', 0),
(190, 12, '固安县', 0),
(191, 12, '永清县', 0),
(192, 12, '香河县', 0),
(193, 12, '大城县', 0),
(194, 12, '文安县', 0),
(195, 12, '大厂回族自治县', 0),
(196, 12, '霸州市', 0),
(197, 12, '三河市', 0),
(198, 13, '桃城区', 0),
(199, 13, '枣强县', 0),
(200, 13, '武邑县', 0),
(201, 13, '武强县', 0),
(202, 13, '饶阳县', 0),
(203, 13, '安平县', 0),
(204, 13, '故城县', 0),
(205, 13, '景县', 0),
(206, 13, '阜城县', 0),
(207, 13, '冀州市', 0),
(208, 13, '深州市', 0),
(209, 14, '小店区', 0),
(210, 14, '迎泽区', 0),
(211, 14, '杏花岭区', 0),
(212, 14, '尖草坪区', 0),
(213, 14, '万柏林区', 0),
(214, 14, '晋源区', 0),
(215, 14, '清徐县', 0),
(216, 14, '阳曲县', 0),
(217, 14, '娄烦县', 0),
(218, 14, '古交市', 0),
(219, 15, '城区', 0),
(220, 15, '矿区', 0),
(221, 15, '南郊区', 0),
(222, 15, '新荣区', 0),
(223, 15, '阳高县', 0),
(224, 15, '天镇县', 0),
(225, 15, '广灵县', 0),
(226, 15, '灵丘县', 0),
(227, 15, '浑源县', 0),
(228, 15, '左云县', 0),
(229, 15, '大同县', 0),
(230, 16, '城区', 0),
(231, 16, '矿区', 0),
(232, 16, '郊区', 0),
(233, 16, '平定县', 0),
(234, 16, '盂县', 0),
(235, 17, '城区', 0),
(236, 17, '郊区', 0),
(237, 17, '长治县', 0),
(238, 17, '襄垣县', 0),
(239, 17, '屯留县', 0),
(240, 17, '平顺县', 0),
(241, 17, '黎城县', 0),
(242, 17, '壶关县', 0),
(243, 17, '长子县', 0),
(244, 17, '武乡县', 0),
(245, 17, '沁县', 0),
(246, 17, '沁源县', 0),
(247, 17, '潞城市', 0),
(248, 18, '城区', 0),
(249, 18, '沁水县', 0),
(250, 18, '阳城县', 0),
(251, 18, '陵川县', 0),
(252, 18, '泽州县', 0),
(253, 18, '高平市', 0),
(254, 19, '朔城区', 0),
(255, 19, '平鲁区', 0),
(256, 19, '山阴县', 0),
(257, 19, '应县', 0),
(258, 19, '右玉县', 0),
(259, 19, '怀仁县', 0),
(260, 20, '榆次区', 0),
(261, 20, '榆社县', 0),
(262, 20, '左权县', 0),
(263, 20, '和顺县', 0),
(264, 20, '昔阳县', 0),
(265, 20, '寿阳县', 0),
(266, 20, '太谷县', 0),
(267, 20, '祁县', 0),
(268, 20, '平遥县', 0),
(269, 20, '灵石县', 0),
(270, 20, '介休市', 0),
(271, 21, '盐湖区', 0),
(272, 21, '临猗县', 0),
(273, 21, '万荣县', 0),
(274, 21, '闻喜县', 0),
(275, 21, '稷山县', 0),
(276, 21, '新绛县', 0),
(277, 21, '绛县', 0),
(278, 21, '垣曲县', 0),
(279, 21, '夏县', 0),
(280, 21, '平陆县', 0),
(281, 21, '芮城县', 0),
(282, 21, '永济市', 0),
(283, 21, '河津市', 0),
(284, 22, '忻府区', 0),
(285, 22, '定襄县', 0),
(286, 22, '五台县', 0),
(287, 22, '代县', 0),
(288, 22, '繁峙县', 0),
(289, 22, '宁武县', 0),
(290, 22, '静乐县', 0),
(291, 22, '神池县', 0),
(292, 22, '五寨县', 0),
(293, 22, '岢岚县', 0),
(294, 22, '河曲县', 0),
(295, 22, '保德县', 0),
(296, 22, '偏关县', 0),
(297, 22, '原平市', 0),
(298, 23, '尧都区', 0),
(299, 23, '曲沃县', 0),
(300, 23, '翼城县', 0),
(301, 23, '襄汾县', 0),
(302, 23, '洪洞县', 0),
(303, 23, '古县', 0),
(304, 23, '安泽县', 0),
(305, 23, '浮山县', 0),
(306, 23, '吉县', 0),
(307, 23, '乡宁县', 0),
(308, 23, '大宁县', 0),
(309, 23, '隰县', 0),
(310, 23, '永和县', 0),
(311, 23, '蒲县', 0),
(312, 23, '汾西县', 0),
(313, 23, '侯马市', 0),
(314, 23, '霍州市', 0),
(315, 24, '离石区', 0),
(316, 24, '文水县', 0),
(317, 24, '交城县', 0),
(318, 24, '兴县', 0),
(319, 24, '临县', 0),
(320, 24, '柳林县', 0),
(321, 24, '石楼县', 0),
(322, 24, '岚县', 0),
(323, 24, '方山县', 0),
(324, 24, '中阳县', 0),
(325, 24, '交口县', 0),
(326, 24, '孝义市', 0),
(327, 24, '汾阳市', 0),
(328, 25, '新城区', 0),
(329, 25, '回民区', 0),
(330, 25, '玉泉区', 0),
(331, 25, '赛罕区', 0),
(332, 25, '土默特左旗', 0),
(333, 25, '托克托县', 0),
(334, 25, '和林格尔县', 0),
(335, 25, '清水河县', 0),
(336, 25, '武川县', 0),
(337, 26, '东河区', 0),
(338, 26, '昆都仑区', 0),
(339, 26, '青山区', 0),
(340, 26, '石拐区', 0),
(341, 26, '白云矿区', 0),
(342, 26, '九原区', 0),
(343, 26, '土默特右旗', 0),
(344, 26, '固阳县', 0),
(345, 26, '达尔罕茂明安联合旗', 0),
(346, 27, '海勃湾区', 0),
(347, 27, '海南区', 0),
(348, 27, '乌达区', 0),
(349, 28, '红山区', 0),
(350, 28, '元宝山区', 0),
(351, 28, '松山区', 0),
(352, 28, '阿鲁科尔沁旗', 0),
(353, 28, '巴林左旗', 0),
(354, 28, '巴林右旗', 0),
(355, 28, '林西县', 0),
(356, 28, '克什克腾旗', 0),
(357, 28, '翁牛特旗', 0),
(358, 28, '喀喇沁旗', 0),
(359, 28, '宁城县', 0),
(360, 28, '敖汉旗', 0),
(361, 29, '科尔沁区', 0),
(362, 29, '科尔沁左翼中旗', 0),
(363, 29, '科尔沁左翼后旗', 0),
(364, 29, '开鲁县', 0),
(365, 29, '库伦旗', 0),
(366, 29, '奈曼旗', 0),
(367, 29, '扎鲁特旗', 0),
(368, 29, '霍林郭勒市', 0),
(369, 30, '东胜区', 0),
(370, 30, '达拉特旗', 0),
(371, 30, '准格尔旗', 0),
(372, 30, '鄂托克前旗', 0),
(373, 30, '鄂托克旗', 0),
(374, 30, '杭锦旗', 0),
(375, 30, '乌审旗', 0),
(376, 30, '伊金霍洛旗', 0),
(377, 31, '海拉尔区', 0),
(378, 31, '阿荣旗', 0),
(379, 31, '莫力达瓦达斡尔族自治旗', 0),
(380, 31, '鄂伦春自治旗', 0),
(381, 31, '鄂温克族自治旗', 0),
(382, 31, '陈巴尔虎旗', 0),
(383, 31, '新巴尔虎左旗', 0),
(384, 31, '新巴尔虎右旗', 0),
(385, 31, '满洲里市', 0),
(386, 31, '牙克石市', 0),
(387, 31, '扎兰屯市', 0),
(388, 31, '额尔古纳市', 0),
(389, 31, '根河市', 0),
(390, 32, '临河区', 0),
(391, 32, '五原县', 0),
(392, 32, '磴口县', 0),
(393, 32, '乌拉特前旗', 0),
(394, 32, '乌拉特中旗', 0),
(395, 32, '乌拉特后旗', 0),
(396, 32, '杭锦后旗', 0),
(397, 33, '集宁区', 0),
(398, 33, '卓资县', 0),
(399, 33, '化德县', 0),
(400, 33, '商都县', 0),
(401, 33, '兴和县', 0),
(402, 33, '凉城县', 0),
(403, 33, '察哈尔右翼前旗', 0),
(404, 33, '察哈尔右翼中旗', 0),
(405, 33, '察哈尔右翼后旗', 0),
(406, 33, '四子王旗', 0),
(407, 33, '丰镇市', 0),
(408, 34, '乌兰浩特市', 0),
(409, 34, '阿尔山市', 0),
(410, 34, '科尔沁右翼前旗', 0),
(411, 34, '科尔沁右翼中旗', 0),
(412, 34, '扎赉特旗', 0),
(413, 34, '突泉县', 0),
(414, 35, '二连浩特市', 0),
(415, 35, '锡林浩特市', 0),
(416, 35, '阿巴嘎旗', 0),
(417, 35, '苏尼特左旗', 0),
(418, 35, '苏尼特右旗', 0),
(419, 35, '东乌珠穆沁旗', 0),
(420, 35, '西乌珠穆沁旗', 0),
(421, 35, '太仆寺旗', 0),
(422, 35, '镶黄旗', 0),
(423, 35, '正镶白旗', 0),
(424, 35, '正蓝旗', 0),
(425, 35, '多伦县', 0),
(426, 36, '阿拉善左旗', 0),
(427, 36, '阿拉善右旗', 0),
(428, 36, '额济纳旗', 0),
(429, 37, '和平区', 0),
(430, 37, '沈河区', 0),
(431, 37, '大东区', 0),
(432, 37, '皇姑区', 0),
(433, 37, '铁西区', 0),
(434, 37, '苏家屯区', 0),
(435, 37, '东陵区', 0),
(436, 37, '新城子区', 0),
(437, 37, '于洪区', 0),
(438, 37, '辽中县', 0),
(439, 37, '康平县', 0),
(440, 37, '法库县', 0),
(441, 37, '新民市', 0),
(442, 38, '中山区', 0),
(443, 38, '西岗区', 0),
(444, 38, '沙河口区', 0),
(445, 38, '甘井子区', 0),
(446, 38, '旅顺口区', 0),
(447, 38, '金州区', 0),
(448, 38, '长海县', 0),
(449, 38, '瓦房店市', 0),
(450, 38, '普兰店市', 0),
(451, 38, '庄河市', 0),
(452, 39, '铁东区', 0),
(453, 39, '铁西区', 0),
(454, 39, '立山区', 0),
(455, 39, '千山区', 0),
(456, 39, '台安县', 0),
(457, 39, '岫岩满族自治县', 0),
(458, 39, '海城市', 0),
(459, 40, '新抚区', 0),
(460, 40, '东洲区', 0),
(461, 40, '望花区', 0),
(462, 40, '顺城区', 0),
(463, 40, '抚顺县', 0),
(464, 40, '新宾满族自治县', 0),
(465, 40, '清原满族自治县', 0),
(466, 41, '平山区', 0),
(467, 41, '溪湖区', 0),
(468, 41, '明山区', 0),
(469, 41, '南芬区', 0),
(470, 41, '本溪满族自治县', 0),
(471, 41, '桓仁满族自治县', 0),
(472, 42, '元宝区', 0),
(473, 42, '振兴区', 0),
(474, 42, '振安区', 0),
(475, 42, '宽甸满族自治县', 0),
(476, 42, '东港市', 0),
(477, 42, '凤城市', 0),
(478, 43, '古塔区', 0),
(479, 43, '凌河区', 0),
(480, 43, '太和区', 0),
(481, 43, '黑山县', 0),
(482, 43, '义县', 0),
(483, 43, '凌海市', 0),
(484, 43, '北宁市', 0),
(485, 44, '站前区', 0),
(486, 44, '西市区', 0),
(487, 44, '鲅鱼圈区', 0),
(488, 44, '老边区', 0),
(489, 44, '盖州市', 0),
(490, 44, '大石桥市', 0),
(491, 45, '海州区', 0),
(492, 45, '新邱区', 0),
(493, 45, '太平区', 0),
(494, 45, '清河门区', 0),
(495, 45, '细河区', 0),
(496, 45, '阜新蒙古族自治县', 0),
(497, 45, '彰武县', 0),
(498, 46, '白塔区', 0),
(499, 46, '文圣区', 0),
(500, 46, '宏伟区', 0),
(501, 46, '弓长岭区', 0),
(502, 46, '太子河区', 0),
(503, 46, '辽阳县', 0),
(504, 46, '灯塔市', 0),
(505, 47, '双台子区', 0),
(506, 47, '兴隆台区', 0),
(507, 47, '大洼县', 0),
(508, 47, '盘山县', 0),
(509, 48, '银州区', 0),
(510, 48, '清河区', 0),
(511, 48, '铁岭县', 0),
(512, 48, '西丰县', 0),
(513, 48, '昌图县', 0),
(514, 48, '调兵山市', 0),
(515, 48, '开原市', 0),
(516, 49, '双塔区', 0),
(517, 49, '龙城区', 0),
(518, 49, '朝阳县', 0),
(519, 49, '建平县', 0),
(520, 49, '喀喇沁左翼蒙古族自治县', 0),
(521, 49, '北票市', 0),
(522, 49, '凌源市', 0),
(523, 50, '连山区', 0),
(524, 50, '龙港区', 0),
(525, 50, '南票区', 0),
(526, 50, '绥中县', 0),
(527, 50, '建昌县', 0),
(528, 50, '兴城市', 0),
(529, 51, '南关区', 0),
(530, 51, '宽城区', 0),
(531, 51, '朝阳区', 0),
(532, 51, '二道区', 0),
(533, 51, '绿园区', 0),
(534, 51, '双阳区', 0),
(535, 51, '农安县', 0),
(536, 51, '九台市', 0),
(537, 51, '榆树市', 0),
(538, 51, '德惠市', 0),
(539, 52, '昌邑区', 0),
(540, 52, '龙潭区', 0),
(541, 52, '船营区', 0),
(542, 52, '丰满区', 0),
(543, 52, '永吉县', 0),
(544, 52, '蛟河市', 0),
(545, 52, '桦甸市', 0),
(546, 52, '舒兰市', 0),
(547, 52, '磐石市', 0),
(548, 53, '铁西区', 0),
(549, 53, '铁东区', 0),
(550, 53, '梨树县', 0),
(551, 53, '伊通满族自治县', 0),
(552, 53, '公主岭市', 0),
(553, 53, '双辽市', 0),
(554, 54, '龙山区', 0),
(555, 54, '西安区', 0),
(556, 54, '东丰县', 0),
(557, 54, '东辽县', 0),
(558, 55, '东昌区', 0),
(559, 55, '二道江区', 0),
(560, 55, '通化县', 0),
(561, 55, '辉南县', 0),
(562, 55, '柳河县', 0),
(563, 55, '梅河口市', 0),
(564, 55, '集安市', 0),
(565, 56, '八道江区', 0),
(566, 56, '抚松县', 0),
(567, 56, '靖宇县', 0),
(568, 56, '长白朝鲜族自治县', 0),
(569, 56, '江源县', 0),
(570, 56, '临江市', 0),
(571, 57, '宁江区', 0),
(572, 57, '前郭尔罗斯蒙古族自治县', 0),
(573, 57, '长岭县', 0),
(574, 57, '乾安县', 0),
(575, 57, '扶余县', 0),
(576, 58, '洮北区', 0),
(577, 58, '镇赉县', 0),
(578, 58, '通榆县', 0),
(579, 58, '洮南市', 0),
(580, 58, '大安市', 0),
(581, 59, '延吉市', 0),
(582, 59, '图们市', 0),
(583, 59, '敦化市', 0),
(584, 59, '珲春市', 0),
(585, 59, '龙井市', 0),
(586, 59, '和龙市', 0),
(587, 59, '汪清县', 0),
(588, 59, '安图县', 0),
(589, 60, '道里区', 0),
(590, 60, '南岗区', 0),
(591, 60, '道外区', 0),
(592, 60, '香坊区', 0),
(593, 60, '动力区', 0),
(594, 60, '平房区', 0),
(595, 60, '松北区', 0),
(596, 60, '呼兰区', 0),
(597, 60, '依兰县', 0),
(598, 60, '方正县', 0),
(599, 60, '宾县', 0),
(600, 60, '巴彦县', 0),
(601, 60, '木兰县', 0),
(602, 60, '通河县', 0),
(603, 60, '延寿县', 0),
(604, 60, '阿城市', 0),
(605, 60, '双城市', 0),
(606, 60, '尚志市', 0),
(607, 60, '五常市', 0),
(608, 61, '龙沙区', 0),
(609, 61, '建华区', 0),
(610, 61, '铁锋区', 0),
(611, 61, '昂昂溪区', 0),
(612, 61, '富拉尔基区', 0),
(613, 61, '碾子山区', 0),
(614, 61, '梅里斯达斡尔族区', 0),
(615, 61, '龙江县', 0),
(616, 61, '依安县', 0),
(617, 61, '泰来县', 0),
(618, 61, '甘南县', 0),
(619, 61, '富裕县', 0),
(620, 61, '克山县', 0),
(621, 61, '克东县', 0),
(622, 61, '拜泉县', 0),
(623, 61, '讷河市', 0),
(624, 62, '鸡冠区', 0),
(625, 62, '恒山区', 0),
(626, 62, '滴道区', 0),
(627, 62, '梨树区', 0),
(628, 62, '城子河区', 0),
(629, 62, '麻山区', 0),
(630, 62, '鸡东县', 0),
(631, 62, '虎林市', 0),
(632, 62, '密山市', 0),
(633, 63, '向阳区', 0),
(634, 63, '工农区', 0),
(635, 63, '南山区', 0),
(636, 63, '兴安区', 0),
(637, 63, '东山区', 0),
(638, 63, '兴山区', 0),
(639, 63, '萝北县', 0),
(640, 63, '绥滨县', 0),
(641, 64, '尖山区', 0),
(642, 64, '岭东区', 0),
(643, 64, '四方台区', 0),
(644, 64, '宝山区', 0),
(645, 64, '集贤县', 0),
(646, 64, '友谊县', 0),
(647, 64, '宝清县', 0),
(648, 64, '饶河县', 0),
(649, 65, '萨尔图区', 0),
(650, 65, '龙凤区', 0),
(651, 65, '让胡路区', 0),
(652, 65, '红岗区', 0),
(653, 65, '大同区', 0),
(654, 65, '肇州县', 0),
(655, 65, '肇源县', 0),
(656, 65, '林甸县', 0),
(657, 65, '杜尔伯特蒙古族自治县', 0),
(658, 66, '伊春区', 0),
(659, 66, '南岔区', 0),
(660, 66, '友好区', 0),
(661, 66, '西林区', 0),
(662, 66, '翠峦区', 0),
(663, 66, '新青区', 0),
(664, 66, '美溪区', 0),
(665, 66, '金山屯区', 0),
(666, 66, '五营区', 0),
(667, 66, '乌马河区', 0),
(668, 66, '汤旺河区', 0),
(669, 66, '带岭区', 0),
(670, 66, '乌伊岭区', 0),
(671, 66, '红星区', 0),
(672, 66, '上甘岭区', 0),
(673, 66, '嘉荫县', 0),
(674, 66, '铁力市', 0),
(675, 67, '永红区', 0),
(676, 67, '向阳区', 0),
(677, 67, '前进区', 0),
(678, 67, '东风区', 0),
(679, 67, '郊区', 0),
(680, 67, '桦南县', 0),
(681, 67, '桦川县', 0),
(682, 67, '汤原县', 0),
(683, 67, '抚远县', 0),
(684, 67, '同江市', 0),
(685, 67, '富锦市', 0),
(686, 68, '新兴区', 0),
(687, 68, '桃山区', 0),
(688, 68, '茄子河区', 0),
(689, 68, '勃利县', 0),
(690, 69, '东安区', 0),
(691, 69, '阳明区', 0),
(692, 69, '爱民区', 0),
(693, 69, '西安区', 0),
(694, 69, '东宁县', 0),
(695, 69, '林口县', 0),
(696, 69, '绥芬河市', 0),
(697, 69, '海林市', 0),
(698, 69, '宁安市', 0),
(699, 69, '穆棱市', 0),
(700, 70, '爱辉区', 0),
(701, 70, '嫩江县', 0),
(702, 70, '逊克县', 0),
(703, 70, '孙吴县', 0),
(704, 70, '北安市', 0),
(705, 70, '五大连池市', 0),
(706, 71, '北林区', 0),
(707, 71, '望奎县', 0),
(708, 71, '兰西县', 0),
(709, 71, '青冈县', 0),
(710, 71, '庆安县', 0),
(711, 71, '明水县', 0),
(712, 71, '绥棱县', 0),
(713, 71, '安达市', 0),
(714, 71, '肇东市', 0),
(715, 71, '海伦市', 0),
(716, 72, '呼玛县', 0),
(717, 72, '塔河县', 0),
(718, 72, '漠河县', 0),
(719, 73, '黄浦区', 0),
(720, 73, '卢湾区', 0),
(721, 73, '徐汇区', 0),
(722, 73, '长宁区', 0),
(723, 73, '静安区', 0),
(724, 73, '普陀区', 0),
(725, 73, '闸北区', 0),
(726, 73, '虹口区', 0),
(727, 73, '杨浦区', 0),
(728, 73, '闵行区', 0),
(729, 73, '宝山区', 0),
(730, 73, '嘉定区', 0),
(731, 73, '浦东新区', 0),
(732, 73, '金山区', 0),
(733, 73, '松江区', 0),
(734, 73, '青浦区', 0),
(735, 73, '南汇区', 0),
(736, 73, '奉贤区', 0),
(737, 73, '崇明县', 0),
(738, 74, '玄武区', 0),
(739, 74, '白下区', 0),
(740, 74, '秦淮区', 0),
(741, 74, '建邺区', 0),
(742, 74, '鼓楼区', 0),
(743, 74, '下关区', 0),
(744, 74, '浦口区', 0),
(745, 74, '栖霞区', 0),
(746, 74, '雨花台区', 0),
(747, 74, '江宁区', 0),
(748, 74, '六合区', 0),
(749, 74, '溧水县', 0),
(750, 74, '高淳县', 0),
(751, 75, '崇安区', 0),
(752, 75, '南长区', 0),
(753, 75, '北塘区', 0),
(754, 75, '锡山区', 0),
(755, 75, '惠山区', 0),
(756, 75, '滨湖区', 0),
(757, 75, '江阴市', 0),
(758, 75, '宜兴市', 0),
(759, 76, '鼓楼区', 0),
(760, 76, '云龙区', 0),
(761, 76, '九里区', 0),
(762, 76, '贾汪区', 0),
(763, 76, '泉山区', 0),
(764, 76, '丰县', 0),
(765, 76, '沛县', 0),
(766, 76, '铜山县', 0),
(767, 76, '睢宁县', 0),
(768, 76, '新沂市', 0),
(769, 76, '邳州市', 0),
(770, 77, '天宁区', 0),
(771, 77, '钟楼区', 0),
(772, 77, '戚墅堰区', 0),
(773, 77, '新北区', 0),
(774, 77, '武进区', 0),
(775, 77, '溧阳市', 0),
(776, 77, '金坛市', 0),
(777, 78, '沧浪区', 0),
(778, 78, '平江区', 0),
(779, 78, '金阊区', 0),
(780, 78, '虎丘区', 0),
(781, 78, '吴中区', 0),
(782, 78, '相城区', 0),
(783, 78, '常熟市', 0),
(784, 78, '张家港市', 0),
(785, 78, '昆山市', 0),
(786, 78, '吴江市', 0),
(787, 78, '太仓市', 0),
(788, 79, '崇川区', 0),
(789, 79, '港闸区', 0),
(790, 79, '海安县', 0),
(791, 79, '如东县', 0),
(792, 79, '启东市', 0),
(793, 79, '如皋市', 0),
(794, 79, '通州市', 0),
(795, 79, '海门市', 0),
(796, 80, '连云区', 0),
(797, 80, '新浦区', 0),
(798, 80, '海州区', 0),
(799, 80, '赣榆县', 0),
(800, 80, '东海县', 0),
(801, 80, '灌云县', 0),
(802, 80, '灌南县', 0),
(803, 81, '清河区', 0),
(804, 81, '楚州区', 0),
(805, 81, '淮阴区', 0),
(806, 81, '清浦区', 0),
(807, 81, '涟水县', 0),
(808, 81, '洪泽县', 0),
(809, 81, '盱眙县', 0),
(810, 81, '金湖县', 0),
(811, 82, '亭湖区', 0),
(812, 82, '盐都区', 0),
(813, 82, '响水县', 0),
(814, 82, '滨海县', 0),
(815, 82, '阜宁县', 0),
(816, 82, '射阳县', 0),
(817, 82, '建湖县', 0),
(818, 82, '东台市', 0),
(819, 82, '大丰市', 0),
(820, 83, '广陵区', 0),
(821, 83, '邗江区', 0),
(822, 83, '维扬区', 0),
(823, 83, '宝应县', 0),
(824, 83, '仪征市', 0),
(825, 83, '高邮市', 0),
(826, 83, '江都市', 0),
(827, 84, '京口区', 0),
(828, 84, '润州区', 0),
(829, 84, '丹徒区', 0),
(830, 84, '丹阳市', 0),
(831, 84, '扬中市', 0),
(832, 84, '句容市', 0),
(833, 85, '海陵区', 0),
(834, 85, '高港区', 0),
(835, 85, '兴化市', 0),
(836, 85, '靖江市', 0),
(837, 85, '泰兴市', 0),
(838, 85, '姜堰市', 0),
(839, 86, '宿城区', 0),
(840, 86, '宿豫区', 0),
(841, 86, '沭阳县', 0),
(842, 86, '泗阳县', 0),
(843, 86, '泗洪县', 0),
(844, 87, '上城区', 0),
(845, 87, '下城区', 0),
(846, 87, '江干区', 0),
(847, 87, '拱墅区', 0),
(848, 87, '西湖区', 0),
(849, 87, '滨江区', 0),
(850, 87, '萧山区', 0),
(851, 87, '余杭区', 0),
(852, 87, '桐庐县', 0),
(853, 87, '淳安县', 0),
(854, 87, '建德市', 0),
(855, 87, '富阳市', 0),
(856, 87, '临安市', 0),
(857, 88, '海曙区', 0),
(858, 88, '江东区', 0),
(859, 88, '江北区', 0),
(860, 88, '北仑区', 0),
(861, 88, '镇海区', 0),
(862, 88, '鄞州区', 0),
(863, 88, '象山县', 0),
(864, 88, '宁海县', 0),
(865, 88, '余姚市', 0),
(866, 88, '慈溪市', 0),
(867, 88, '奉化市', 0),
(868, 89, '鹿城区', 0),
(869, 89, '龙湾区', 0),
(870, 89, '瓯海区', 0),
(871, 89, '洞头县', 0),
(872, 89, '永嘉县', 0),
(873, 89, '平阳县', 0),
(874, 89, '苍南县', 0),
(875, 89, '文成县', 0),
(876, 89, '泰顺县', 0),
(877, 89, '瑞安市', 0),
(878, 89, '乐清市', 0),
(879, 90, '秀城区', 0),
(880, 90, '秀洲区', 0),
(881, 90, '嘉善县', 0),
(882, 90, '海盐县', 0),
(883, 90, '海宁市', 0),
(884, 90, '平湖市', 0),
(885, 90, '桐乡市', 0),
(886, 91, '吴兴区', 0),
(887, 91, '南浔区', 0),
(888, 91, '德清县', 0),
(889, 91, '长兴县', 0),
(890, 91, '安吉县', 0),
(891, 92, '越城区', 0),
(892, 92, '绍兴县', 0),
(893, 92, '新昌县', 0),
(894, 92, '诸暨市', 0),
(895, 92, '上虞市', 0),
(896, 92, '嵊州市', 0),
(897, 93, '婺城区', 0),
(898, 93, '金东区', 0),
(899, 93, '武义县', 0),
(900, 93, '浦江县', 0),
(901, 93, '磐安县', 0),
(902, 93, '兰溪市', 0),
(903, 93, '义乌市', 0),
(904, 93, '东阳市', 0),
(905, 93, '永康市', 0),
(906, 94, '柯城区', 0),
(907, 94, '衢江区', 0),
(908, 94, '常山县', 0),
(909, 94, '开化县', 0),
(910, 94, '龙游县', 0),
(911, 94, '江山市', 0),
(912, 95, '定海区', 0),
(913, 95, '普陀区', 0),
(914, 95, '岱山县', 0),
(915, 95, '嵊泗县', 0),
(916, 96, '椒江区', 0),
(917, 96, '黄岩区', 0),
(918, 96, '路桥区', 0),
(919, 96, '玉环县', 0),
(920, 96, '三门县', 0),
(921, 96, '天台县', 0),
(922, 96, '仙居县', 0),
(923, 96, '温岭市', 0),
(924, 96, '临海市', 0),
(925, 97, '莲都区', 0),
(926, 97, '青田县', 0),
(927, 97, '缙云县', 0),
(928, 97, '遂昌县', 0),
(929, 97, '松阳县', 0),
(930, 97, '云和县', 0),
(931, 97, '庆元县', 0),
(932, 97, '景宁畲族自治县', 0),
(933, 97, '龙泉市', 0),
(934, 98, '瑶海区', 0),
(935, 98, '庐阳区', 0),
(936, 98, '蜀山区', 0),
(937, 98, '包河区', 0),
(938, 98, '长丰县', 0),
(939, 98, '肥东县', 0),
(940, 98, '肥西县', 0),
(941, 99, '镜湖区', 0),
(942, 99, '马塘区', 0),
(943, 99, '新芜区', 0),
(944, 99, '鸠江区', 0),
(945, 99, '芜湖县', 0),
(946, 99, '繁昌县', 0),
(947, 99, '南陵县', 0),
(948, 100, '龙子湖区', 0),
(949, 100, '蚌山区', 0),
(950, 100, '禹会区', 0),
(951, 100, '淮上区', 0),
(952, 100, '怀远县', 0),
(953, 100, '五河县', 0),
(954, 100, '固镇县', 0),
(955, 101, '大通区', 0),
(956, 101, '田家庵区', 0),
(957, 101, '谢家集区', 0),
(958, 101, '八公山区', 0),
(959, 101, '潘集区', 0),
(960, 101, '凤台县', 0),
(961, 102, '金家庄区', 0),
(962, 102, '花山区', 0),
(963, 102, '雨山区', 0),
(964, 102, '当涂县', 0),
(965, 103, '杜集区', 0),
(966, 103, '相山区', 0),
(967, 103, '烈山区', 0),
(968, 103, '濉溪县', 0),
(969, 104, '铜官山区', 0),
(970, 104, '狮子山区', 0),
(971, 104, '郊区', 0),
(972, 104, '铜陵县', 0),
(973, 105, '迎江区', 0),
(974, 105, '大观区', 0),
(975, 105, '郊区', 0),
(976, 105, '怀宁县', 0),
(977, 105, '枞阳县', 0),
(978, 105, '潜山县', 0),
(979, 105, '太湖县', 0),
(980, 105, '宿松县', 0),
(981, 105, '望江县', 0),
(982, 105, '岳西县', 0),
(983, 105, '桐城市', 0),
(984, 106, '屯溪区', 0),
(985, 106, '黄山区', 0),
(986, 106, '徽州区', 0),
(987, 106, '歙县', 0),
(988, 106, '休宁县', 0),
(989, 106, '黟县', 0),
(990, 106, '祁门县', 0),
(991, 107, '琅琊区', 0),
(992, 107, '南谯区', 0),
(993, 107, '来安县', 0),
(994, 107, '全椒县', 0),
(995, 107, '定远县', 0),
(996, 107, '凤阳县', 0),
(997, 107, '天长市', 0),
(998, 107, '明光市', 0),
(999, 108, '颍州区', 0),
(1000, 108, '颍东区', 0),
(1001, 108, '颍泉区', 0),
(1002, 108, '临泉县', 0),
(1003, 108, '太和县', 0),
(1004, 108, '阜南县', 0),
(1005, 108, '颍上县', 0),
(1006, 108, '界首市', 0),
(1007, 109, '埇桥区', 0),
(1008, 109, '砀山县', 0),
(1009, 109, '萧县', 0),
(1010, 109, '灵璧县', 0),
(1011, 109, '泗县', 0),
(1012, 110, '居巢区', 0),
(1013, 110, '庐江县', 0),
(1014, 110, '无为县', 0),
(1015, 110, '含山县', 0),
(1016, 110, '和县', 0),
(1017, 111, '金安区', 0),
(1018, 111, '裕安区', 0),
(1019, 111, '寿县', 0),
(1020, 111, '霍邱县', 0),
(1021, 111, '舒城县', 0),
(1022, 111, '金寨县', 0),
(1023, 111, '霍山县', 0),
(1024, 112, '谯城区', 0),
(1025, 112, '涡阳县', 0),
(1026, 112, '蒙城县', 0),
(1027, 112, '利辛县', 0),
(1028, 113, '贵池区', 0),
(1029, 113, '东至县', 0),
(1030, 113, '石台县', 0),
(1031, 113, '青阳县', 0),
(1032, 114, '宣州区', 0),
(1033, 114, '郎溪县', 0),
(1034, 114, '广德县', 0),
(1035, 114, '泾县', 0),
(1036, 114, '绩溪县', 0),
(1037, 114, '旌德县', 0),
(1038, 114, '宁国市', 0),
(1039, 115, '鼓楼区', 0),
(1040, 115, '台江区', 0),
(1041, 115, '仓山区', 0),
(1042, 115, '马尾区', 0),
(1043, 115, '晋安区', 0),
(1044, 115, '闽侯县', 0),
(1045, 115, '连江县', 0),
(1046, 115, '罗源县', 0),
(1047, 115, '闽清县', 0),
(1048, 115, '永泰县', 0),
(1049, 115, '平潭县', 0),
(1050, 115, '福清市', 0),
(1051, 115, '长乐市', 0),
(1052, 116, '思明区', 0),
(1053, 116, '海沧区', 0),
(1054, 116, '湖里区', 0),
(1055, 116, '集美区', 0),
(1056, 116, '同安区', 0),
(1057, 116, '翔安区', 0),
(1058, 117, '城厢区', 0),
(1059, 117, '涵江区', 0),
(1060, 117, '荔城区', 0),
(1061, 117, '秀屿区', 0),
(1062, 117, '仙游县', 0),
(1063, 118, '梅列区', 0),
(1064, 118, '三元区', 0),
(1065, 118, '明溪县', 0),
(1066, 118, '清流县', 0),
(1067, 118, '宁化县', 0),
(1068, 118, '大田县', 0),
(1069, 118, '尤溪县', 0),
(1070, 118, '沙县', 0),
(1071, 118, '将乐县', 0),
(1072, 118, '泰宁县', 0),
(1073, 118, '建宁县', 0),
(1074, 118, '永安市', 0),
(1075, 119, '鲤城区', 0),
(1076, 119, '丰泽区', 0),
(1077, 119, '洛江区', 0),
(1078, 119, '泉港区', 0),
(1079, 119, '惠安县', 0),
(1080, 119, '安溪县', 0),
(1081, 119, '永春县', 0),
(1082, 119, '德化县', 0),
(1083, 119, '金门县', 0),
(1084, 119, '石狮市', 0),
(1085, 119, '晋江市', 0),
(1086, 119, '南安市', 0),
(1087, 120, '芗城区', 0),
(1088, 120, '龙文区', 0),
(1089, 120, '云霄县', 0),
(1090, 120, '漳浦县', 0),
(1091, 120, '诏安县', 0),
(1092, 120, '长泰县', 0),
(1093, 120, '东山县', 0),
(1094, 120, '南靖县', 0),
(1095, 120, '平和县', 0),
(1096, 120, '华安县', 0),
(1097, 120, '龙海市', 0),
(1098, 121, '延平区', 0),
(1099, 121, '顺昌县', 0),
(1100, 121, '浦城县', 0),
(1101, 121, '光泽县', 0),
(1102, 121, '松溪县', 0),
(1103, 121, '政和县', 0),
(1104, 121, '邵武市', 0),
(1105, 121, '武夷山市', 0),
(1106, 121, '建瓯市', 0),
(1107, 121, '建阳市', 0),
(1108, 122, '新罗区', 0),
(1109, 122, '长汀县', 0),
(1110, 122, '永定县', 0),
(1111, 122, '上杭县', 0),
(1112, 122, '武平县', 0),
(1113, 122, '连城县', 0),
(1114, 122, '漳平市', 0),
(1115, 123, '蕉城区', 0),
(1116, 123, '霞浦县', 0),
(1117, 123, '古田县', 0),
(1118, 123, '屏南县', 0),
(1119, 123, '寿宁县', 0),
(1120, 123, '周宁县', 0),
(1121, 123, '柘荣县', 0),
(1122, 123, '福安市', 0),
(1123, 123, '福鼎市', 0),
(1124, 124, '东湖区', 0),
(1125, 124, '西湖区', 0),
(1126, 124, '青云谱区', 0),
(1127, 124, '湾里区', 0),
(1128, 124, '青山湖区', 0),
(1129, 124, '南昌县', 0),
(1130, 124, '新建县', 0),
(1131, 124, '安义县', 0),
(1132, 124, '进贤县', 0),
(1133, 125, '昌江区', 0),
(1134, 125, '珠山区', 0),
(1135, 125, '浮梁县', 0),
(1136, 125, '乐平市', 0),
(1137, 126, '安源区', 0),
(1138, 126, '湘东区', 0),
(1139, 126, '莲花县', 0),
(1140, 126, '上栗县', 0),
(1141, 126, '芦溪县', 0),
(1142, 127, '庐山区', 0),
(1143, 127, '浔阳区', 0),
(1144, 127, '九江县', 0),
(1145, 127, '武宁县', 0),
(1146, 127, '修水县', 0),
(1147, 127, '永修县', 0),
(1148, 127, '德安县', 0),
(1149, 127, '星子县', 0),
(1150, 127, '都昌县', 0),
(1151, 127, '湖口县', 0),
(1152, 127, '彭泽县', 0),
(1153, 127, '瑞昌市', 0),
(1154, 128, '渝水区', 0),
(1155, 128, '分宜县', 0),
(1156, 129, '月湖区', 0),
(1157, 129, '余江县', 0),
(1158, 129, '贵溪市', 0),
(1159, 130, '章贡区', 0),
(1160, 130, '赣县', 0),
(1161, 130, '信丰县', 0),
(1162, 130, '大余县', 0),
(1163, 130, '上犹县', 0),
(1164, 130, '崇义县', 0),
(1165, 130, '安远县', 0),
(1166, 130, '龙南县', 0),
(1167, 130, '定南县', 0),
(1168, 130, '全南县', 0),
(1169, 130, '宁都县', 0),
(1170, 130, '于都县', 0),
(1171, 130, '兴国县', 0),
(1172, 130, '会昌县', 0),
(1173, 130, '寻乌县', 0),
(1174, 130, '石城县', 0),
(1175, 130, '瑞金市', 0),
(1176, 130, '南康市', 0),
(1177, 131, '吉州区', 0),
(1178, 131, '青原区', 0),
(1179, 131, '吉安县', 0),
(1180, 131, '吉水县', 0),
(1181, 131, '峡江县', 0),
(1182, 131, '新干县', 0),
(1183, 131, '永丰县', 0),
(1184, 131, '泰和县', 0),
(1185, 131, '遂川县', 0),
(1186, 131, '万安县', 0),
(1187, 131, '安福县', 0),
(1188, 131, '永新县', 0),
(1189, 131, '井冈山市', 0),
(1190, 132, '袁州区', 0),
(1191, 132, '奉新县', 0),
(1192, 132, '万载县', 0),
(1193, 132, '上高县', 0),
(1194, 132, '宜丰县', 0),
(1195, 132, '靖安县', 0),
(1196, 132, '铜鼓县', 0),
(1197, 132, '丰城市', 0),
(1198, 132, '樟树市', 0),
(1199, 132, '高安市', 0),
(1200, 133, '临川区', 0),
(1201, 133, '南城县', 0),
(1202, 133, '黎川县', 0),
(1203, 133, '南丰县', 0),
(1204, 133, '崇仁县', 0),
(1205, 133, '乐安县', 0),
(1206, 133, '宜黄县', 0),
(1207, 133, '金溪县', 0),
(1208, 133, '资溪县', 0),
(1209, 133, '东乡县', 0),
(1210, 133, '广昌县', 0),
(1211, 134, '信州区', 0),
(1212, 134, '上饶县', 0),
(1213, 134, '广丰县', 0),
(1214, 134, '玉山县', 0),
(1215, 134, '铅山县', 0),
(1216, 134, '横峰县', 0),
(1217, 134, '弋阳县', 0),
(1218, 134, '余干县', 0),
(1219, 134, '鄱阳县', 0),
(1220, 134, '万年县', 0),
(1221, 134, '婺源县', 0),
(1222, 134, '德兴市', 0),
(1223, 135, '历下区', 0),
(1224, 135, '市中区', 0),
(1225, 135, '槐荫区', 0),
(1226, 135, '天桥区', 0),
(1227, 135, '历城区', 0),
(1228, 135, '长清区', 0),
(1229, 135, '平阴县', 0),
(1230, 135, '济阳县', 0),
(1231, 135, '商河县', 0),
(1232, 135, '章丘市', 0),
(1233, 136, '市南区', 0),
(1234, 136, '市北区', 0),
(1235, 136, '四方区', 0),
(1236, 136, '黄岛区', 0),
(1237, 136, '崂山区', 0),
(1238, 136, '李沧区', 0),
(1239, 136, '城阳区', 0),
(1240, 136, '胶州市', 0),
(1241, 136, '即墨市', 0),
(1242, 136, '平度市', 0),
(1243, 136, '胶南市', 0),
(1244, 136, '莱西市', 0),
(1245, 137, '淄川区', 0),
(1246, 137, '张店区', 0),
(1247, 137, '博山区', 0),
(1248, 137, '临淄区', 0),
(1249, 137, '周村区', 0),
(1250, 137, '桓台县', 0),
(1251, 137, '高青县', 0),
(1252, 137, '沂源县', 0),
(1253, 138, '市中区', 0),
(1254, 138, '薛城区', 0),
(1255, 138, '峄城区', 0),
(1256, 138, '台儿庄区', 0),
(1257, 138, '山亭区', 0),
(1258, 138, '滕州市', 0),
(1259, 139, '东营区', 0),
(1260, 139, '河口区', 0),
(1261, 139, '垦利县', 0),
(1262, 139, '利津县', 0),
(1263, 139, '广饶县', 0),
(1264, 140, '芝罘区', 0),
(1265, 140, '福山区', 0),
(1266, 140, '牟平区', 0),
(1267, 140, '莱山区', 0),
(1268, 140, '长岛县', 0),
(1269, 140, '龙口市', 0),
(1270, 140, '莱阳市', 0),
(1271, 140, '莱州市', 0),
(1272, 140, '蓬莱市', 0),
(1273, 140, '招远市', 0),
(1274, 140, '栖霞市', 0),
(1275, 140, '海阳市', 0),
(1276, 141, '潍城区', 0),
(1277, 141, '寒亭区', 0),
(1278, 141, '坊子区', 0),
(1279, 141, '奎文区', 0),
(1280, 141, '临朐县', 0),
(1281, 141, '昌乐县', 0),
(1282, 141, '青州市', 0),
(1283, 141, '诸城市', 0),
(1284, 141, '寿光市', 0),
(1285, 141, '安丘市', 0),
(1286, 141, '高密市', 0),
(1287, 141, '昌邑市', 0),
(1288, 142, '市中区', 0),
(1289, 142, '任城区', 0),
(1290, 142, '微山县', 0),
(1291, 142, '鱼台县', 0),
(1292, 142, '金乡县', 0),
(1293, 142, '嘉祥县', 0),
(1294, 142, '汶上县', 0),
(1295, 142, '泗水县', 0),
(1296, 142, '梁山县', 0),
(1297, 142, '曲阜市', 0),
(1298, 142, '兖州市', 0),
(1299, 142, '邹城市', 0),
(1300, 143, '泰山区', 0),
(1301, 143, '岱岳区', 0),
(1302, 143, '宁阳县', 0),
(1303, 143, '东平县', 0),
(1304, 143, '新泰市', 0),
(1305, 143, '肥城市', 0),
(1306, 144, '环翠区', 0),
(1307, 144, '文登市', 0),
(1308, 144, '荣成市', 0),
(1309, 144, '乳山市', 0),
(1310, 145, '东港区', 0),
(1311, 145, '岚山区', 0),
(1312, 145, '五莲县', 0),
(1313, 145, '莒县', 0),
(1314, 146, '莱城区', 0),
(1315, 146, '钢城区', 0),
(1316, 147, '兰山区', 0),
(1317, 147, '罗庄区', 0),
(1318, 147, '河东区', 0),
(1319, 147, '沂南县', 0),
(1320, 147, '郯城县', 0),
(1321, 147, '沂水县', 0),
(1322, 147, '苍山县', 0),
(1323, 147, '费县', 0),
(1324, 147, '平邑县', 0),
(1325, 147, '莒南县', 0),
(1326, 147, '蒙阴县', 0),
(1327, 147, '临沭县', 0),
(1328, 148, '德城区', 0),
(1329, 148, '陵县', 0),
(1330, 148, '宁津县', 0),
(1331, 148, '庆云县', 0),
(1332, 148, '临邑县', 0),
(1333, 148, '齐河县', 0),
(1334, 148, '平原县', 0),
(1335, 148, '夏津县', 0),
(1336, 148, '武城县', 0),
(1337, 148, '乐陵市', 0),
(1338, 148, '禹城市', 0),
(1339, 149, '东昌府区', 0),
(1340, 149, '阳谷县', 0),
(1341, 149, '莘县', 0),
(1342, 149, '茌平县', 0),
(1343, 149, '东阿县', 0),
(1344, 149, '冠县', 0),
(1345, 149, '高唐县', 0),
(1346, 149, '临清市', 0),
(1347, 150, '滨城区', 0),
(1348, 150, '惠民县', 0),
(1349, 150, '阳信县', 0),
(1350, 150, '无棣县', 0),
(1351, 150, '沾化县', 0),
(1352, 150, '博兴县', 0),
(1353, 150, '邹平县', 0),
(1354, 151, '牡丹区', 0),
(1355, 151, '曹县', 0),
(1356, 151, '单县', 0),
(1357, 151, '成武县', 0),
(1358, 151, '巨野县', 0),
(1359, 151, '郓城县', 0),
(1360, 151, '鄄城县', 0),
(1361, 151, '定陶县', 0),
(1362, 151, '东明县', 0),
(1363, 152, '中原区', 0),
(1364, 152, '二七区', 0),
(1365, 152, '管城回族区', 0),
(1366, 152, '金水区', 0),
(1367, 152, '上街区', 0),
(1368, 152, '惠济区', 0),
(1369, 152, '中牟县', 0),
(1370, 152, '巩义市', 0),
(1371, 152, '荥阳市', 0),
(1372, 152, '新密市', 0),
(1373, 152, '新郑市', 0),
(1374, 152, '登封市', 0),
(1375, 153, '龙亭区', 0),
(1376, 153, '顺河回族区', 0),
(1377, 153, '鼓楼区', 0),
(1378, 153, '南关区', 0),
(1379, 153, '郊区', 0),
(1380, 153, '杞县', 0),
(1381, 153, '通许县', 0),
(1382, 153, '尉氏县', 0),
(1383, 153, '开封县', 0),
(1384, 153, '兰考县', 0),
(1385, 154, '老城区', 0),
(1386, 154, '西工区', 0),
(1387, 154, '廛河回族区', 0),
(1388, 154, '涧西区', 0),
(1389, 154, '吉利区', 0),
(1390, 154, '洛龙区', 0),
(1391, 154, '孟津县', 0),
(1392, 154, '新安县', 0),
(1393, 154, '栾川县', 0),
(1394, 154, '嵩县', 0),
(1395, 154, '汝阳县', 0),
(1396, 154, '宜阳县', 0),
(1397, 154, '洛宁县', 0),
(1398, 154, '伊川县', 0),
(1399, 154, '偃师市', 0),
(1400, 155, '新华区', 0),
(1401, 155, '卫东区', 0),
(1402, 155, '石龙区', 0),
(1403, 155, '湛河区', 0),
(1404, 155, '宝丰县', 0),
(1405, 155, '叶县', 0),
(1406, 155, '鲁山县', 0),
(1407, 155, '郏县', 0),
(1408, 155, '舞钢市', 0),
(1409, 155, '汝州市', 0),
(1410, 156, '文峰区', 0),
(1411, 156, '北关区', 0),
(1412, 156, '殷都区', 0),
(1413, 156, '龙安区', 0),
(1414, 156, '安阳县', 0),
(1415, 156, '汤阴县', 0),
(1416, 156, '滑县', 0),
(1417, 156, '内黄县', 0),
(1418, 156, '林州市', 0),
(1419, 157, '鹤山区', 0),
(1420, 157, '山城区', 0),
(1421, 157, '淇滨区', 0),
(1422, 157, '浚县', 0),
(1423, 157, '淇县', 0),
(1424, 158, '红旗区', 0),
(1425, 158, '卫滨区', 0),
(1426, 158, '凤泉区', 0),
(1427, 158, '牧野区', 0),
(1428, 158, '新乡县', 0),
(1429, 158, '获嘉县', 0),
(1430, 158, '原阳县', 0),
(1431, 158, '延津县', 0),
(1432, 158, '封丘县', 0),
(1433, 158, '长垣县', 0),
(1434, 158, '卫辉市', 0),
(1435, 158, '辉县市', 0),
(1436, 159, '解放区', 0),
(1437, 159, '中站区', 0),
(1438, 159, '马村区', 0),
(1439, 159, '山阳区', 0),
(1440, 159, '修武县', 0),
(1441, 159, '博爱县', 0),
(1442, 159, '武陟县', 0),
(1443, 159, '温县', 0),
(1444, 159, '济源市', 0),
(1445, 159, '沁阳市', 0),
(1446, 159, '孟州市', 0),
(1447, 160, '华龙区', 0),
(1448, 160, '清丰县', 0),
(1449, 160, '南乐县', 0),
(1450, 160, '范县', 0),
(1451, 160, '台前县', 0),
(1452, 160, '濮阳县', 0),
(1453, 161, '魏都区', 0),
(1454, 161, '许昌县', 0),
(1455, 161, '鄢陵县', 0),
(1456, 161, '襄城县', 0),
(1457, 161, '禹州市', 0),
(1458, 161, '长葛市', 0),
(1459, 162, '源汇区', 0),
(1460, 162, '郾城区', 0),
(1461, 162, '召陵区', 0),
(1462, 162, '舞阳县', 0),
(1463, 162, '临颍县', 0),
(1464, 163, '市辖区', 0),
(1465, 163, '湖滨区', 0),
(1466, 163, '渑池县', 0),
(1467, 163, '陕县', 0),
(1468, 163, '卢氏县', 0),
(1469, 163, '义马市', 0),
(1470, 163, '灵宝市', 0),
(1471, 164, '宛城区', 0),
(1472, 164, '卧龙区', 0),
(1473, 164, '南召县', 0),
(1474, 164, '方城县', 0),
(1475, 164, '西峡县', 0),
(1476, 164, '镇平县', 0),
(1477, 164, '内乡县', 0),
(1478, 164, '淅川县', 0),
(1479, 164, '社旗县', 0),
(1480, 164, '唐河县', 0),
(1481, 164, '新野县', 0),
(1482, 164, '桐柏县', 0),
(1483, 164, '邓州市', 0),
(1484, 165, '梁园区', 0),
(1485, 165, '睢阳区', 0),
(1486, 165, '民权县', 0),
(1487, 165, '睢县', 0),
(1488, 165, '宁陵县', 0),
(1489, 165, '柘城县', 0),
(1490, 165, '虞城县', 0),
(1491, 165, '夏邑县', 0),
(1492, 165, '永城市', 0),
(1493, 166, '浉河区', 0),
(1494, 166, '平桥区', 0),
(1495, 166, '罗山县', 0),
(1496, 166, '光山县', 0),
(1497, 166, '新县', 0),
(1498, 166, '商城县', 0),
(1499, 166, '固始县', 0),
(1500, 166, '潢川县', 0),
(1501, 166, '淮滨县', 0),
(1502, 166, '息县', 0),
(1503, 167, '川汇区', 0),
(1504, 167, '扶沟县', 0),
(1505, 167, '西华县', 0),
(1506, 167, '商水县', 0),
(1507, 167, '沈丘县', 0),
(1508, 167, '郸城县', 0),
(1509, 167, '淮阳县', 0),
(1510, 167, '太康县', 0),
(1511, 167, '鹿邑县', 0),
(1512, 167, '项城市', 0),
(1513, 168, '驿城区', 0),
(1514, 168, '西平县', 0),
(1515, 168, '上蔡县', 0),
(1516, 168, '平舆县', 0),
(1517, 168, '正阳县', 0),
(1518, 168, '确山县', 0),
(1519, 168, '泌阳县', 0),
(1520, 168, '汝南县', 0),
(1521, 168, '遂平县', 0),
(1522, 168, '新蔡县', 0),
(1523, 169, '江岸区', 0),
(1524, 169, '江汉区', 0),
(1525, 169, '硚口区', 0),
(1526, 169, '汉阳区', 0),
(1527, 169, '武昌区', 0),
(1528, 169, '青山区', 0),
(1529, 169, '洪山区', 0),
(1530, 169, '东西湖区', 0),
(1531, 169, '汉南区', 0),
(1532, 169, '蔡甸区', 0),
(1533, 169, '江夏区', 0),
(1534, 169, '黄陂区', 0),
(1535, 169, '新洲区', 0),
(1536, 170, '黄石港区', 0),
(1537, 170, '西塞山区', 0),
(1538, 170, '下陆区', 0),
(1539, 170, '铁山区', 0),
(1540, 170, '阳新县', 0),
(1541, 170, '大冶市', 0),
(1542, 171, '茅箭区', 0),
(1543, 171, '张湾区', 0),
(1544, 171, '郧县', 0),
(1545, 171, '郧西县', 0),
(1546, 171, '竹山县', 0),
(1547, 171, '竹溪县', 0),
(1548, 171, '房县', 0),
(1549, 171, '丹江口市', 0),
(1550, 172, '西陵区', 0),
(1551, 172, '伍家岗区', 0),
(1552, 172, '点军区', 0),
(1553, 172, '猇亭区', 0),
(1554, 172, '夷陵区', 0),
(1555, 172, '远安县', 0),
(1556, 172, '兴山县', 0),
(1557, 172, '秭归县', 0),
(1558, 172, '长阳土家族自治县', 0),
(1559, 172, '五峰土家族自治县', 0),
(1560, 172, '宜都市', 0),
(1561, 172, '当阳市', 0),
(1562, 172, '枝江市', 0),
(1563, 173, '襄城区', 0),
(1564, 173, '樊城区', 0),
(1565, 173, '襄阳区', 0),
(1566, 173, '南漳县', 0),
(1567, 173, '谷城县', 0),
(1568, 173, '保康县', 0),
(1569, 173, '老河口市', 0),
(1570, 173, '枣阳市', 0),
(1571, 173, '宜城市', 0),
(1572, 174, '梁子湖区', 0),
(1573, 174, '华容区', 0),
(1574, 174, '鄂城区', 0),
(1575, 175, '东宝区', 0),
(1576, 175, '掇刀区', 0),
(1577, 175, '京山县', 0),
(1578, 175, '沙洋县', 0),
(1579, 175, '钟祥市', 0),
(1580, 176, '孝南区', 0),
(1581, 176, '孝昌县', 0),
(1582, 176, '大悟县', 0),
(1583, 176, '云梦县', 0),
(1584, 176, '应城市', 0),
(1585, 176, '安陆市', 0),
(1586, 176, '汉川市', 0),
(1587, 177, '沙市区', 0),
(1588, 177, '荆州区', 0),
(1589, 177, '公安县', 0),
(1590, 177, '监利县', 0),
(1591, 177, '江陵县', 0),
(1592, 177, '石首市', 0),
(1593, 177, '洪湖市', 0),
(1594, 177, '松滋市', 0),
(1595, 178, '黄州区', 0),
(1596, 178, '团风县', 0),
(1597, 178, '红安县', 0),
(1598, 178, '罗田县', 0),
(1599, 178, '英山县', 0),
(1600, 178, '浠水县', 0),
(1601, 178, '蕲春县', 0),
(1602, 178, '黄梅县', 0),
(1603, 178, '麻城市', 0),
(1604, 178, '武穴市', 0),
(1605, 179, '咸安区', 0),
(1606, 179, '嘉鱼县', 0),
(1607, 179, '通城县', 0),
(1608, 179, '崇阳县', 0),
(1609, 179, '通山县', 0),
(1610, 179, '赤壁市', 0),
(1611, 180, '曾都区', 0),
(1612, 180, '广水市', 0),
(1613, 181, '恩施市', 0),
(1614, 181, '利川市', 0),
(1615, 181, '建始县', 0),
(1616, 181, '巴东县', 0),
(1617, 181, '宣恩县', 0),
(1618, 181, '咸丰县', 0),
(1619, 181, '来凤县', 0),
(1620, 181, '鹤峰县', 0),
(1621, 182, '仙桃市', 0),
(1622, 182, '潜江市', 0),
(1623, 182, '天门市', 0),
(1624, 182, '神农架林区', 0),
(1625, 183, '芙蓉区', 0),
(1626, 183, '天心区', 0),
(1627, 183, '岳麓区', 0),
(1628, 183, '开福区', 0),
(1629, 183, '雨花区', 0),
(1630, 183, '长沙县', 0),
(1631, 183, '望城县', 0),
(1632, 183, '宁乡县', 0),
(1633, 183, '浏阳市', 0),
(1634, 184, '荷塘区', 0),
(1635, 184, '芦淞区', 0),
(1636, 184, '石峰区', 0),
(1637, 184, '天元区', 0),
(1638, 184, '株洲县', 0),
(1639, 184, '攸县', 0),
(1640, 184, '茶陵县', 0),
(1641, 184, '炎陵县', 0),
(1642, 184, '醴陵市', 0),
(1643, 185, '雨湖区', 0),
(1644, 185, '岳塘区', 0),
(1645, 185, '湘潭县', 0),
(1646, 185, '湘乡市', 0),
(1647, 185, '韶山市', 0),
(1648, 186, '珠晖区', 0),
(1649, 186, '雁峰区', 0),
(1650, 186, '石鼓区', 0),
(1651, 186, '蒸湘区', 0),
(1652, 186, '南岳区', 0),
(1653, 186, '衡阳县', 0),
(1654, 186, '衡南县', 0),
(1655, 186, '衡山县', 0),
(1656, 186, '衡东县', 0),
(1657, 186, '祁东县', 0),
(1658, 186, '耒阳市', 0),
(1659, 186, '常宁市', 0),
(1660, 187, '双清区', 0),
(1661, 187, '大祥区', 0),
(1662, 187, '北塔区', 0),
(1663, 187, '邵东县', 0),
(1664, 187, '新邵县', 0),
(1665, 187, '邵阳县', 0),
(1666, 187, '隆回县', 0),
(1667, 187, '洞口县', 0),
(1668, 187, '绥宁县', 0),
(1669, 187, '新宁县', 0),
(1670, 187, '城步苗族自治县', 0),
(1671, 187, '武冈市', 0),
(1672, 188, '岳阳楼区', 0),
(1673, 188, '云溪区', 0),
(1674, 188, '君山区', 0),
(1675, 188, '岳阳县', 0),
(1676, 188, '华容县', 0),
(1677, 188, '湘阴县', 0),
(1678, 188, '平江县', 0),
(1679, 188, '汨罗市', 0),
(1680, 188, '临湘市', 0),
(1681, 189, '武陵区', 0),
(1682, 189, '鼎城区', 0),
(1683, 189, '安乡县', 0),
(1684, 189, '汉寿县', 0),
(1685, 189, '澧县', 0),
(1686, 189, '临澧县', 0),
(1687, 189, '桃源县', 0),
(1688, 189, '石门县', 0),
(1689, 189, '津市市', 0),
(1690, 190, '永定区', 0),
(1691, 190, '武陵源区', 0),
(1692, 190, '慈利县', 0),
(1693, 190, '桑植县', 0),
(1694, 191, '资阳区', 0),
(1695, 191, '赫山区', 0),
(1696, 191, '南县', 0),
(1697, 191, '桃江县', 0),
(1698, 191, '安化县', 0),
(1699, 191, '沅江市', 0),
(1700, 192, '北湖区', 0),
(1701, 192, '苏仙区', 0),
(1702, 192, '桂阳县', 0),
(1703, 192, '宜章县', 0),
(1704, 192, '永兴县', 0),
(1705, 192, '嘉禾县', 0),
(1706, 192, '临武县', 0),
(1707, 192, '汝城县', 0),
(1708, 192, '桂东县', 0),
(1709, 192, '安仁县', 0),
(1710, 192, '资兴市', 0),
(1711, 193, '芝山区', 0),
(1712, 193, '冷水滩区', 0),
(1713, 193, '祁阳县', 0),
(1714, 193, '东安县', 0),
(1715, 193, '双牌县', 0),
(1716, 193, '道县', 0),
(1717, 193, '江永县', 0),
(1718, 193, '宁远县', 0),
(1719, 193, '蓝山县', 0),
(1720, 193, '新田县', 0),
(1721, 193, '江华瑶族自治县', 0),
(1722, 194, '鹤城区', 0),
(1723, 194, '中方县', 0),
(1724, 194, '沅陵县', 0),
(1725, 194, '辰溪县', 0),
(1726, 194, '溆浦县', 0),
(1727, 194, '会同县', 0),
(1728, 194, '麻阳苗族自治县', 0),
(1729, 194, '新晃侗族自治县', 0),
(1730, 194, '芷江侗族自治县', 0),
(1731, 194, '靖州苗族侗族自治县', 0),
(1732, 194, '通道侗族自治县', 0),
(1733, 194, '洪江市', 0),
(1734, 195, '娄星区', 0),
(1735, 195, '双峰县', 0),
(1736, 195, '新化县', 0),
(1737, 195, '冷水江市', 0),
(1738, 195, '涟源市', 0),
(1739, 196, '吉首市', 0),
(1740, 196, '泸溪县', 0),
(1741, 196, '凤凰县', 0),
(1742, 196, '花垣县', 0),
(1743, 196, '保靖县', 0),
(1744, 196, '古丈县', 0),
(1745, 196, '永顺县', 0),
(1746, 196, '龙山县', 0),
(1747, 197, '东山区', 0),
(1748, 197, '荔湾区', 0),
(1749, 197, '越秀区', 0),
(1750, 197, '海珠区', 0),
(1751, 197, '天河区', 0),
(1752, 197, '芳村区', 0),
(1753, 197, '白云区', 0),
(1754, 197, '黄埔区', 0),
(1755, 197, '番禺区', 0),
(1756, 197, '花都区', 0),
(1757, 197, '增城市', 0),
(1759, 198, '武江区', 0),
(1760, 198, '浈江区', 0),
(1761, 198, '曲江区', 0),
(1762, 198, '始兴县', 0),
(1763, 198, '仁化县', 0),
(1764, 198, '翁源县', 0),
(1765, 198, '乳源瑶族自治县', 0),
(1766, 198, '新丰县', 0),
(1767, 198, '乐昌市', 0),
(1768, 198, '南雄市', 0),
(1769, 199, '罗湖区', 0),
(1770, 199, '福田区', 0),
(1771, 199, '南山区', 0),
(1772, 199, '宝安区', 0),
(1773, 199, '龙岗区', 0),
(1774, 199, '盐田区', 0),
(1775, 200, '香洲区', 0),
(1776, 200, '斗门区', 0),
(1777, 200, '金湾区', 0),
(1778, 201, '龙湖区', 0),
(1779, 201, '金平区', 0),
(1780, 201, '濠江区', 0),
(1781, 201, '潮阳区', 0),
(1782, 201, '潮南区', 0),
(1783, 201, '澄海区', 0),
(1784, 201, '南澳县', 0),
(1785, 202, '禅城区', 0),
(1786, 202, '南海区', 0),
(1787, 202, '顺德区', 0),
(1788, 202, '三水区', 0),
(1789, 202, '高明区', 0),
(1790, 203, '蓬江区', 0),
(1791, 203, '江海区', 0),
(1792, 203, '新会区', 0),
(1793, 203, '台山市', 0),
(1794, 203, '开平市', 0),
(1795, 203, '鹤山市', 0),
(1796, 203, '恩平市', 0),
(1797, 204, '赤坎区', 0),
(1798, 204, '霞山区', 0),
(1799, 204, '坡头区', 0),
(1800, 204, '麻章区', 0),
(1801, 204, '遂溪县', 0),
(1802, 204, '徐闻县', 0),
(1803, 204, '廉江市', 0),
(1804, 204, '雷州市', 0),
(1805, 204, '吴川市', 0),
(1806, 205, '茂南区', 0),
(1807, 205, '茂港区', 0),
(1808, 205, '电白县', 0),
(1809, 205, '高州市', 0),
(1810, 205, '化州市', 0),
(1811, 205, '信宜市', 0),
(1812, 206, '端州区', 0),
(1813, 206, '鼎湖区', 0),
(1814, 206, '广宁县', 0),
(1815, 206, '怀集县', 0),
(1816, 206, '封开县', 0),
(1817, 206, '德庆县', 0),
(1818, 206, '高要市', 0),
(1819, 206, '四会市', 0),
(1820, 207, '惠城区', 0),
(1821, 207, '惠阳区', 0),
(1822, 207, '博罗县', 0),
(1823, 207, '惠东县', 0),
(1824, 207, '龙门县', 0),
(1825, 208, '梅江区', 0),
(1826, 208, '梅县', 0),
(1827, 208, '大埔县', 0),
(1828, 208, '丰顺县', 0),
(1829, 208, '五华县', 0),
(1830, 208, '平远县', 0),
(1831, 208, '蕉岭县', 0),
(1832, 208, '兴宁市', 0),
(1833, 209, '城区', 0),
(1834, 209, '海丰县', 0),
(1835, 209, '陆河县', 0),
(1836, 209, '陆丰市', 0),
(1837, 210, '源城区', 0),
(1838, 210, '紫金县', 0),
(1839, 210, '龙川县', 0),
(1840, 210, '连平县', 0),
(1841, 210, '和平县', 0),
(1842, 210, '东源县', 0),
(1843, 211, '江城区', 0),
(1844, 211, '阳西县', 0),
(1845, 211, '阳东县', 0),
(1846, 211, '阳春市', 0),
(1847, 212, '清城区', 0),
(1848, 212, '佛冈县', 0),
(1849, 212, '阳山县', 0),
(1850, 212, '连山壮族瑶族自治县', 0),
(1851, 212, '连南瑶族自治县', 0),
(1852, 212, '清新县', 0),
(1853, 212, '英德市', 0),
(1854, 212, '连州市', 0),
(1855, 215, '湘桥区', 0),
(1856, 215, '潮安县', 0),
(1857, 215, '饶平县', 0),
(1858, 216, '榕城区', 0),
(1859, 216, '揭东县', 0),
(1860, 216, '揭西县', 0),
(1861, 216, '惠来县', 0),
(1862, 216, '普宁市', 0),
(1863, 217, '云城区', 0),
(1864, 217, '新兴县', 0),
(1865, 217, '郁南县', 0),
(1866, 217, '云安县', 0),
(1867, 217, '罗定市', 0),
(1868, 218, '兴宁区', 0),
(1869, 218, '青秀区', 0),
(1870, 218, '江南区', 0),
(1871, 218, '西乡塘区', 0),
(1872, 218, '良庆区', 0),
(1873, 218, '邕宁区', 0),
(1874, 218, '武鸣县', 0),
(1875, 218, '隆安县', 0),
(1876, 218, '马山县', 0),
(1877, 218, '上林县', 0),
(1878, 218, '宾阳县', 0),
(1879, 218, '横县', 0),
(1880, 219, '城中区', 0),
(1881, 219, '鱼峰区', 0),
(1882, 219, '柳南区', 0),
(1883, 219, '柳北区', 0),
(1884, 219, '柳江县', 0),
(1885, 219, '柳城县', 0),
(1886, 219, '鹿寨县', 0),
(1887, 219, '融安县', 0),
(1888, 219, '融水苗族自治县', 0),
(1889, 219, '三江侗族自治县', 0),
(1890, 220, '秀峰区', 0),
(1891, 220, '叠彩区', 0),
(1892, 220, '象山区', 0),
(1893, 220, '七星区', 0),
(1894, 220, '雁山区', 0),
(1895, 220, '阳朔县', 0),
(1896, 220, '临桂县', 0),
(1897, 220, '灵川县', 0),
(1898, 220, '全州县', 0),
(1899, 220, '兴安县', 0);
INSERT INTO `sys_district` (`district_id`, `city_id`, `district_name`, `sort`) VALUES
(1900, 220, '永福县', 0),
(1901, 220, '灌阳县', 0),
(1902, 220, '龙胜各族自治县', 0),
(1903, 220, '资源县', 0),
(1904, 220, '平乐县', 0),
(1905, 220, '荔蒲县', 0),
(1906, 220, '恭城瑶族自治县', 0),
(1907, 221, '万秀区', 0),
(1908, 221, '蝶山区', 0),
(1909, 221, '长洲区', 0),
(1910, 221, '苍梧县', 0),
(1911, 221, '藤县', 0),
(1912, 221, '蒙山县', 0),
(1913, 221, '岑溪市', 0),
(1914, 222, '海城区', 0),
(1915, 222, '银海区', 0),
(1916, 222, '铁山港区', 0),
(1917, 222, '合浦县', 0),
(1918, 223, '港口区', 0),
(1919, 223, '防城区', 0),
(1920, 223, '上思县', 0),
(1921, 223, '东兴市', 0),
(1922, 224, '钦南区', 0),
(1923, 224, '钦北区', 0),
(1924, 224, '灵山县', 0),
(1925, 224, '浦北县', 0),
(1926, 225, '港北区', 0),
(1927, 225, '港南区', 0),
(1928, 225, '覃塘区', 0),
(1929, 225, '平南县', 0),
(1930, 225, '桂平市', 0),
(1931, 226, '玉州区', 0),
(1932, 226, '容县', 0),
(1933, 226, '陆川县', 0),
(1934, 226, '博白县', 0),
(1935, 226, '兴业县', 0),
(1936, 226, '北流市', 0),
(1937, 227, '右江区', 0),
(1938, 227, '田阳县', 0),
(1939, 227, '田东县', 0),
(1940, 227, '平果县', 0),
(1941, 227, '德保县', 0),
(1942, 227, '靖西县', 0),
(1943, 227, '那坡县', 0),
(1944, 227, '凌云县', 0),
(1945, 227, '乐业县', 0),
(1946, 227, '田林县', 0),
(1947, 227, '西林县', 0),
(1948, 227, '隆林各族自治县', 0),
(1949, 228, '八步区', 0),
(1950, 228, '昭平县', 0),
(1951, 228, '钟山县', 0),
(1952, 228, '富川瑶族自治县', 0),
(1953, 229, '金城江区', 0),
(1954, 229, '南丹县', 0),
(1955, 229, '天峨县', 0),
(1956, 229, '凤山县', 0),
(1957, 229, '东兰县', 0),
(1958, 229, '罗城仫佬族自治县', 0),
(1959, 229, '环江毛南族自治县', 0),
(1960, 229, '巴马瑶族自治县', 0),
(1961, 229, '都安瑶族自治县', 0),
(1962, 229, '大化瑶族自治县', 0),
(1963, 229, '宜州市', 0),
(1964, 230, '兴宾区', 0),
(1965, 230, '忻城县', 0),
(1966, 230, '象州县', 0),
(1967, 230, '武宣县', 0),
(1968, 230, '金秀瑶族自治县', 0),
(1969, 230, '合山市', 0),
(1970, 231, '江洲区', 0),
(1971, 231, '扶绥县', 0),
(1972, 231, '宁明县', 0),
(1973, 231, '龙州县', 0),
(1974, 231, '大新县', 0),
(1975, 231, '天等县', 0),
(1976, 231, '凭祥市', 0),
(1977, 232, '秀英区', 0),
(1978, 232, '龙华区', 0),
(1979, 232, '琼山区', 0),
(1980, 232, '美兰区', 0),
(1981, 233, '五指山市', 0),
(1982, 233, '琼海市', 0),
(1983, 233, '儋州市', 0),
(1984, 233, '文昌市', 0),
(1985, 233, '万宁市', 0),
(1986, 233, '东方市', 0),
(1987, 233, '定安县', 0),
(1988, 233, '屯昌县', 0),
(1989, 233, '澄迈县', 0),
(1990, 233, '临高县', 0),
(1991, 233, '白沙黎族自治县', 0),
(1992, 233, '昌江黎族自治县', 0),
(1993, 233, '乐东黎族自治县', 0),
(1994, 233, '陵水黎族自治县', 0),
(1995, 233, '保亭黎族苗族自治县', 0),
(1996, 233, '琼中黎族苗族自治县', 0),
(1997, 233, '西沙群岛', 0),
(1998, 233, '南沙群岛', 0),
(1999, 233, '中沙群岛的岛礁及其海域', 0),
(2000, 234, '万州区', 0),
(2001, 234, '涪陵区', 0),
(2002, 234, '渝中区', 0),
(2003, 234, '大渡口区', 0),
(2004, 234, '江北区', 0),
(2005, 234, '沙坪坝区', 0),
(2006, 234, '九龙坡区', 0),
(2007, 234, '南岸区', 0),
(2008, 234, '北碚区', 0),
(2009, 234, '万盛区', 0),
(2010, 234, '双桥区', 0),
(2011, 234, '渝北区', 0),
(2012, 234, '巴南区', 0),
(2013, 234, '黔江区', 0),
(2014, 234, '长寿区', 0),
(2015, 234, '綦江县', 0),
(2016, 234, '潼南县', 0),
(2017, 234, '铜梁县', 0),
(2018, 234, '大足县', 0),
(2019, 234, '荣昌县', 0),
(2020, 234, '璧山县', 0),
(2021, 234, '梁平县', 0),
(2022, 234, '城口县', 0),
(2023, 234, '丰都县', 0),
(2024, 234, '垫江县', 0),
(2025, 234, '武隆县', 0),
(2026, 234, '忠县', 0),
(2027, 234, '开县', 0),
(2028, 234, '云阳县', 0),
(2029, 234, '奉节县', 0),
(2030, 234, '巫山县', 0),
(2031, 234, '巫溪县', 0),
(2032, 234, '石柱土家族自治县', 0),
(2033, 234, '秀山土家族苗族自治县', 0),
(2034, 234, '酉阳土家族苗族自治县', 0),
(2035, 234, '彭水苗族土家族自治县', 0),
(2036, 234, '江津市', 0),
(2037, 234, '合川市', 0),
(2038, 234, '永川市', 0),
(2039, 234, '南川市', 0),
(2040, 235, '锦江区', 0),
(2041, 235, '青羊区', 0),
(2042, 235, '金牛区', 0),
(2043, 235, '武侯区', 0),
(2044, 235, '成华区', 0),
(2045, 235, '龙泉驿区', 0),
(2046, 235, '青白江区', 0),
(2047, 235, '新都区', 0),
(2048, 235, '温江区', 0),
(2049, 235, '金堂县', 0),
(2050, 235, '双流县', 0),
(2051, 235, '郫县', 0),
(2052, 235, '大邑县', 0),
(2053, 235, '蒲江县', 0),
(2054, 235, '新津县', 0),
(2055, 235, '都江堰市', 0),
(2056, 235, '彭州市', 0),
(2057, 235, '邛崃市', 0),
(2058, 235, '崇州市', 0),
(2059, 236, '自流井区', 0),
(2060, 236, '贡井区', 0),
(2061, 236, '大安区', 0),
(2062, 236, '沿滩区', 0),
(2063, 236, '荣县', 0),
(2064, 236, '富顺县', 0),
(2065, 237, '东区', 0),
(2066, 237, '西区', 0),
(2067, 237, '仁和区', 0),
(2068, 237, '米易县', 0),
(2069, 237, '盐边县', 0),
(2070, 238, '江阳区', 0),
(2071, 238, '纳溪区', 0),
(2072, 238, '龙马潭区', 0),
(2073, 238, '泸县', 0),
(2074, 238, '合江县', 0),
(2075, 238, '叙永县', 0),
(2076, 238, '古蔺县', 0),
(2077, 239, '旌阳区', 0),
(2078, 239, '中江县', 0),
(2079, 239, '罗江县', 0),
(2080, 239, '广汉市', 0),
(2081, 239, '什邡市', 0),
(2082, 239, '绵竹市', 0),
(2083, 240, '涪城区', 0),
(2084, 240, '游仙区', 0),
(2085, 240, '三台县', 0),
(2086, 240, '盐亭县', 0),
(2087, 240, '安县', 0),
(2088, 240, '梓潼县', 0),
(2089, 240, '北川羌族自治县', 0),
(2090, 240, '平武县', 0),
(2091, 240, '江油市', 0),
(2092, 241, '市中区', 0),
(2093, 241, '元坝区', 0),
(2094, 241, '朝天区', 0),
(2095, 241, '旺苍县', 0),
(2096, 241, '青川县', 0),
(2097, 241, '剑阁县', 0),
(2098, 241, '苍溪县', 0),
(2099, 242, '船山区', 0),
(2100, 242, '安居区', 0),
(2101, 242, '蓬溪县', 0),
(2102, 242, '射洪县', 0),
(2103, 242, '大英县', 0),
(2104, 243, '市中区', 0),
(2105, 243, '东兴区', 0),
(2106, 243, '威远县', 0),
(2107, 243, '资中县', 0),
(2108, 243, '隆昌县', 0),
(2109, 244, '市中区', 0),
(2110, 244, '沙湾区', 0),
(2111, 244, '五通桥区', 0),
(2112, 244, '金口河区', 0),
(2113, 244, '犍为县', 0),
(2114, 244, '井研县', 0),
(2115, 244, '夹江县', 0),
(2116, 244, '沐川县', 0),
(2117, 244, '峨边彝族自治县', 0),
(2118, 244, '马边彝族自治县', 0),
(2119, 244, '峨眉山市', 0),
(2120, 245, '顺庆区', 0),
(2121, 245, '高坪区', 0),
(2122, 245, '嘉陵区', 0),
(2123, 245, '南部县', 0),
(2124, 245, '营山县', 0),
(2125, 245, '蓬安县', 0),
(2126, 245, '仪陇县', 0),
(2127, 245, '西充县', 0),
(2128, 245, '阆中市', 0),
(2129, 246, '东坡区', 0),
(2130, 246, '仁寿县', 0),
(2131, 246, '彭山县', 0),
(2132, 246, '洪雅县', 0),
(2133, 246, '丹棱县', 0),
(2134, 246, '青神县', 0),
(2135, 247, '翠屏区', 0),
(2136, 247, '宜宾县', 0),
(2137, 247, '南溪县', 0),
(2138, 247, '江安县', 0),
(2139, 247, '长宁县', 0),
(2140, 247, '高县', 0),
(2141, 247, '珙县', 0),
(2142, 247, '筠连县', 0),
(2143, 247, '兴文县', 0),
(2144, 247, '屏山县', 0),
(2145, 248, '广安区', 0),
(2146, 248, '岳池县', 0),
(2147, 248, '武胜县', 0),
(2148, 248, '邻水县', 0),
(2149, 248, '华蓥市', 0),
(2150, 249, '通川区', 0),
(2151, 249, '达县', 0),
(2152, 249, '宣汉县', 0),
(2153, 249, '开江县', 0),
(2154, 249, '大竹县', 0),
(2155, 249, '渠县', 0),
(2156, 249, '万源市', 0),
(2157, 250, '雨城区', 0),
(2158, 250, '名山县', 0),
(2159, 250, '荥经县', 0),
(2160, 250, '汉源县', 0),
(2161, 250, '石棉县', 0),
(2162, 250, '天全县', 0),
(2163, 250, '芦山县', 0),
(2164, 250, '宝兴县', 0),
(2165, 251, '巴州区', 0),
(2166, 251, '通江县', 0),
(2167, 251, '南江县', 0),
(2168, 251, '平昌县', 0),
(2169, 252, '雁江区', 0),
(2170, 252, '安岳县', 0),
(2171, 252, '乐至县', 0),
(2172, 252, '简阳市', 0),
(2173, 253, '汶川县', 0),
(2174, 253, '理县', 0),
(2175, 253, '茂县', 0),
(2176, 253, '松潘县', 0),
(2177, 253, '九寨沟县', 0),
(2178, 253, '金川县', 0),
(2179, 253, '小金县', 0),
(2180, 253, '黑水县', 0),
(2181, 253, '马尔康县', 0),
(2182, 253, '壤塘县', 0),
(2183, 253, '阿坝县', 0),
(2184, 253, '若尔盖县', 0),
(2185, 253, '红原县', 0),
(2186, 254, '康定县', 0),
(2187, 254, '泸定县', 0),
(2188, 254, '丹巴县', 0),
(2189, 254, '九龙县', 0),
(2190, 254, '雅江县', 0),
(2191, 254, '道孚县', 0),
(2192, 254, '炉霍县', 0),
(2193, 254, '甘孜县', 0),
(2194, 254, '新龙县', 0),
(2195, 254, '德格县', 0),
(2196, 254, '白玉县', 0),
(2197, 254, '石渠县', 0),
(2198, 254, '色达县', 0),
(2199, 254, '理塘县', 0),
(2200, 254, '巴塘县', 0),
(2201, 254, '乡城县', 0),
(2202, 254, '稻城县', 0),
(2203, 254, '得荣县', 0),
(2204, 255, '西昌市', 0),
(2205, 255, '木里藏族自治县', 0),
(2206, 255, '盐源县', 0),
(2207, 255, '德昌县', 0),
(2208, 255, '会理县', 0),
(2209, 255, '会东县', 0),
(2210, 255, '宁南县', 0),
(2211, 255, '普格县', 0),
(2212, 255, '布拖县', 0),
(2213, 255, '金阳县', 0),
(2214, 255, '昭觉县', 0),
(2215, 255, '喜德县', 0),
(2216, 255, '冕宁县', 0),
(2217, 255, '越西县', 0),
(2218, 255, '甘洛县', 0),
(2219, 255, '美姑县', 0),
(2220, 255, '雷波县', 0),
(2221, 256, '南明区', 0),
(2222, 256, '云岩区', 0),
(2223, 256, '花溪区', 0),
(2224, 256, '乌当区', 0),
(2225, 256, '白云区', 0),
(2226, 256, '小河区', 0),
(2227, 256, '开阳县', 0),
(2228, 256, '息烽县', 0),
(2229, 256, '修文县', 0),
(2230, 256, '清镇市', 0),
(2231, 257, '钟山区', 0),
(2232, 257, '六枝特区', 0),
(2233, 257, '水城县', 0),
(2234, 257, '盘县', 0),
(2235, 258, '红花岗区', 0),
(2236, 258, '汇川区', 0),
(2237, 258, '遵义县', 0),
(2238, 258, '桐梓县', 0),
(2239, 258, '绥阳县', 0),
(2240, 258, '正安县', 0),
(2241, 258, '道真仡佬族苗族自治县', 0),
(2242, 258, '务川仡佬族苗族自治县', 0),
(2243, 258, '凤冈县', 0),
(2244, 258, '湄潭县', 0),
(2245, 258, '余庆县', 0),
(2246, 258, '习水县', 0),
(2247, 258, '赤水市', 0),
(2248, 258, '仁怀市', 0),
(2249, 259, '西秀区', 0),
(2250, 259, '平坝县', 0),
(2251, 259, '普定县', 0),
(2252, 259, '镇宁布依族苗族自治县', 0),
(2253, 259, '关岭布依族苗族自治县', 0),
(2254, 259, '紫云苗族布依族自治县', 0),
(2255, 260, '铜仁市', 0),
(2256, 260, '江口县', 0),
(2257, 260, '玉屏侗族自治县', 0),
(2258, 260, '石阡县', 0),
(2259, 260, '思南县', 0),
(2260, 260, '印江土家族苗族自治县', 0),
(2261, 260, '德江县', 0),
(2262, 260, '沿河土家族自治县', 0),
(2263, 260, '松桃苗族自治县', 0),
(2264, 260, '万山特区', 0),
(2265, 261, '兴义市', 0),
(2266, 261, '兴仁县', 0),
(2267, 261, '普安县', 0),
(2268, 261, '晴隆县', 0),
(2269, 261, '贞丰县', 0),
(2270, 261, '望谟县', 0),
(2271, 261, '册亨县', 0),
(2272, 261, '安龙县', 0),
(2273, 262, '毕节市', 0),
(2274, 262, '大方县', 0),
(2275, 262, '黔西县', 0),
(2276, 262, '金沙县', 0),
(2277, 262, '织金县', 0),
(2278, 262, '纳雍县', 0),
(2279, 262, '威宁彝族回族苗族自治县', 0),
(2280, 262, '赫章县', 0),
(2281, 263, '凯里市', 0),
(2282, 263, '黄平县', 0),
(2283, 263, '施秉县', 0),
(2284, 263, '三穗县', 0),
(2285, 263, '镇远县', 0),
(2286, 263, '岑巩县', 0),
(2287, 263, '天柱县', 0),
(2288, 263, '锦屏县', 0),
(2289, 263, '剑河县', 0),
(2290, 263, '台江县', 0),
(2291, 263, '黎平县', 0),
(2292, 263, '榕江县', 0),
(2293, 263, '从江县', 0),
(2294, 263, '雷山县', 0),
(2295, 263, '麻江县', 0),
(2296, 263, '丹寨县', 0),
(2297, 264, '都匀市', 0),
(2298, 264, '福泉市', 0),
(2299, 264, '荔波县', 0),
(2300, 264, '贵定县', 0),
(2301, 264, '瓮安县', 0),
(2302, 264, '独山县', 0),
(2303, 264, '平塘县', 0),
(2304, 264, '罗甸县', 0),
(2305, 264, '长顺县', 0),
(2306, 264, '龙里县', 0),
(2307, 264, '惠水县', 0),
(2308, 264, '三都水族自治县', 0),
(2309, 265, '五华区', 0),
(2310, 265, '盘龙区', 0),
(2311, 265, '官渡区', 0),
(2312, 265, '西山区', 0),
(2313, 265, '东川区', 0),
(2314, 265, '呈贡县', 0),
(2315, 265, '晋宁县', 0),
(2316, 265, '富民县', 0),
(2317, 265, '宜良县', 0),
(2318, 265, '石林彝族自治县', 0),
(2319, 265, '嵩明县', 0),
(2320, 265, '禄劝彝族苗族自治县', 0),
(2321, 265, '寻甸回族彝族自治县', 0),
(2322, 265, '安宁市', 0),
(2323, 266, '麒麟区', 0),
(2324, 266, '马龙县', 0),
(2325, 266, '陆良县', 0),
(2326, 266, '师宗县', 0),
(2327, 266, '罗平县', 0),
(2328, 266, '富源县', 0),
(2329, 266, '会泽县', 0),
(2330, 266, '沾益县', 0),
(2331, 266, '宣威市', 0),
(2332, 267, '红塔区', 0),
(2333, 267, '江川县', 0),
(2334, 267, '澄江县', 0),
(2335, 267, '通海县', 0),
(2336, 267, '华宁县', 0),
(2337, 267, '易门县', 0),
(2338, 267, '峨山彝族自治县', 0),
(2339, 267, '新平彝族傣族自治县', 0),
(2340, 267, '元江哈尼族彝族傣族自治县', 0),
(2341, 268, '隆阳区', 0),
(2342, 268, '施甸县', 0),
(2343, 268, '腾冲县', 0),
(2344, 268, '龙陵县', 0),
(2345, 268, '昌宁县', 0),
(2346, 269, '昭阳区', 0),
(2347, 269, '鲁甸县', 0),
(2348, 269, '巧家县', 0),
(2349, 269, '盐津县', 0),
(2350, 269, '大关县', 0),
(2351, 269, '永善县', 0),
(2352, 269, '绥江县', 0),
(2353, 269, '镇雄县', 0),
(2354, 269, '彝良县', 0),
(2355, 269, '威信县', 0),
(2356, 269, '水富县', 0),
(2357, 270, '古城区', 0),
(2358, 270, '玉龙纳西族自治县', 0),
(2359, 270, '永胜县', 0),
(2360, 270, '华坪县', 0),
(2361, 270, '宁蒗彝族自治县', 0),
(2362, 271, '翠云区', 0),
(2363, 271, '普洱哈尼族彝族自治县', 0),
(2364, 271, '墨江哈尼族自治县', 0),
(2365, 271, '景东彝族自治县', 0),
(2366, 271, '景谷傣族彝族自治县', 0),
(2367, 271, '镇沅彝族哈尼族拉祜族自治县', 0),
(2368, 271, '江城哈尼族彝族自治县', 0),
(2369, 271, '孟连傣族拉祜族佤族自治县', 0),
(2370, 271, '澜沧拉祜族自治县', 0),
(2371, 271, '西盟佤族自治县', 0),
(2372, 272, '临翔区', 0),
(2373, 272, '凤庆县', 0),
(2374, 272, '云县', 0),
(2375, 272, '永德县', 0),
(2376, 272, '镇康县', 0),
(2377, 272, '双江拉祜族佤族布朗族傣族自治县', 0),
(2378, 272, '耿马傣族佤族自治县', 0),
(2379, 272, '沧源佤族自治县', 0),
(2380, 273, '楚雄市', 0),
(2381, 273, '双柏县', 0),
(2382, 273, '牟定县', 0),
(2383, 273, '南华县', 0),
(2384, 273, '姚安县', 0),
(2385, 273, '大姚县', 0),
(2386, 273, '永仁县', 0),
(2387, 273, '元谋县', 0),
(2388, 273, '武定县', 0),
(2389, 273, '禄丰县', 0),
(2390, 274, '个旧市', 0),
(2391, 274, '开远市', 0),
(2392, 274, '蒙自县', 0),
(2393, 274, '屏边苗族自治县', 0),
(2394, 274, '建水县', 0),
(2395, 274, '石屏县', 0),
(2396, 274, '弥勒县', 0),
(2397, 274, '泸西县', 0),
(2398, 274, '元阳县', 0),
(2399, 274, '红河县', 0),
(2400, 274, '金平苗族瑶族傣族自治县', 0),
(2401, 274, '绿春县', 0),
(2402, 274, '河口瑶族自治县', 0),
(2403, 275, '文山县', 0),
(2404, 275, '砚山县', 0),
(2405, 275, '西畴县', 0),
(2406, 275, '麻栗坡县', 0),
(2407, 275, '马关县', 0),
(2408, 275, '丘北县', 0),
(2409, 275, '广南县', 0),
(2410, 275, '富宁县', 0),
(2411, 276, '景洪市', 0),
(2412, 276, '勐海县', 0),
(2413, 276, '勐腊县', 0),
(2414, 277, '大理市', 0),
(2415, 277, '漾濞彝族自治县', 0),
(2416, 277, '祥云县', 0),
(2417, 277, '宾川县', 0),
(2418, 277, '弥渡县', 0),
(2419, 277, '南涧彝族自治县', 0),
(2420, 277, '巍山彝族回族自治县', 0),
(2421, 277, '永平县', 0),
(2422, 277, '云龙县', 0),
(2423, 277, '洱源县', 0),
(2424, 277, '剑川县', 0),
(2425, 277, '鹤庆县', 0),
(2426, 278, '瑞丽市', 0),
(2427, 278, '潞西市', 0),
(2428, 278, '梁河县', 0),
(2429, 278, '盈江县', 0),
(2430, 278, '陇川县', 0),
(2431, 279, '泸水县', 0),
(2432, 279, '福贡县', 0),
(2433, 279, '贡山独龙族怒族自治县', 0),
(2434, 279, '兰坪白族普米族自治县', 0),
(2435, 280, '香格里拉县', 0),
(2436, 280, '德钦县', 0),
(2437, 280, '维西傈僳族自治县', 0),
(2438, 281, '城关区', 0),
(2439, 281, '林周县', 0),
(2440, 281, '当雄县', 0),
(2441, 281, '尼木县', 0),
(2442, 281, '曲水县', 0),
(2443, 281, '堆龙德庆县', 0),
(2444, 281, '达孜县', 0),
(2445, 281, '墨竹工卡县', 0),
(2446, 282, '昌都县', 0),
(2447, 282, '江达县', 0),
(2448, 282, '贡觉县', 0),
(2449, 282, '类乌齐县', 0),
(2450, 282, '丁青县', 0),
(2451, 282, '察雅县', 0),
(2452, 282, '八宿县', 0),
(2453, 282, '左贡县', 0),
(2454, 282, '芒康县', 0),
(2455, 282, '洛隆县', 0),
(2456, 282, '边坝县', 0),
(2457, 283, '乃东县', 0),
(2458, 283, '扎囊县', 0),
(2459, 283, '贡嘎县', 0),
(2460, 283, '桑日县', 0),
(2461, 283, '琼结县', 0),
(2462, 283, '曲松县', 0),
(2463, 283, '措美县', 0),
(2464, 283, '洛扎县', 0),
(2465, 283, '加查县', 0),
(2466, 283, '隆子县', 0),
(2467, 283, '错那县', 0),
(2468, 283, '浪卡子县', 0),
(2469, 284, '日喀则市', 0),
(2470, 284, '南木林县', 0),
(2471, 284, '江孜县', 0),
(2472, 284, '定日县', 0),
(2473, 284, '萨迦县', 0),
(2474, 284, '拉孜县', 0),
(2475, 284, '昂仁县', 0),
(2476, 284, '谢通门县', 0),
(2477, 284, '白朗县', 0),
(2478, 284, '仁布县', 0),
(2479, 284, '康马县', 0),
(2480, 284, '定结县', 0),
(2481, 284, '仲巴县', 0),
(2482, 284, '亚东县', 0),
(2483, 284, '吉隆县', 0),
(2484, 284, '聂拉木县', 0),
(2485, 284, '萨嘎县', 0),
(2486, 284, '岗巴县', 0),
(2487, 285, '那曲县', 0),
(2488, 285, '嘉黎县', 0),
(2489, 285, '比如县', 0),
(2490, 285, '聂荣县', 0),
(2491, 285, '安多县', 0),
(2492, 285, '申扎县', 0),
(2493, 285, '索县', 0),
(2494, 285, '班戈县', 0),
(2495, 285, '巴青县', 0),
(2496, 285, '尼玛县', 0),
(2497, 286, '普兰县', 0),
(2498, 286, '札达县', 0),
(2499, 286, '噶尔县', 0),
(2500, 286, '日土县', 0),
(2501, 286, '革吉县', 0),
(2502, 286, '改则县', 0),
(2503, 286, '措勤县', 0),
(2504, 287, '林芝县', 0),
(2505, 287, '工布江达县', 0),
(2506, 287, '米林县', 0),
(2507, 287, '墨脱县', 0),
(2508, 287, '波密县', 0),
(2509, 287, '察隅县', 0),
(2510, 287, '朗县', 0),
(2511, 288, '新城区', 0),
(2512, 288, '碑林区', 0),
(2513, 288, '莲湖区', 0),
(2514, 288, '灞桥区', 0),
(2515, 288, '未央区', 0),
(2516, 288, '雁塔区', 0),
(2517, 288, '阎良区', 0),
(2518, 288, '临潼区', 0),
(2519, 288, '长安区', 0),
(2520, 288, '蓝田县', 0),
(2521, 288, '周至县', 0),
(2522, 288, '户县', 0),
(2523, 288, '高陵县', 0),
(2524, 289, '王益区', 0),
(2525, 289, '印台区', 0),
(2526, 289, '耀州区', 0),
(2527, 289, '宜君县', 0),
(2528, 290, '渭滨区', 0),
(2529, 290, '金台区', 0),
(2530, 290, '陈仓区', 0),
(2531, 290, '凤翔县', 0),
(2532, 290, '岐山县', 0),
(2533, 290, '扶风县', 0),
(2534, 290, '眉县', 0),
(2535, 290, '陇县', 0),
(2536, 290, '千阳县', 0),
(2537, 290, '麟游县', 0),
(2538, 290, '凤县', 0),
(2539, 290, '太白县', 0),
(2540, 291, '秦都区', 0),
(2541, 291, '杨凌区', 0),
(2542, 291, '渭城区', 0),
(2543, 291, '三原县', 0),
(2544, 291, '泾阳县', 0),
(2545, 291, '乾县', 0),
(2546, 291, '礼泉县', 0),
(2547, 291, '永寿县', 0),
(2548, 291, '彬县', 0),
(2549, 291, '长武县', 0),
(2550, 291, '旬邑县', 0),
(2551, 291, '淳化县', 0),
(2552, 291, '武功县', 0),
(2553, 291, '兴平市', 0),
(2554, 292, '临渭区', 0),
(2555, 292, '华县', 0),
(2556, 292, '潼关县', 0),
(2557, 292, '大荔县', 0),
(2558, 292, '合阳县', 0),
(2559, 292, '澄城县', 0),
(2560, 292, '蒲城县', 0),
(2561, 292, '白水县', 0),
(2562, 292, '富平县', 0),
(2563, 292, '韩城市', 0),
(2564, 292, '华阴市', 0),
(2565, 293, '宝塔区', 0),
(2566, 293, '延长县', 0),
(2567, 293, '延川县', 0),
(2568, 293, '子长县', 0),
(2569, 293, '安塞县', 0),
(2570, 293, '志丹县', 0),
(2571, 293, '吴旗县', 0),
(2572, 293, '甘泉县', 0),
(2573, 293, '富县', 0),
(2574, 293, '洛川县', 0),
(2575, 293, '宜川县', 0),
(2576, 293, '黄龙县', 0),
(2577, 293, '黄陵县', 0),
(2578, 294, '汉台区', 0),
(2579, 294, '南郑县', 0),
(2580, 294, '城固县', 0),
(2581, 294, '洋县', 0),
(2582, 294, '西乡县', 0),
(2583, 294, '勉县', 0),
(2584, 294, '宁强县', 0),
(2585, 294, '略阳县', 0),
(2586, 294, '镇巴县', 0),
(2587, 294, '留坝县', 0),
(2588, 294, '佛坪县', 0),
(2589, 295, '榆阳区', 0),
(2590, 295, '神木县', 0),
(2591, 295, '府谷县', 0),
(2592, 295, '横山县', 0),
(2593, 295, '靖边县', 0),
(2594, 295, '定边县', 0),
(2595, 295, '绥德县', 0),
(2596, 295, '米脂县', 0),
(2597, 295, '佳县', 0),
(2598, 295, '吴堡县', 0),
(2599, 295, '清涧县', 0),
(2600, 295, '子洲县', 0),
(2601, 296, '汉滨区', 0),
(2602, 296, '汉阴县', 0),
(2603, 296, '石泉县', 0),
(2604, 296, '宁陕县', 0),
(2605, 296, '紫阳县', 0),
(2606, 296, '岚皋县', 0),
(2607, 296, '平利县', 0),
(2608, 296, '镇坪县', 0),
(2609, 296, '旬阳县', 0),
(2610, 296, '白河县', 0),
(2611, 297, '商州区', 0),
(2612, 297, '洛南县', 0),
(2613, 297, '丹凤县', 0),
(2614, 297, '商南县', 0),
(2615, 297, '山阳县', 0),
(2616, 297, '镇安县', 0),
(2617, 297, '柞水县', 0),
(2618, 298, '城关区', 0),
(2619, 298, '七里河区', 0),
(2620, 298, '西固区', 0),
(2621, 298, '安宁区', 0),
(2622, 298, '红古区', 0),
(2623, 298, '永登县', 0),
(2624, 298, '皋兰县', 0),
(2625, 298, '榆中县', 0),
(2626, 300, '金川区', 0),
(2627, 300, '永昌县', 0),
(2628, 301, '白银区', 0),
(2629, 301, '平川区', 0),
(2630, 301, '靖远县', 0),
(2631, 301, '会宁县', 0),
(2632, 301, '景泰县', 0),
(2633, 302, '秦城区', 0),
(2634, 302, '北道区', 0),
(2635, 302, '清水县', 0),
(2636, 302, '秦安县', 0),
(2637, 302, '甘谷县', 0),
(2638, 302, '武山县', 0),
(2639, 302, '张家川回族自治县', 0),
(2640, 303, '凉州区', 0),
(2641, 303, '民勤县', 0),
(2642, 303, '古浪县', 0),
(2643, 303, '天祝藏族自治县', 0),
(2644, 304, '甘州区', 0),
(2645, 304, '肃南裕固族自治县', 0),
(2646, 304, '民乐县', 0),
(2647, 304, '临泽县', 0),
(2648, 304, '高台县', 0),
(2649, 304, '山丹县', 0),
(2650, 305, '崆峒区', 0),
(2651, 305, '泾川县', 0),
(2652, 305, '灵台县', 0),
(2653, 305, '崇信县', 0),
(2654, 305, '华亭县', 0),
(2655, 305, '庄浪县', 0),
(2656, 305, '静宁县', 0),
(2657, 306, '肃州区', 0),
(2658, 306, '金塔县', 0),
(2659, 306, '安西县', 0),
(2660, 306, '肃北蒙古族自治县', 0),
(2661, 306, '阿克塞哈萨克族自治县', 0),
(2662, 306, '玉门市', 0),
(2663, 306, '敦煌市', 0),
(2664, 307, '西峰区', 0),
(2665, 307, '庆城县', 0),
(2666, 307, '环县', 0),
(2667, 307, '华池县', 0),
(2668, 307, '合水县', 0),
(2669, 307, '正宁县', 0),
(2670, 307, '宁县', 0),
(2671, 307, '镇原县', 0),
(2672, 308, '安定区', 0),
(2673, 308, '通渭县', 0),
(2674, 308, '陇西县', 0),
(2675, 308, '渭源县', 0),
(2676, 308, '临洮县', 0),
(2677, 308, '漳县', 0),
(2678, 308, '岷县', 0),
(2679, 309, '武都区', 0),
(2680, 309, '成县', 0),
(2681, 309, '文县', 0),
(2682, 309, '宕昌县', 0),
(2683, 309, '康县', 0),
(2684, 309, '西和县', 0),
(2685, 309, '礼县', 0),
(2686, 309, '徽县', 0),
(2687, 309, '两当县', 0),
(2688, 310, '临夏市', 0),
(2689, 310, '临夏县', 0),
(2690, 310, '康乐县', 0),
(2691, 310, '永靖县', 0),
(2692, 310, '广河县', 0),
(2693, 310, '和政县', 0),
(2694, 310, '东乡族自治县', 0),
(2695, 310, '积石山保安族东乡族撒拉族自治县', 0),
(2696, 311, '合作市', 0),
(2697, 311, '临潭县', 0),
(2698, 311, '卓尼县', 0),
(2699, 311, '舟曲县', 0),
(2700, 311, '迭部县', 0),
(2701, 311, '玛曲县', 0),
(2702, 311, '碌曲县', 0),
(2703, 311, '夏河县', 0),
(2704, 312, '城东区', 0),
(2705, 312, '城中区', 0),
(2706, 312, '城西区', 0),
(2707, 312, '城北区', 0),
(2708, 312, '大通回族土族自治县', 0),
(2709, 312, '湟中县', 0),
(2710, 312, '湟源县', 0),
(2711, 313, '平安县', 0),
(2712, 313, '民和回族土族自治县', 0),
(2713, 313, '乐都县', 0),
(2714, 313, '互助土族自治县', 0),
(2715, 313, '化隆回族自治县', 0),
(2716, 313, '循化撒拉族自治县', 0),
(2717, 314, '门源回族自治县', 0),
(2718, 314, '祁连县', 0),
(2719, 314, '海晏县', 0),
(2720, 314, '刚察县', 0),
(2721, 315, '同仁县', 0),
(2722, 315, '尖扎县', 0),
(2723, 315, '泽库县', 0),
(2724, 315, '河南蒙古族自治县', 0),
(2725, 316, '共和县', 0),
(2726, 316, '同德县', 0),
(2727, 316, '贵德县', 0),
(2728, 316, '兴海县', 0),
(2729, 316, '贵南县', 0),
(2730, 317, '玛沁县', 0),
(2731, 317, '班玛县', 0),
(2732, 317, '甘德县', 0),
(2733, 317, '达日县', 0),
(2734, 317, '久治县', 0),
(2735, 317, '玛多县', 0),
(2736, 318, '玉树县', 0),
(2737, 318, '杂多县', 0),
(2738, 318, '称多县', 0),
(2739, 318, '治多县', 0),
(2740, 318, '囊谦县', 0),
(2741, 318, '曲麻莱县', 0),
(2742, 319, '格尔木市', 0),
(2743, 319, '德令哈市', 0),
(2744, 319, '乌兰县', 0),
(2745, 319, '都兰县', 0),
(2746, 319, '天峻县', 0),
(2747, 320, '兴庆区', 0),
(2748, 320, '西夏区', 0),
(2749, 320, '金凤区', 0),
(2750, 320, '永宁县', 0),
(2751, 320, '贺兰县', 0),
(2752, 320, '灵武市', 0),
(2753, 321, '大武口区', 0),
(2754, 321, '惠农区', 0),
(2755, 321, '平罗县', 0),
(2756, 322, '利通区', 0),
(2757, 322, '盐池县', 0),
(2758, 322, '同心县', 0),
(2759, 322, '青铜峡市', 0),
(2760, 323, '原州区', 0),
(2761, 323, '西吉县', 0),
(2762, 323, '隆德县', 0),
(2763, 323, '泾源县', 0),
(2764, 323, '彭阳县', 0),
(2765, 324, '沙坡头区', 0),
(2766, 324, '中宁县', 0),
(2767, 324, '海原县', 0),
(2768, 325, '天山区', 0),
(2769, 325, '沙依巴克区', 0),
(2770, 325, '新市区', 0),
(2771, 325, '水磨沟区', 0),
(2772, 325, '头屯河区', 0),
(2773, 325, '达坂城区', 0),
(2774, 325, '东山区', 0),
(2775, 325, '乌鲁木齐县', 0),
(2776, 326, '独山子区', 0),
(2777, 326, '克拉玛依区', 0),
(2778, 326, '白碱滩区', 0),
(2779, 326, '乌尔禾区', 0),
(2780, 327, '吐鲁番市', 0),
(2781, 327, '鄯善县', 0),
(2782, 327, '托克逊县', 0),
(2783, 328, '哈密市', 0),
(2784, 328, '巴里坤哈萨克自治县', 0),
(2785, 328, '伊吾县', 0),
(2786, 329, '昌吉市', 0),
(2787, 329, '阜康市', 0),
(2788, 329, '米泉市', 0),
(2789, 329, '呼图壁县', 0),
(2790, 329, '玛纳斯县', 0),
(2791, 329, '奇台县', 0),
(2792, 329, '吉木萨尔县', 0),
(2793, 329, '木垒哈萨克自治县', 0),
(2794, 330, '博乐市', 0),
(2795, 330, '精河县', 0),
(2796, 330, '温泉县', 0),
(2797, 331, '库尔勒市', 0),
(2798, 331, '轮台县', 0),
(2799, 331, '尉犁县', 0),
(2800, 331, '若羌县', 0),
(2801, 331, '且末县', 0),
(2802, 331, '焉耆回族自治县', 0),
(2803, 331, '和静县', 0),
(2804, 331, '和硕县', 0),
(2805, 331, '博湖县', 0),
(2806, 332, '阿克苏市', 0),
(2807, 332, '温宿县', 0),
(2808, 332, '库车县', 0),
(2809, 332, '沙雅县', 0),
(2810, 332, '新和县', 0),
(2811, 332, '拜城县', 0),
(2812, 332, '乌什县', 0),
(2813, 332, '阿瓦提县', 0),
(2814, 332, '柯坪县', 0),
(2815, 333, '阿图什市', 0),
(2816, 333, '阿克陶县', 0),
(2817, 333, '阿合奇县', 0),
(2818, 333, '乌恰县', 0),
(2819, 334, '喀什市', 0),
(2820, 334, '疏附县', 0),
(2821, 334, '疏勒县', 0),
(2822, 334, '英吉沙县', 0),
(2823, 334, '泽普县', 0),
(2824, 334, '莎车县', 0),
(2825, 334, '叶城县', 0),
(2826, 334, '麦盖提县', 0),
(2827, 334, '岳普湖县', 0),
(2828, 334, '伽师县', 0),
(2829, 334, '巴楚县', 0),
(2830, 334, '塔什库尔干塔吉克自治县', 0),
(2831, 335, '和田市', 0),
(2832, 335, '和田县', 0),
(2833, 335, '墨玉县', 0),
(2834, 335, '皮山县', 0),
(2835, 335, '洛浦县', 0),
(2836, 335, '策勒县', 0),
(2837, 335, '于田县', 0),
(2838, 335, '民丰县', 0),
(2839, 336, '伊宁市', 0),
(2840, 336, '奎屯市', 0),
(2841, 336, '伊宁县', 0),
(2842, 336, '察布查尔锡伯自治县', 0),
(2843, 336, '霍城县', 0),
(2844, 336, '巩留县', 0),
(2845, 336, '新源县', 0),
(2846, 336, '昭苏县', 0),
(2847, 336, '特克斯县', 0),
(2848, 336, '尼勒克县', 0),
(2849, 337, '塔城市', 0),
(2850, 337, '乌苏市', 0),
(2851, 337, '额敏县', 0),
(2852, 337, '沙湾县', 0),
(2853, 337, '托里县', 0),
(2854, 337, '裕民县', 0),
(2855, 337, '和布克赛尔蒙古自治县', 0),
(2856, 338, '阿勒泰市', 0),
(2857, 338, '布尔津县', 0),
(2858, 338, '富蕴县', 0),
(2859, 338, '福海县', 0),
(2860, 338, '哈巴河县', 0),
(2861, 338, '青河县', 0),
(2862, 338, '吉木乃县', 0),
(2867, 352, '宛平县', 1),
(2868, 352, '111111', 5),
(2869, 345, '台北', 2);

-- --------------------------------------------------------

--
-- 表的结构 `sys_hooks`
--

CREATE TABLE IF NOT EXISTS `sys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型  1 视图 2 控制器',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(2) DEFAULT '1',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=65 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `sys_hooks`
--

INSERT INTO `sys_hooks` (`id`, `name`, `description`, `type`, `addons`, `status`, `update_time`) VALUES
(23, 'login', '第三方登录', 1, 'Oauthlogin', 1, 1499327900),
(24, 'sms', '短信', 1, 'sms', 1, 1499487808),
(26, 'wxtemplatemsg', '微信模板消息设置', 1, 'wxtemplatemsg', 1, 1500013768),
(27, 'orderCreateSuccess', '订单创建成功', 2, 'wxtemplatemsg', 1, 1500025515),
(29, 'orderDeliverySuccess', '订单发货成功', 2, 'wxtemplatemsg', 1, 1500448695),
(30, 'orderPaySuccess', '订单付款成功', 2, 'wxtemplatemsg', 1, 1500448963),
(31, 'orderRefundApplyCreateSuccess', '订单申请退款创建成功', 2, 'wxtemplatemsg', 1, 1500449386),
(32, 'orderRefundSuccess', '订单退款成功', 2, 'wxtemplatemsg', 1, 1500450437),
(33, 'userWithdrawApplyCreateSuccess', '会员提现申请创建成功', 2, 'wxtemplatemsg', 1, 1500450601),
(34, 'userLoginSuccess', '用户登陆成功', 2, '', 1, 1500619318),
(35, 'userAddSuccess', '基础用户添加成功后', 2, '', 1, 1500619587),
(36, 'memberRegisterSuccess', '会员注册成功', 2, '', 1, 1500619688),
(37, 'memberLevelSaveSuccess', '会员等级保存成功', 2, '', 1, 1500620008),
(38, 'memberWithdrawApplyCreateSuccess', '会员提现申请创建成功', 2, 'wxtemplatemsg', 1, 1500620146),
(39, 'memberWithdrawAuditAgree', '会员提现审核通过', 2, 'wxtemplatemsg', 1, 1500620297),
(40, 'goodsSaveSuccess', '商品保存成功', 2, '', 1, 1500620784),
(41, 'goodsSaveBefore', '商品保存之前', 2, '', 1, 1500620803),
(42, 'goodsDeleteBefore', '商品删除之前', 2, '', 1, 1500621085),
(43, 'goodsDeleteSuccess', '商品删除成功', 2, '', 1, 1500621109),
(44, 'goodsOnlineSuccess', '商品上架成功', 2, '', 1, 1500621131),
(45, 'goodsOfflineSuccess', '商品下架成功', 2, '', 1, 1500621142),
(55, 'goodsCategorySaveSuccess', '商品分类保存成功', 2, '', 1, 1500621379),
(56, 'goodsCategoryDeleteSuccess', '商品分类删除成功', 2, '', 1, 1500621397),
(57, 'goodsBrandSaveSuccess', '商品品牌保存成功', 2, '', 1, 1500621414),
(58, 'goodsBrandDeleteSuccess', '商品品牌删除成功', 2, '', 1, 1500621428),
(59, 'goodsGroupSaveSuccess', '商品分组保存成功', 2, '', 1, 1500621441),
(60, 'goodsGroupDeleteSuccess', '商品分组删除成功', 2, '', 1, 1500621455),
(61, 'goodsSpecSaveSuccess', '商品规格保存成功', 2, '', 1, 1500621470),
(62, 'goodsSpecDeleteSuccess', '商品规格删除成功', 2, '', 1, 1500621483),
(63, 'goodsAttributeSaveSuccess', '商品类型保存成功', 2, '', 1, 1500621495),
(64, 'goodsAttributeDeleteSuccess', '商品类型删除成功', 2, '', 1, 1500621506);

-- --------------------------------------------------------

--
-- 表的结构 `sys_instance`
--

CREATE TABLE IF NOT EXISTS `sys_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT '2' COMMENT '实例类型ID',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text COMMENT '实例简介',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='系统实例表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sys_instance`
--

INSERT INTO `sys_instance` (`instance_id`, `instance_name`, `instance_typeid`, `qrcode`, `remark`, `create_time`) VALUES
(26, 'Niushop开源商城', 1, '', '''''', 1477541018),
(27, '招标文件', 2, '', NULL, 1555569345),
(28, '怪化猫', 2, '', NULL, 1555570488),
(29, '41234213', 2, '', NULL, 1555742949);

-- --------------------------------------------------------

--
-- 表的结构 `sys_instance_type`
--

CREATE TABLE IF NOT EXISTS `sys_instance_type` (
  `instance_typeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`instance_typeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='实例类型' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sys_instance_type`
--

INSERT INTO `sys_instance_type` (`instance_typeid`, `type_name`, `type_module_array`, `type_desc`, `type_sort`, `create_time`, `modify_time`) VALUES
(1, '旗舰店', '467,515,149,150,151,171,210,172,479,481,480,10001,10002,10003,334,478,139,169,516,517,184,185,190,194,189,533,487,534,191,192,471,472,528,529,530,179,180,186,187,446,508,195,196,197,198,199,200,201,202,203,469,218,418,10006,678,680,679,10025,126,127,360,144,128,133,398,409,684,726,729,730,732,727,459,463,460,461,462,454,457,403,405,10000,120,121,129,122,123', '', 0, 1510025623, 1511926990),
(2, '普通店铺', '467,515,149,150,151,171,210,172,10001,10002,10003,334,478,139,169,516,517,184,185,190,194,189,533,487,534,191,192,471,472,528,529,530,179,180,186,187,446,508,195,196,197,198,199,200,201,202,203,469,218,10055,10057,10059,418,10006,678,680,679,10022,10023,10024,10025,474,519,126,127,360,144,128,133,398,409,684,726,729,730,732,727,459,463,460,461,462,454,457,403,405,120,121,129,122,123', '', 1, 1510296625, 1510296625);

-- --------------------------------------------------------

--
-- 表的结构 `sys_module`
--

CREATE TABLE IF NOT EXISTS `sys_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `desc` text COMMENT '模块描述',
  `module_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '模块图片',
  `icon_class` varchar(255) NOT NULL DEFAULT '' COMMENT '矢量图class',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否控制权限',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='系统模块表' AUTO_INCREMENT=10100 ;

--
-- 转存表中的数据 `sys_module`
--

INSERT INTO `sys_module` (`module_id`, `module_name`, `module`, `controller`, `method`, `pid`, `level`, `url`, `is_menu`, `is_dev`, `sort`, `desc`, `module_picture`, `icon_class`, `is_control_auth`, `create_time`, `modify_time`) VALUES
(120, '系统', 'admin', 'system', 'modulelist', 0, 1, 'system/modulelist', 1, 0, 999, '''''', '', '', 1, 0, 0),
(121, '模块列表', 'admin', 'system', 'modulelist', 120, 2, 'system/modulelist', 1, 0, 2, '''''', '', '', 1, 0, 0),
(122, '添加模块', 'admin', 'system', 'addmodule', 121, 3, 'system/addmodule', 0, 0, 1, '添加模块', '', '', 1, 0, 0),
(123, '修改模块', 'admin', 'system', 'editmodule', 121, 3, 'system/editmodule', 0, 0, 2, '修改模块', '', '', 1, 0, 0),
(126, '用户', 'admin', 'auth', 'userlist', 0, 1, 'auth/userlist', 1, 0, 9, '', '', '', 1, 0, 0),
(127, '用户列表', 'admin', 'auth', 'userlist', 126, 2, 'auth/userlist', 1, 0, 0, NULL, '', '', 1, 0, 0),
(128, '用户组列表', 'admin', 'auth', 'authgrouplist', 126, 2, 'auth/authgrouplist', 1, 0, 0, '用户组', '', '', 1, 0, 0),
(129, '删除模块', 'admin', 'system', 'delmodule', 121, 3, 'system/delmodule', 0, 0, 0, '模块列表', '', '', 1, 0, 0),
(133, '添加用户组', 'admin', 'auth', 'addusergroup', 128, 3, 'auth/addusergroup', 0, 0, 2, '用户组', '', '', 1, 0, 0),
(139, '相册管理', 'admin', 'system', 'albumlist', 149, 2, 'system/albumlist', 1, 0, 10, '相册管理', '', '', 1, 0, 0),
(144, '编辑用户', 'admin', 'auth', 'edituser', 127, 3, 'auth/edituser', 0, 0, 5, '用户', '', '', 1, 0, 0),
(149, '商品', 'admin', 'goods', 'goodslist', 0, 1, 'goods/goodslist', 1, 0, 1, '商品模块', '', '', 1, 0, 0),
(150, '商品列表', 'admin', 'goods', 'goodslist', 149, 2, 'goods/goodslist', 1, 0, 1, '商品列表', '', '', 0, 0, 0),
(151, '商品发布', 'admin', 'goods', 'addgoods', 149, 2, 'goods/addgoods', 1, 0, 2, '商品发布', '', '', 1, 0, 0),
(169, '图片管理', 'admin', 'system', 'albumpicturelist', 139, 3, 'system/albumpicturelist', 0, 0, 5, 'sfgsdf', '', '', 1, 0, 0),
(171, '商品标签', 'admin', 'goods', 'goodsgrouplist', 149, 2, 'goods/goodsgrouplist', 1, 0, 3, '商品分组', '', '', 1, 0, 0),
(172, '添加商品标签', 'admin', 'goods', 'addgoodsgroup', 171, 3, 'goods/addgoodsgroup', 0, 0, 6, '添加商品分组', '', '', 1, 0, 0),
(179, '营销', 'admin', 'promotion', 'coupontypelist', 0, 1, 'promotion/coupontypelist', 1, 0, 3, '优惠券类型列表', '', '', 1, 0, 0),
(180, '优惠券', 'admin', 'promotion', 'coupontypelist', 179, 2, 'promotion/coupontypelist', 1, 0, 1, '优惠券类型列表', '', '', 1, 0, 0),
(184, '订单', 'admin', 'order', 'orderlist', 0, 1, 'order/orderlist', 1, 0, 2, '订单列表', '', '', 1, 0, 0),
(185, '订单列表', 'admin', 'order', 'orderlist', 184, 2, 'order/orderlist', 1, 0, 1, '订单列表', '', '', 1, 0, 0),
(186, '添加优惠券', 'admin', 'promotion', 'addcoupontype', 180, 3, 'promotion/addcoupontype', 1, 0, 2, '添加优惠券类型', '', '', 1, 0, 0),
(187, '修改优惠券', 'admin', 'promotion', 'updatecoupontype', 180, 3, 'promotion/updatecoupontype', 1, 0, 3, '修改优惠券类型', '', '', 1, 0, 0),
(189, '物流公司', 'admin', 'express', 'expresscompany', 184, 2, 'express/expresscompany', 1, 0, 4, '物流公司', '', '', 1, 0, 0),
(190, '订单详情', 'admin', 'order', 'orderdetail', 185, 3, 'order/orderdetail', 0, 0, 1, '订单详情', '', '', 1, 0, 0),
(191, '添加物流公司', 'admin', 'express', 'addexpresscompany', 189, 3, 'express/addexpresscompany', 1, 0, 3, '添加物流公司', '', '', 1, 0, 0),
(192, '物流公司修改', 'admin', 'express', 'updateexpresscompany', 189, 3, 'express/updateexpresscompany', 1, 0, 4, '物流公司修改排序', '', '', 1, 0, 0),
(194, '退款详情', 'admin', 'order', 'orderrefunddetail', 185, 3, 'order/orderrefunddetail', 0, 0, 2, '退款详情', '', '', 1, 0, 0),
(195, '赠品', 'admin', 'promotion', 'giftlist', 179, 2, 'promotion/giftlist', 0, 0, 3, '', '', '', 1, 0, 0),
(196, '添加赠品', 'admin', 'promotion', 'addgift', 195, 3, 'promotion/addgift', 1, 0, 0, '添加赠品', '', '', 1, 0, 0),
(197, '修改赠品', 'admin', 'promotion', 'updategift', 195, 3, 'promotion/updategift', 1, 0, 0, '修改赠品', '', '', 1, 0, 0),
(198, '满减送', 'admin', 'promotion', 'mansonglist', 179, 2, 'promotion/mansonglist', 1, 0, 4, '满减送', '', '', 1, 0, 0),
(199, '添加满减满送', 'admin', 'promotion', 'addmansong', 198, 3, 'promotion/addmansong', 1, 0, 0, '满减送', '', '', 1, 0, 0),
(200, '编辑满减送', 'admin', 'promotion', 'updatemansong', 198, 3, 'promotion/updatemansong', 1, 0, 1, '编辑满减送', '', '', 1, 0, 0),
(201, '限时折扣', 'admin', 'promotion', 'getdiscountlist', 179, 2, 'promotion/getdiscountlist', 1, 0, 5, '限时折扣', '', '', 1, 0, 0),
(202, '添加限时折扣', 'admin', 'promotion', 'adddiscount', 201, 3, 'promotion/adddiscount', 1, 0, 0, '添加限时折扣', '', '', 1, 0, 0),
(203, '修改限时折扣', 'admin', 'promotion', 'updatediscount', 201, 3, 'promotion/updatediscount', 1, 0, 1, '修改限时折扣', '', '', 1, 0, 0),
(210, '修改商品标签', 'admin', 'goods', 'updategoodsgroup', 171, 3, 'goods/updategoodsgroup', 0, 0, 2, '修改商品分组', '', '', 1, 0, 0),
(218, '店铺', 'admin', 'shop', 'shopconfig', 0, 1, 'shop/shopconfig', 1, 0, 6, '店铺设置', '', '', 1, 0, 0),
(334, '咨询管理', 'admin', 'saleservice', 'consultlist', 149, 2, 'saleservice/consultlist', 1, 0, 8, '咨询管理，未回复咨询，已回复咨询', '', '', 1, 0, 0),
(360, '添加用户', 'admin', 'auth', 'adduser', 127, 3, 'auth/adduser', 0, 0, 1, '添加用户', '', '', 1, 0, 0),
(398, '个人资料', 'admin', 'auth', 'userdetail', 126, 2, 'auth/userdetail', 1, 0, 0, '个人资料', '', '', 0, 0, 0),
(403, '销售排行', 'admin', 'account', 'shopgoodssalesrank', 409, 2, 'account/shopgoodssalesrank', 1, 0, 9, '商品销售排行', '', '', 1, 0, 0),
(405, '商品销售统计', 'admin', 'account', 'shopgoodsaccountlist', 403, 3, 'account/shopgoodsaccountlist', 0, 0, 6, '商品销售统计', '', '', 1, 0, 0),
(409, '资产', 'admin', 'account', 'shopaccount', 0, 1, 'account/shopsalesaccount', 1, 0, 11, '资产', '', '', 1, 0, 0),
(418, '店铺设置', 'admin', 'shop', 'shopconfig', 218, 2, 'shop/shopconfig', 1, 0, 1, '', '', '', 1, 0, 0),
(430, '友情链接', 'admin', 'config', 'linklist', 477, 2, 'config/linklist', 1, 0, 13, '友情链接', '', '', 1, 0, 0),
(445, '首页公告', 'admin', 'config', 'usernotice', 477, 2, 'config/usernotice', 1, 0, 19, 'userNotice', '', '', 1, 0, 0),
(446, '积分管理', 'admin', 'promotion', 'pointconfig', 179, 2, 'promotion/pointconfig', 0, 0, 1, '1', '', '', 1, 0, 0),
(447, '粉丝列表', 'admin', 'member', 'weixinfanslist', 137, 2, 'member/weixinfanslist', 1, 0, 2, '粉丝列表', '', '', 1, 0, 0),
(450, '修改消息素材', 'admin', 'wchat', 'updatemedia', 342, 3, 'wchat/updatemedia', 1, 0, 1, '', '', '', 1, 0, 0),
(451, '添加消息素材', 'admin', 'wchat', 'addmedia', 342, 3, 'wchat/addmedia', 1, 0, 1, '', '', '', 1, 0, 0),
(454, '销售统计', 'admin', 'account', 'orderaccountcount', 409, 2, 'account/orderaccountcount', 0, 0, 6, '', '', '', 1, 0, 0),
(457, '销售明细', 'admin', 'account', 'orderrecordslist', 454, 3, 'account/orderrecordslist', 0, 0, 2, '', '', '', 1, 0, 0),
(459, '销售概况', 'admin', 'account', 'shopsalesaccount', 409, 2, 'account/shopsalesaccount', 1, 0, 1, '', '', '', 1, 0, 0),
(460, '热卖商品', 'admin', 'account', 'bestsellergoods', 463, 3, 'account/bestsellergoods', 0, 0, 1, '', '', '', 1, 0, 0),
(461, '同行热卖', 'admin', 'account', 'shopgoodsgroupsalecount', 409, 2, 'account/shopgoodsgroupsalecount', 0, 0, 4, '', '', '', 0, 0, 0),
(462, '运营报告', 'admin', 'account', 'shopreport', 409, 2, 'account/shopreport', 1, 0, 5, '', '', '', 1, 0, 0),
(463, '商品分析', 'admin', 'account', 'shopgoodssaleslist', 409, 2, 'account/shopgoodssaleslist', 1, 0, 2, '', '', '', 1, 0, 0),
(467, '首页', 'admin', 'index', 'index', 0, 1, 'index/index', 1, 0, 0, '', '', '', 1, 0, 0),
(469, '满额包邮', 'admin', 'promotion', 'fullshipping', 179, 2, 'promotion/fullshipping', 1, 0, 6, '满额包邮设置', '', '', 1, 0, 0),
(471, '商家地址', 'admin', 'order', 'returnsetting', 184, 2, 'order/returnsetting', 1, 0, 5, '退货设置', '', '', 1, 0, 0),
(472, '添加或修改', 'admin', 'order', 'addreturn', 471, 3, 'order/addreturn', 1, 0, 1, '添加退货', '', '', 1, 0, 0),
(478, '商品评价', 'admin', 'goods', 'goodscomment', 149, 2, 'goods/goodscomment', 1, 0, 8, '', '', '', 1, 0, 0),
(479, '商品规格', 'admin', 'goods', 'goodsspeclist', 149, 2, 'goods/goodsspeclist', 1, 0, 6, '商品规格', '', '', 1, 1496314078, 1496368479),
(480, '添加商品规格', 'admin', 'goods', 'addgoodsspec', 479, 3, 'goods/addgoodsspec', 0, 0, 1, '', '', '', 1, 1496368895, 0),
(481, '修改商品规格', 'admin', 'goods', 'updategoodsspec', 479, 3, 'goods/updategoodsspec', 0, 0, 0, '', '', '', 1, 1496386955, 0),
(487, '模板编辑', 'admin', 'express', 'expresstemplate', 189, 3, 'express/expresstemplate', 0, 0, 1, '', '', '', 1, 0, 0),
(506, '模板管理', 'admin', 'config', 'notifytemplate', 439, 3, 'config/notifytemplate', 0, 0, 0, '', '', '', 1, 0, 0),
(508, '积分奖励', 'admin', 'promotion', 'integral', 446, 3, 'promotion/integral', 0, 0, 0, '', '', '', 0, 0, 0),
(509, '积分管理', 'admin', 'member', 'pointlist', 137, 2, 'member/pointlist', 1, 0, 5, '', '', '', 1, 0, 0),
(515, '欢迎页', 'admin', 'index', 'index', 467, 2, 'index/index', 1, 0, 0, '欢迎页', '', '', 1, 0, 0),
(516, '商品回收站', 'admin', 'goods', 'recycle', 149, 2, 'goods/recyclelist', 1, 0, 11, '', '', '', 1, 0, 0),
(517, '回收站列表', 'admin', 'goods', 'recyclelist', 516, 3, 'goods/recyclelist', 0, 0, 0, '', '', '', 1, 0, 0),
(528, '自提点管理', 'admin', 'shop', 'pickuppointlist', 184, 2, 'shop/pickuppointlist', 1, 0, 6, '', '', '', 1, 0, 0),
(529, '添加自提点', 'admin', 'shop', 'addpickuppoint', 528, 3, 'shop/addpickuppoint', 0, 0, 0, '', '', '', 1, 0, 0),
(530, '修改自提点', 'admin', 'shop', 'updatepickuppoint', 528, 3, 'shop/updatepickuppoint', 0, 0, 0, '', '', '', 1, 0, 0),
(532, '在线更新', 'admin', 'upgrade', 'onlineupdate', 477, 2, 'upgrade/onlineupdate', 1, 0, 30, '在线更新', '', '', 1, 0, 0),
(533, '运费模板列表', 'admin', 'express', 'freighttemplatelist', 189, 3, 'express/freighttemplatelist', 0, 0, 0, '', '', '', 1, 0, 0),
(534, '编辑运费模板', 'admin', 'express', 'freighttemplateedit', 189, 3, 'express/freighttemplateedit', 0, 0, 2, '', '', '', 1, 0, 0),
(535, '系统', 'platform', 'system', 'modulelist', 0, 1, 'system/modulelist', 1, 0, 166, '''''', 'upload/admin/common/1486625826.png', 'icon-system', 0, 0, 0),
(536, '修改模块', 'platform', 'system', 'editmodule', 537, 3, 'system/editmodule', 0, 0, 2, '修改模块', '', '', 1, 0, 0),
(537, '模块列表', 'platform', 'system', 'modulelist', 535, 2, 'system/modulelist', 1, 0, 2, '''''', '', '', 1, 0, 0),
(538, '添加模块', 'platform', 'system', 'addmodule', 537, 3, 'system/addmodule', 0, 0, 2, '添加模块', '', '', 1, 0, 0),
(539, '用户', 'platform', 'auth', 'userlist', 0, 1, 'auth/userlist', 1, 0, 2, '该页面显示所有用户的相关信息。///可以对用户进行添加、修改操作。', 'upload/admin/1484650661.jpg', '', 1, 0, 1511939642),
(540, '用户列表', 'platform', 'auth', 'userlist', 539, 2, 'auth/userlist', 1, 0, 0, '0', '', '', 1, 0, 0),
(541, '用户组列表', 'platform', 'auth', 'authgrouplist', 539, 2, 'auth/authgrouplist', 1, 0, 0, '该页面显示所有用户组的相关信息。///可以对用户组进行添加、修改等操作。', '', '', 1, 0, 0),
(542, '添加用户组', 'platform', 'Auth', 'addAuthGroup', 541, 3, 'Auth/addAuthGroup', 0, 0, 0, '用户组', '', '', 1, 0, 0),
(543, '编辑用户', 'platform', 'auth', 'edituser', 540, 3, 'auth/edituser', 0, 0, 5, '标识“&lt;em&gt;*&lt;/em&gt;”的选项为必填项，其余为选填项。', '', '', 1, 0, 0),
(544, '会员管理', 'platform', 'member', 'memberlist', 590, 2, 'member/memberlist', 1, 0, 3, '', '', 'icon-member', 1, 0, 0),
(545, '会员列表', 'platform', 'member', 'memberlist', 544, 2, 'member/memberlist', 1, 0, 0, '', '', '', 1, 0, 0),
(546, '文章', 'platform', 'cms', 'articlelist', 0, 1, 'cms/articlelist', 1, 0, 5, '该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。&amp;lt;br&amp;gt;', '', '', 1, 0, 1555646036),
(547, '平台', 'platform', 'index', 'index', 0, 1, 'index/index', 1, 0, 0, '', '', 'icon-mall', 1, 0, 0),
(548, '第三方登录', 'platform', 'config', 'partylogin', 652, 3, 'config/partylogin', 1, 0, 3, '', '', '', 1, 0, 0),
(549, '微信登录设置', 'platform', 'config', 'loginweixinconfig', 243, 3, 'config/loginweixinconfig', 0, 0, 2, '微信登录配置', '', '', 1, 0, 0),
(550, '添加广告位', 'platform', 'config', 'addplatformadvposition', 659, 3, 'config/addplatformadvposition', 0, 0, 0, '添加广告', '', '', 1, 0, 0),
(551, '编辑广告位', 'platform', 'config', 'updateplatformadvposition', 659, 3, 'config/updateplatformadvposition', 0, 0, 1, '编辑广告', '', '', 1, 0, 0),
(552, '导航管理', 'platform', 'config', 'shopnavigationlist', 547, 2, 'config/shopnavigationlist', 1, 0, 6, '导航管理', '', '', 1, 0, 0),
(553, '添加导航', 'platform', 'config', 'addshopnavigation', 552, 3, 'config/addshopnavigation', 0, 0, 3, '添加导航', '', '', 1, 0, 0),
(554, '修改导航', 'platform', 'config', 'updateshopnavigation', 552, 3, 'config/updateshopnavigation', 0, 0, 3, '修改导航', '', '', 1, 0, 0),
(555, '网站设置', 'platform', 'config', 'webconfig', 652, 3, 'config/webconfig', 1, 0, 0, '网站设置网站二维码设置，网站logo，网站基础设置。///网站提示测试查询', '', '', 1, 0, 0),
(556, '店铺管理', 'platform', 'shop', 'shoplist', 590, 2, 'shop/shoplist', 1, 0, 4, '展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。///可以修改店铺信息。', '', 'icon-shop', 1, 0, 0),
(557, '文章列表', 'platform', 'cms', 'articlelist', 546, 2, 'cms/articlelist', 1, 0, 1, '该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。', '', '', 1, 0, 0),
(558, '商品管理', 'platform', 'goods', 'goodslist', 590, 2, 'goods/goodslist', 1, 0, 0, '该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。', 'upload/admin/common/1487124888.png', 'icon-goods', 1, 0, 0),
(559, '商品分类', 'platform', 'goods', 'goodscategorylist', 558, 3, 'goods/goodscategorylist', 1, 0, 1, '展示了平台所有的商品分类。///可在列表直接增加下一级分类。///可在商品分类列表进行转移分类下的商品。///鼠标移动“设置”位置，可新增下一级分类、查看下一级分类、转移商品等操作。<br>', '', '', 1, 0, 0),
(560, '添加商品分类', 'platform', 'goods', 'addgoodscategory', 558, 3, 'goods/addgoodscategory', 0, 0, 3, '添加商品分类', '', '', 1, 0, 0),
(561, '修改商品分类', 'platform', 'goods', 'updategoodscategory', 558, 3, 'goods/updategoodscategory', 0, 0, 1, '修改商品分类', '', '', 1, 0, 0),
(562, '商品品牌', 'platform', 'goods', 'goodsbrandlist', 558, 3, 'goods/goodsbrandlist', 1, 0, 1, '展示了商城自营品牌的相关信息。///可以通过品牌关键字搜索相关品牌信息。', '', '', 1, 0, 0),
(563, '添加商品品牌', 'platform', 'goods', 'addgoodsbrand', 558, 3, 'goods/addgoodsbrand', 0, 0, 1, '带*为必填项，其余为选填项。', '', '', 1, 0, 0),
(564, '修改商品品牌', 'platform', 'goods', 'updategoodsbrand', 259, 3, 'goods/updategoodsbrand', 0, 0, 3, '修改品牌', '', '', 1, 0, 0),
(565, '店铺列表', 'platform', 'shop', 'shoplist', 556, 3, 'shop/shoplist', 1, 0, 1, '展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。', '', '', 1, 0, 0),
(566, '店铺审核', 'platform', 'shop', 'shopapplylist', 556, 3, 'shop/shopapplylist', 1, 0, 2, '该页面展示了所有店铺的信息。///可对店铺进行审核操作。', '', '', 1, 0, 0),
(567, '店铺等级', 'platform', 'shop', 'shoplevellist', 556, 3, 'shop/shoplevellist', 1, 0, 1, '该页面展示所有店铺等级的信息。///可以添加店铺等级、编辑店铺等级。', '', '', 1, 0, 0),
(568, '店铺分组', 'platform', 'shop', 'shopgrouplist', 556, 3, 'shop/shopgrouplist', 1, 0, 3, '该页面展示所有的店铺的分组。///可以通过关键字对分组进行查询。///可以添加、修改、删除分组。', '', '', 1, 0, 0),
(569, '友情链接', 'platform', 'config', 'linklist', 547, 2, 'config/linklist', 1, 0, 7, '友情链接', '', '', 1, 0, 0),
(570, '添加友情链接', 'platform', 'config', 'addlink', 569, 3, 'config/addlink', 0, 0, 0, '添加友情链接', '', '', 1, 0, 0),
(571, '修改友情链接', 'platform', 'config', 'updatelink', 569, 3, 'config/updatelink', 0, 0, 2, '修改友情链接', '', '', 1, 0, 0),
(572, '搜索设置', 'platform', 'config', 'searchconfig', 547, 2, 'config/searchconfig', 1, 0, 8, '搜索设置', '', '', 1, 0, 0),
(575, '分类列表', 'platform', 'cms', 'articleclasslist', 546, 2, 'cms/articleclasslist', 1, 0, 2, '该页面显示所有文章分类列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。', '', '', 1, 0, 0),
(577, '首页版块', 'platform', 'config', 'blocklist', 656, 3, 'config/blocklist', 1, 0, 0, '首页版块', '', '', 1, 0, 0),
(580, '商品管理', 'platform', 'goods', 'goodslist', 558, 3, 'goods/goodslist', 1, 0, 0, '该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。', '', '', 1, 0, 0),
(581, '支付配置', 'platform', 'config', 'paymentconfig', 652, 3, 'config/paymentconfig', 1, 0, 2, '支付配置，微信，支付宝', '', '', 1, 0, 0),
(582, '订单管理', 'platform', 'order', 'orderlist', 590, 2, 'order/orderlist', 1, 0, 1, '商城所有的订单列表，包括平台自营和入驻商家的订单。///点击订单号即可进入详情页面对订单进行操作。///Tab切换不同状态下的订单，便于分类订单。', '', 'icon-order', 1, 0, 0),
(583, '订单列表', 'platform', 'order', 'orderlist', 582, 2, 'order/orderlist', 0, 0, 3, '订单列表', '', '', 1, 0, 0),
(584, '添加店铺分组', 'platform', 'shop', 'addshopgroup', 556, 3, 'shop/addshopgroup', 0, 0, 1, '标识“<em>*</em>”的选项为必填项，其余为选填项。', 'upload/admin/common/1487300169.jpg', '', 1, 0, 0),
(585, '修改店铺分组', 'platform', 'shop', 'updateshopgroup', 556, 3, 'shop/updateshopgroup', 0, 0, 1, '标识“<em>*</em>”的选项为必填项，其余为选填项。', 'upload/admin/common/1487300248.jpg', '', 1, 0, 0),
(586, '添加店铺等级', 'platform', 'shop', 'addshoplevel', 556, 3, 'shop/addshoplevel', 0, 0, 1, '标识“<em>*</em>”的选项为必填项，其余为选填项。', '', '', 1, 0, 0),
(587, '审核详情', 'platform', 'shop', 'shopverify', 566, 3, 'shop/shopverify', 0, 0, 1, '店铺审核详情', '', '', 1, 0, 0),
(588, '帮助类型', 'platform', 'config', 'helpclass', 653, 3, 'config/helpclass', 1, 0, 2, '', '', '', 1, 0, 0),
(589, '帮助内容', 'platform', 'config', 'helpdocument', 653, 3, 'config/helpdocument', 1, 0, 1, '', '', '', 1, 0, 0),
(590, '商城', 'platform', 'goods', 'goodslist', 0, 1, 'goods/goodslist', 1, 0, 1, '控制台，首页', '', 'icon-index', 1, 0, 0),
(593, '统计', 'platform', 'statistics', 'userstat', 0, 1, 'statistics/userstat', 1, 0, 4, '统计，包括会员统计，店铺统计，销量统计，商品分析', '', '', 1, 0, 1510893321),
(594, '会员统计', 'platform', 'statistics', 'userstat', 593, 2, 'statistics/userstat', 1, 0, 1, '会员统计并用走势图直观呈现', '', '', 1, 0, 0),
(595, '店铺统计', 'platform', 'statistics', 'shopaccountlist', 593, 2, 'statistics/shopaccountlist', 1, 0, 1, '店铺统计并用走势图直观呈现', '', '', 1, 0, 0),
(596, '订单统计', 'platform', 'statistics', 'orderstat', 593, 2, 'statistics/orderstat', 1, 0, 2, '订单统计并用走势图直观呈现', '', '', 1, 0, 0),
(597, '商品分析', 'platform', 'statistics', 'goodsstat', 593, 2, 'statistics/goodsstat', 0, 0, 3, '商品分析统计并用走势图直观呈现', '', '', 1, 0, 0),
(598, '售后分析', 'platform', 'statistics', 'aftersale', 593, 2, 'statistics/aftersale', 0, 0, 4, '售后分析统计并用走势图直观呈现', '', '', 1, 0, 0),
(599, '统计概述', 'platform', 'statistics', 'statgeneral', 593, 2, 'statistics/statgeneral', 0, 0, 0, '统计并用走势图直观呈现', '', '', 0, 0, 0),
(605, '积分设置', 'platform', 'config', 'pointconfig', 652, 3, 'config/pointconfig', 1, 0, 9, '积分设置', '', '', 1, 0, 0),
(606, '添加用户', 'platform', 'auth', 'adduser', 540, 3, 'auth/adduser', 0, 0, 0, '标识“<em>*</em>”的选项为必填项，其余为选填项。', '', '', 1, 0, 0),
(607, '修改用户组', 'platform', 'Auth', 'updateAuthGroup', 541, 3, 'Auth/updateAuthGroup', 0, 0, 3, '修改用户组', '', '', 1, 0, 0),
(608, '邮箱短信', 'platform', 'config', 'notifyindex', 652, 3, 'config/notifyindex', 1, 0, 7, '邮箱设置，短信设置', '', '', 1, 0, 0),
(636, '微信', 'platform', 'wchat', 'config', 0, 1, 'wchat/config', 0, 0, 3, '该页面显示微信公众号的相关配置信息。', '', '', 1, 0, 1555567054),
(637, '公众号管理', 'platform', 'wchat', 'config', 636, 2, 'wchat/config', 1, 0, 0, '该页面显示微信公众号的相关配置信息。', '', '', 1, 0, 0),
(638, '微信菜单', 'platform', 'wchat', 'menu', 636, 2, 'wchat/menu', 1, 0, 0, '该页面显示微信菜单的全部信息。', '', '', 1, 0, 0),
(639, '推广二维码', 'platform', 'wchat', 'weixinqrcodetemplate', 636, 2, 'wchat/weixinqrcodetemplate', 1, 0, 0, '该页面显示已推广的所有二维码。///可以添加、修改、删除以及设为默认二维码。', '', '', 1, 0, 0),
(640, '回复设置', 'platform', 'wchat', 'replayconfig', 636, 2, 'wchat/replayconfig', 1, 0, 0, '该页面展示了所有的回复设置信息。///可以对回复进行添加、修改、删除操作。<br>', '', '', 1, 0, 0),
(641, '消息素材', 'platform', 'wchat', 'materialmessage', 636, 2, 'wchat/materialmessage', 1, 0, 0, '该页面展示了所有素材消息。//可以对素材进行添加、修改、删除操作。///可以通过关键字进行搜索。', '', '', 1, 0, 0),
(643, '分享内容', 'platform', 'wchat', 'shareconfig', 636, 2, 'wchat/shareconfig', 1, 0, 0, '该页面展示了分享内容的流程。', '', '', 1, 0, 0),
(644, '账务统计', 'platform', 'statistics', 'platformaccountrecordscountlist', 593, 2, 'statistics/platformaccountrecordscountlist', 0, 0, 7, '账务统计并用走势图直观呈现', 'upload/admin/common/1490758817.jpg', '', 1, 0, 0),
(645, '店铺提现', 'platform', 'shop', 'shopaccountwithdrawlist', 556, 3, 'shop/shopaccountwithdrawlist', 1, 0, 4, '显示所有提现的店铺的相关信息以及提现信息。///可以对体现店铺进行查看等操作。', 'upload/admin/common/1490759924.jpg', '', 1, 0, 0),
(646, '开放平台', 'platform', 'wchat', 'weixinopenplatformconfig', 636, 2, 'wchat/weixinopenplatformconfig', 0, 0, 0, '该页面显示了微信开放平台的相关信息。', '', '', 0, 0, 0),
(647, '验证码设置', 'platform', 'config', 'codeconfig', 652, 3, 'config/codeconfig', 1, 0, 6, '', '', '', 1, 0, 0),
(648, '店铺销售明细', 'platform', 'account', 'shoporderaccountrecordslist', 297, 3, 'account/shoporderaccountrecordslist', 0, 0, 1, '店铺销售明细统计并用走势图直观呈现', 'upload/admin/common/1491034653.png', '', 1, 0, 0),
(649, '商品销售明细', 'platform', 'account', 'shopordergoodsaccountrecordslist', 597, 3, 'account/shopordergoodsaccountrecordslist', 0, 0, 1, '商品销售明细统计并用走势图直观呈现', 'upload/admin/common/1491034733.png', '', 1, 0, 0),
(650, '商品分类销售', 'platform', 'statistics', 'goodscategorysalenumrank', 593, 2, 'statistics/goodscategorysalenumrank', 1, 0, 8, '商品分类销售分销统计并用走势图直观呈现', 'upload/admin/common/1491114893.png', '', 1, 0, 0),
(651, '平台统计', 'platform', 'statistics', 'platformaccountmonthrecored', 593, 2, 'statistics/platformaccountmonthrecored', 1, 0, 1, '平台统计并用走势图直观呈现', '', '', 1, 0, 0),
(652, '基础设置', 'platform', 'config', 'webconfig', 547, 2, 'config/webconfig', 1, 0, 1, '基础设置', '', '', 1, 0, 0),
(653, '帮助设置', 'platform', 'config', 'helpdocument', 547, 2, 'config/helpdocument', 1, 0, 3, '', '', '', 1, 0, 0),
(654, '添加内容', 'platform', 'config', 'adddocument', 653, 3, 'config/adddocument', 0, 0, 0, '', '', '', 1, 0, 0),
(655, '编辑内容', 'platform', 'config', 'updatedocument', 653, 3, 'config/updatedocument', 0, 0, 0, '', '', '', 1, 0, 0),
(656, '版块设置', 'platform', 'config', 'blocklist', 547, 2, 'config/blocklist', 1, 0, 4, '', '', '', 1, 0, 0),
(657, '控制台', 'platform', 'index', 'index', 547, 2, 'index/index', 1, 0, 0, '', '', '', 1, 0, 0),
(658, '添加帮助类型', 'platform', 'config', 'addhelpclass', 653, 3, 'config/addhelpclass', 0, 0, 11, '', '', '', 1, 0, 0),
(659, '广告设置', 'platform', 'config', 'platformadvpositionlist', 547, 2, 'config/platformadvpositionlist', 1, 0, 5, '', '', '', 1, 0, 0),
(660, '广告管理', 'platform', 'config', 'platformadvlist', 659, 3, 'config/platformadvlist', 0, 0, 4, '', '', '', 1, 0, 0),
(661, '添加广告', 'platform', 'config', 'addplatformadv', 659, 3, 'config/addplatformadv', 0, 0, 5, '', '', '', 1, 0, 0),
(662, '编辑广告', 'platform', 'config', 'updateplatformadv', 659, 3, 'config/updateplatformadv', 0, 0, 6, '', '', '', 1, 0, 0),
(663, '订单详情', 'platform', 'order', 'orderdetail', 582, 3, 'order/orderdetail', 0, 0, 0, '', '', '', 1, 0, 0),
(664, '修改店铺', 'platform', 'shop', 'updateshop', 556, 3, 'shop/updateshop', 0, 0, 0, '<br>', '', '', 1, 0, 0),
(665, '修改店铺等级', 'platform', 'shop', 'updateshoplevel', 556, 3, 'shop/updateshoplevel', 0, 0, 0, '展示了对应等级下的所有权限。//勾选操作可以对该等级设置权限。', '', '', 1, 0, 0),
(666, '添加自定义模板', 'platform', 'wchat', 'qrcode', 639, 3, 'wchat/qrcode', 0, 0, 0, '', '', '', 1, 0, 0),
(671, '商品规格', 'platform', 'goods', 'goodsspeclist', 558, 1, 'goods/goodsspeclist', 1, 0, 6, '商品规格', '', '', 1, 0, 0),
(673, '添加商品规格', 'platform', 'goods', 'addgoodsspec', 671, 3, 'goods/addgoodsspec', 0, 0, 1, '', '', '', 1, 0, 0),
(674, '修改商品规格', 'platform', 'goods', 'updategoodsspec', 671, 3, 'goods/updategoodsspec', 0, 0, 0, '', '', '', 1, 0, 0),
(678, '广告管理', 'admin', 'config', 'shopadlist', 218, 2, 'config/shopadlist', 1, 0, 2, '', '', '', 1, 0, 0),
(679, '添加广告', 'admin', 'config', 'addshopad', 678, 3, 'config/addshopad', 1, 0, 1, '', '', '', 1, 0, 0),
(680, '修改广告', 'admin', 'config', 'updateshopad', 678, 3, 'config/updateshopad', 1, 0, 0, '', '', '', 1, 0, 0),
(681, 'seo设置', 'platform', 'config', 'seoConfig', 652, 3, 'config/seoconfig', 1, 0, 1, '', '', '', 1, 0, 0),
(682, '支付宝支付', 'platform', 'config', 'payaliconfig', 652, 3, 'config/payaliconfig', 0, 0, 3, '', '', '', 1, 0, 0),
(683, '微信支付', 'platform', 'config', 'payconfig', 652, 3, 'config/payconfig', 0, 0, 4, '', '', '', 1, 0, 0),
(684, '店铺收入', 'admin', 'account', 'shopaccount', 409, 2, 'account/shopaccount', 1, 0, 0, '', '', '', 1, 0, 0),
(687, '微信登录', 'platform', 'config', 'loginwchatconfig', 652, 3, 'config/loginwchatconfig', 0, 0, 5, '', '', '', 1, 0, 0),
(689, '邮件通知', 'platform', 'config', 'messageemailconfig', 652, 3, 'config/messageemailconfig', 0, 0, 0, '', '', '', 1, 0, 0),
(690, '短信通知', 'platform', 'config', 'messagesmsconfig', 652, 3, 'config/messagesmsconfig', 0, 0, 0, '', '', '', 1, 0, 0),
(691, 'qq登录', 'platform', 'config', 'loginqqsetconfig', 652, 3, 'config/loginqqsetconfig', 0, 0, 0, '', '', '', 1, 0, 0),
(695, '积分管理', 'platform', 'config', 'pointConfig', 652, 3, 'config/pointconfig', 0, 0, 0, '', '', '', 1, 0, 0),
(696, '积分奖励', 'platform', 'config', 'integral', 652, 3, 'config/integral', 0, 0, 0, '', '', '', 1, 0, 0),
(697, '邮件模板', 'platform', 'config', 'notifyemailtemplate', 652, 3, 'config/notifyemailtemplate', 0, 0, 0, '', '', '', 1, 0, 0),
(698, '短信模板', 'platform', 'config', 'notifysmstemplate', 652, 3, 'config/notifysmstemplate', 0, 0, 0, '', '', '', 1, 0, 0),
(699, '首页公告', 'platform', 'config', 'updatenotice', 547, 2, 'config/updatenotice', 1, 0, 9, '', '', '', 1, 0, 0),
(701, '修改版块', 'platform', 'config', 'updateBlock', 656, 3, 'config/updateblock', 0, 0, 0, '', '', '', 1, 0, 0),
(702, '积分明细', 'platform', 'member', 'pointdetail', 544, 3, 'member/pointdetail', 0, 0, 0, '', '', '', 1, 0, 0),
(703, '余额明细', 'platform', 'member', 'accountdetail', 544, 3, 'member/accountdetail', 0, 0, 0, '余额明细', '', '', 1, 0, 0),
(705, '会员等级', 'platform', 'Member', 'memberLevelList', 544, 3, 'member/memberlevellist', 1, 0, 1, '会员等级管理', '', '', 1, 0, 0),
(706, '购物设置', 'platform', 'config', 'shopset', 590, 2, 'config/shopset', 1, 0, 5, '', '', '', 1, 0, 0),
(707, '会员提现', 'platform', 'Member', 'userCommissionWithdrawList', 544, 3, 'member/usercommissionwithdrawlist', 1, 0, 2, '会员提现列表', '', '', 1, 0, 0),
(708, '粉丝列表', 'platform', 'member', 'weixinfanslist', 544, 3, 'member/weixinfanslist', 1, 0, 6, '', '', '', 1, 0, 0),
(709, '积分管理', 'platform', 'member', 'pointlist', 544, 3, 'member/pointlist', 1, 0, 4, '', '', '', 1, 0, 0),
(710, '专题列表', 'platform', 'Cms', 'topicList', 546, 2, 'cms/topiclist', 1, 0, 3, '专题列表', '', '', 1, 0, 0),
(711, '余额管理', 'platform', 'member', 'accountlist', 544, 3, 'member/accountlist', 1, 0, 5, '', '', '', 1, 0, 0),
(713, '提现设置', 'platform', 'config', 'memberwithdrawsetting', 590, 2, 'config/memberwithdrawsetting', 1, 0, 7, '', '', '', 1, 0, 0),
(714, '注册与访问', 'platform', 'Config', 'registerAndVisit', 547, 2, 'config/registerandvisit', 1, 0, 2, '注册与访问', '', '', 1, 0, 0),
(715, '模板消息设置', 'platform', 'Wchat', 'messageTemplate', 636, 2, 'wchat/messagetemplate', 1, 0, 7, '模板消息设置', '', '', 1, 0, 0),
(717, '添加版块', 'platform', 'config', 'addblock', 656, 3, 'config/addblock', 0, 0, 0, '添加版块', '', '', 1, 0, 0),
(720, '商品类型', 'platform', 'goods', 'attributelist', 558, 3, 'goods/attributelist', 1, 0, 3, '', '', '', 1, 0, 0),
(723, '添加商品类型', 'platform', 'goods', 'addattributeservice', 558, 3, 'goods/addattributeservice', 0, 0, 3, '', '', '', 1, 0, 0),
(725, '修改商品类型', 'platform', 'goods', 'updategoodsattribute', 558, 3, 'goods/updategoodsattribute', 0, 0, 3, '', '', '', 1, 0, 0),
(726, '提现', 'admin', 'Account', 'applyshopaccountwithdraw', 684, 3, 'Account/applyShopAccountWithdraw', 1, 0, 0, '提现', '', '', 1, 0, 0),
(727, '添加账户', 'admin', 'Account', 'addShopAccountBank', 684, 3, 'Account/addShopAccountBank', 1, 0, 1, '添加账户', '', '', 1, 0, 0),
(729, '账户列表', 'admin', 'Account', 'shopBankAccountList', 684, 3, 'Account/shopBankAccountList', 1, 0, 0, '账户列表', '', '', 1, 0, 0),
(730, '修改账户', 'admin', 'Account', 'updateBankAccount', 684, 3, 'Account/updateBankAccount', 1, 0, 0, '修改账户', '', '', 1, 0, 0),
(732, '提现列表', 'admin', 'account', 'shopAccountWithdrawList', 684, 3, 'account/shopAccountWithdrawList', 1, 0, 0, '提现列表', '', '', 1, 0, 0),
(733, '地区管理', 'platform', 'Config', 'areaManagement', 590, 2, 'Config/areaManagement', 1, 0, 8, '地区管理', '', '', 1, 0, 0),
(734, '添加等级', 'platform', 'Member', 'addMemberLevel', 544, 3, 'Member/addMemberLevel', 0, 0, 6, '添加等级', '', '', 1, 0, 0),
(735, '修改等级', 'platform', 'Member', 'updateMemberLevel', 544, 3, 'Member/updateMemberLevel', 0, 0, 9, '修改等级', '', '', 1, 0, 0),
(737, '添加素材', 'platform', 'Wchat', 'addMedia', 641, 3, 'Wchat/addMedia', 0, 0, 0, '添加素材', '', '', 1, 0, 0),
(738, '修改素材', 'platform', 'Wchat', 'updateMedia', 641, 3, 'Wchat/updateMedia', 0, 0, 0, '修改素材', '', '', 1, 0, 0),
(739, '添加文章', 'platform', 'Cms', 'addArticle', 557, 3, 'Cms/addArticle', 0, 0, 0, '添加文章', '', '', 1, 0, 0),
(740, '修改文章', 'platform', 'Cms', 'updateArticle', 557, 3, 'Cms/updateArticle', 0, 0, 0, '修改文章', '', '', 1, 0, 0),
(741, '添加分类', 'platform', 'Cms', 'addArticleClass', 575, 3, 'Cms/addArticleClass', 0, 0, 1, '添加分类', '', '', 1, 0, 0),
(742, '修改分类', 'platform', 'Cms', 'updateArticleClass', 575, 3, 'Cms/updateArticleClass', 0, 0, 1, '修改分类', '', '', 1, 0, 0),
(743, '添加专题', 'platform', 'Cms', 'addTopic', 710, 3, 'Cms/addTopic', 0, 0, 2, '添加专题', '', '', 1, 0, 0),
(744, '修改专题', 'platform', 'Cms', 'updateTopic', 710, 3, 'Cms/updateTopic', 0, 0, 2, '修改专题', '', '', 1, 0, 0),
(745, '添加回复', 'platform', 'Wchat', 'addOrUpdateKeyReplay', 640, 3, 'Wchat/addOrUpdateKeyReplay', 0, 0, 0, '添加回复或修改', '', '', 1, 0, 0),
(746, '店铺统计详情', 'platform', 'account', 'shopaccountrecordslist', 595, 3, 'account/shopaccountrecordslist', 0, 0, 0, '', '', '', 1, 0, 0),
(747, '货到付款区域', 'platform', 'config', 'distributionareamanagement', 590, 2, 'config/distributionareamanagement', 1, 0, 9, '', '', '', 1, 0, 0),
(748, '店铺添加', 'platform', 'shop', 'addPlatformShop', 556, 3, 'shop/addPlatformShop', 1, 0, 5, '', '', '', 1, 0, 0),
(749, '满减送管理', 'platform', 'promotion', 'mansonglist', 751, 2, 'promotion/mansonglist', 1, 0, 10, '', '', '', 1, 0, 0),
(750, '限时折扣管理', 'platform', 'promotion', 'getdiscountlist', 751, 2, 'promotion/getdiscountlist', 1, 0, 11, '', '', '', 1, 0, 0),
(751, '运营', 'platform', 'Operate', 'index', 0, 1, 'Operate/index', 0, 0, 6, '', '', '', 0, 0, 1511939254),
(753, '基本设置', 'platform', 'Operate', 'index', 751, 2, 'Operate/index', 1, 0, 0, '', '', '', 1, 0, 0),
(757, '查看满减送活动详情', 'platform', 'promotion', 'promotioninfo', 749, 3, 'promotion/promotioninfo', 0, 0, 3, '', '', '', 1, 0, 0),
(758, '查看限时折扣详情', 'platform', 'promotion', 'discountinfo', 750, 3, 'promotion/discountinfo', 0, 0, 0, '', '', '', 1, 0, 0),
(759, '入驻指南', 'platform', 'Shop', 'arrivalGuide', 556, 3, 'Shop/arrivalGuide', 1, 0, 6, '入驻指南', '', '', 1, 0, 0),
(760, '添加内容', 'platform', 'Shop', 'addGuide', 556, 3, 'Shop/addGuide', 0, 0, 1, '添加内容', '', '', 1, 0, 0),
(761, '修改内容', 'platform', 'Shop', 'updateGuide', 556, 3, 'Shop/updateGuide', 0, 0, 2, '修改内容', '', '', 1, 0, 0),
(762, '意见反馈', 'platform', 'Member', 'feedbackList', 544, 3, 'Member/feedbackList', 1, 0, 7, '意见反馈列表', '', '', 1, 0, 0),
(764, '举报管理', 'platform', 'report', 'untreatedreport', 590, 2, 'report/untreatedreport', 0, 0, 10, '', '', '', 0, 0, 1511939210),
(765, '未处理', 'platform', 'report', 'untreatedreport', 764, 3, 'report/untreatedreport', 1, 0, 0, '', '', '', 1, 0, 0),
(766, '已处理', 'platform', 'report', 'handlereport', 764, 3, 'report/handlereport', 1, 0, 1, '', '', '', 1, 0, 0),
(767, '举报类型', 'platform', 'report', 'reporttypelist', 764, 3, 'report/reporttypelist', 1, 0, 2, '', '', '', 1, 0, 0),
(768, '添加类型', 'platform', 'report', 'addreporttype', 764, 3, 'report/addreporttype', 1, 0, 3, '', '', '', 1, 0, 0),
(769, '举报主题', 'platform', 'report', 'reporttopiclist', 764, 3, 'report/reporttopiclist', 1, 0, 4, '', '', '', 1, 0, 0),
(770, '添加主题', 'platform', 'report', 'addreporttopic', 764, 3, 'report/addreporttopic', 1, 0, 5, '', '', '', 1, 0, 0),
(771, '投诉管理', 'platform', 'complain', 'complainnewlist', 590, 2, 'complain/complainnewlist', 0, 0, 1, '投诉管理模块', '', '', 0, 0, 1511939360),
(772, '新投诉', 'platform', 'complain', 'complainnewlist', 771, 3, 'complain/complainnewlist', 1, 0, 0, '最新投诉', '', '', 1, 0, 0),
(773, '待申诉', 'platform', 'complain', 'complainappeallist', 771, 3, 'complain/complainappeallist', 1, 0, 1, '待申诉', '', '', 1, 0, 0),
(774, '对话中', 'platform', 'complain', 'complaintalklist', 771, 3, 'complain/complaintalklist', 1, 0, 2, '对话中', '', '', 1, 0, 0),
(775, '待仲裁', 'platform', 'complain', 'complainhandlelist', 771, 3, 'complain/complainhandlelist', 1, 0, 3, '待仲裁', '', '', 1, 0, 0),
(776, '已关闭', 'platform', 'complain', 'complainfinishlist', 771, 3, 'complain/complainfinishlist', 1, 0, 4, '已关闭', '', '', 1, 0, 0),
(777, '投诉主题', 'platform', 'complain', 'complainsubjectlist', 771, 3, 'complain/complainsubjectlist', 1, 0, 5, '投诉主题', '', '', 1, 0, 0),
(778, '添加主题', 'platform', 'complain', 'complainsubjectadd', 771, 3, 'complain/complainsubjectadd', 1, 0, 6, '添加主题', '', '', 1, 0, 0),
(779, '投诉设置', 'platform', 'complain', 'complainsetting', 771, 3, 'complain/complainsetting', 1, 0, 7, '投诉设置', '', '', 1, 0, 0),
(780, '投诉进程', 'platform', 'complain', 'complainprogress', 771, 3, 'complain/complainprogress', 1, 0, 8, '投诉进程', '', '', 1, 0, 0),
(781, '举报详情', 'platform', 'report', 'reportinfo', 764, 3, 'report/report', 0, 0, 0, '', '', '', 1, 0, 0),
(782, '举报处理', 'platform', 'report', 'reporthandle', 764, 3, 'report/reporthandle', 0, 0, 0, '', '', '', 1, 0, 0),
(784, '意见反馈', 'platform', 'feedback', 'feedbacklist', 590, 2, 'feedback/feedbacklist', 0, 0, 11, '', '', '', 1, 0, 1511929786),
(785, '物流跟踪设置', 'platform', 'config', 'expressmessage', 652, 3, 'config/expressmessage', 1, 0, 6, '', '', '', 1, 0, 0),
(10001, '供货商', 'admin', 'member', 'supplierlist', 149, 2, 'member/supplierlist', 1, 0, 7, '', '', '', 1, 0, 0),
(10002, '添加供货商', 'admin', 'member', 'addsupplier', 10001, 3, 'member/addsupplier', 1, 0, 0, '', '', '', 1, 0, 0),
(10003, '修改供货商', 'admin', 'member', 'updatesupplier', 10001, 3, 'member/updatesupplier', 1, 0, 1, '', '', '', 1, 0, 0),
(10006, '促销版块', 'admin', 'System', 'goodsRecommendClass', 218, 2, 'System/goodsRecommendClass', 1, 0, 2, '促销版块', '', '', 1, 0, 0),
(10025, '线下店铺', 'admin', 'Shop', 'offlineStore', 218, 2, 'Shop/offlineStore', 1, 0, 4, '线下店铺', '', '', 1, 0, 0),
(10084, '版权设置', 'platform', 'config', 'copyrightinfo', 652, 3, 'config/copyrightinfo', 1, 0, 0, '', '', '', 1, 1509352959, 0),
(10085, '附件上传', 'platform', 'config', 'uploadtype', 547, 2, 'config/uploadtype', 1, 0, 2, '', '', '', 1, 1509353690, 0),
(10086, '通知模版', 'platform', 'config', 'notifytemplate', 652, 3, 'config/notifytemplate', 0, 0, 0, '', '', '', 1, 1510135784, 0),
(10088, '数据库管理', 'platform', 'dbdatabase', 'databaselist', 547, 2, 'dbdatabase/databaselist', 1, 0, 12, '', '', '', 1, 1510213204, 0),
(10089, '上传设置', 'platform', 'config', 'uploadtype', 10085, 3, 'config/uploadtype', 1, 0, 1, '', '', '', 1, 1510214568, 0),
(10090, '图片裁剪设置', 'platform', 'config', 'pictureuploadsetting', 10085, 3, 'config/pictureuploadsetting', 1, 0, 2, '', '', '', 1, 1510214636, 0),
(10092, '商家通知', 'platform', 'config', 'businessnotifytemplate', 652, 3, 'config/businessnotifytemplate', 0, 0, 0, '', '', '', 1, 1510218986, 0),
(10093, '报名', 'platform', 'sign', 'schoolresumelist', 0, 1, 'sign/schoolresumelist', 1, 0, 7, '', '', '', 1, 1555740504, 1555745821),
(10094, '学校报名列表', 'platform', 'sign', 'schoolresumelist', 10093, 2, 'sign/schoolresumelist', 1, 0, 1, '', '', '', 1, 1555740650, 1555745835),
(10096, '司局报名列表', 'platform', 'sign', 'bureaulist', 10093, 2, 'sign/bureaulist', 1, 0, 2, '', '', '', 1, 1555740766, 0),
(10097, '添加学校报名信息', 'platform', 'sign', 'addschoolresume', 10094, 3, 'sign/addschoolresume', 0, 0, 1, '', '', '', 1, 1555744154, 0),
(10098, '修改学校报名详细', 'platform', 'sign', 'updateschoolresume', 10094, 3, 'sign/updateschoolresume', 0, 0, 2, '', '', '', 1, 1555744208, 0),
(10099, '删除学校报名信息', 'platform', 'sign', 'deleteschoolresume', 10094, 3, 'sign/deleteschoolresume', 0, 0, 3, '', '', '', 1, 1555744253, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice`
--

CREATE TABLE IF NOT EXISTS `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用（0：隐藏，1：显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站公告' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `sys_notice`
--

INSERT INTO `sys_notice` (`id`, `shopid`, `notice_message`, `is_enable`) VALUES
(7, 0, ' 2019年闽江学院成人高考招生采用网上报名的方式 网上信息输入：9月初', 1),
(9, 28, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template`
--

CREATE TABLE IF NOT EXISTS `sys_notice_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `modify_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  `notification_mode` text NOT NULL COMMENT '通知方式',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='通知模版设置' AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `sys_notice_template`
--

INSERT INTO `sys_notice_template` (`template_id`, `template_type`, `instance_id`, `template_code`, `template_title`, `template_content`, `sign_name`, `is_enable`, `modify_time`, `notify_type`, `notification_mode`) VALUES
(1, 'email', 0, 'after_register', '', '', '', 1, 1509607524, 'user', ''),
(2, 'email', 0, 'register_validate', '', '', '', 1, 1509607524, 'user', ''),
(3, 'email', 0, 'recharge_success', '', '', '', 1, 1509607524, 'user', ''),
(4, 'email', 0, 'confirm_order', '', '', '', 1, 1509607524, 'user', ''),
(5, 'email', 0, 'pay_success', '', '', '', 1, 1509607524, 'user', ''),
(6, 'email', 0, 'create_order', '', '', '', 1, 1509607524, 'user', ''),
(7, 'email', 0, 'order_deliver', '', '', '', 1, 1509607524, 'user', ''),
(8, 'email', 0, 'forgot_password', '', '\n', '', 1, 1509607524, 'user', ''),
(9, 'email', 0, 'bind_email', '', '\n', '', 1, 1509607524, 'user', ''),
(10, 'sms', 0, 'after_register', '', '', '', 1, 1510135804, 'user', ''),
(11, 'sms', 0, 'register_validate', '', '', '', 0, 1510135804, 'user', ''),
(12, 'sms', 0, 'recharge_success', '', '', '', 1, 1510135804, 'user', ''),
(13, 'sms', 0, 'confirm_order', '', '', '', 0, 1510135804, 'user', ''),
(14, 'sms', 0, 'pay_success', '', '', '', 0, 1510135804, 'user', ''),
(15, 'sms', 0, 'create_order', '', '', '', 0, 1510135804, 'user', ''),
(16, 'sms', 0, 'order_deliver', '', '', '', 0, 1510135804, 'user', ''),
(17, 'sms', 0, 'forgot_password', '', '', '', 0, 1510135804, 'user', ''),
(18, 'sms', 0, 'bind_mobile', '', '', '', 0, 1510135804, 'user', ''),
(19, 'sms', 0, 'refund_order', '', '', '', 1, 1510220367, 'business', '18735107960'),
(20, 'sms', 0, 'order_remind', '', '', '', 1, 1510220367, 'business', '18735107960'),
(21, 'sms', 0, 'recharge_success', '', '', '', 0, 1510220367, 'business', '18735107960'),
(22, 'email', 0, 'refund_order', '', '', '', 1, 1510220781, 'business', 'ddd'),
(23, 'email', 0, 'order_remind', '', '', '', 1, 1510220781, 'business', ''),
(24, 'email', 0, 'recharge_success', '', '', '', 1, 1510220781, 'business', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template_item`
--

CREATE TABLE IF NOT EXISTS `sys_notice_template_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820 COMMENT='通知模板项' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `sys_notice_template_item`
--

INSERT INTO `sys_notice_template_item` (`id`, `item_name`, `show_name`, `replace_name`, `type_ids`, `order`) VALUES
(1, '商场名称', '{商场名称}', 'shopname', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 0),
(2, '用户名称', '{用户名称}', 'username', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email,order_remind,refund_order', 1),
(5, '商品名称', '{商品名称}', 'goodsname', 'order_deliver', 4),
(6, '商品规格', '{商品规格}', 'goodssku', 'order_deliver', 5),
(7, '主订单号', '{主订单号}', 'orderno', 'create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 6),
(8, '订单金额', '{订单金额}', 'ordermoney', 'create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order', 7),
(9, '商品金额', '{商品金额}', 'goodsmoney', 'create_order,pay_success,order_deliver', 8),
(10, '验证码', '{验证码}', 'number', 'register_validate,forgot_password,bind_mobile,bind_email', 9),
(11, '充值金额', '{充值金额}', 'rechargemoney', 'recharge_success', 0),
(12, '物流公司', '{物流公司}', 'expresscompany', 'order_deliver', 0),
(13, '快递编号', '{快递编号}', 'expressno', 'order_deliver', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice_template_type`
--

CREATE TABLE IF NOT EXISTS `sys_notice_template_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='通知模板类型' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `sys_notice_template_type`
--

INSERT INTO `sys_notice_template_type` (`type_id`, `template_name`, `template_code`, `template_type`, `notify_type`) VALUES
(1, '注册成功', 'after_register', 'all', 'user'),
(2, '注册验证', 'register_validate', 'all', 'user'),
(3, '充值成功', 'recharge_success', 'all', 'user'),
(4, '确认订单', 'confirm_order', 'all', 'user'),
(5, '付款成功', 'pay_success', 'all', 'user'),
(6, '下单成功', 'create_order', 'all', 'user'),
(7, '订单发货', 'order_deliver', 'all', 'user'),
(8, '找回密码', 'forgot_password', 'all', 'user'),
(9, '手机绑定', 'bind_mobile', 'sms', 'user'),
(10, '邮箱绑定', 'bind_email', 'email', 'user'),
(11, '退款订单', 'refund_order', 'all', 'business'),
(12, '订单提醒', 'order_remind', 'all', 'business'),
(13, '充值成功', 'recharge_success', 'all', 'business');

-- --------------------------------------------------------

--
-- 表的结构 `sys_province`
--

CREATE TABLE IF NOT EXISTS `sys_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `sys_province`
--

INSERT INTO `sys_province` (`province_id`, `area_id`, `province_name`, `sort`) VALUES
(1, 2, '北京市', 1),
(2, 2, '天津市', 0),
(3, 2, '河北省', 0),
(4, 2, '山西省', 0),
(5, 2, '内蒙古自治区', 0),
(6, 5, '辽宁省', 0),
(7, 5, '吉林省', 0),
(8, 5, '黑龙江省', 0),
(9, 1, '上海市', 0),
(10, 1, '江苏省', 0),
(11, 1, '浙江省', 0),
(12, 1, '安徽省', 0),
(13, 3, '福建省', 0),
(14, 1, '江西省', 0),
(15, 2, '山东省', 0),
(16, 4, '河南省', 0),
(17, 4, '湖北省', 0),
(18, 4, '湖南省', 0),
(19, 3, '广东省', 0),
(20, 3, '广西壮族自治区', 0),
(21, 3, '海南省', 0),
(22, 7, '重庆市', 0),
(23, 7, '四川省', 0),
(24, 7, '贵州省', 0),
(25, 7, '云南省', 0),
(26, 7, '西藏自治区', 0),
(27, 6, '陕西省', 0),
(28, 6, '甘肃省', 0),
(29, 6, '青海省', 0),
(30, 6, '宁夏回族自治区', 0),
(31, 6, '新疆维吾尔自治区', 0),
(32, 8, '香港特别行政区', 0),
(33, 8, '澳门特别行政区', 0),
(34, 8, '台湾省', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_url_route`
--

CREATE TABLE IF NOT EXISTS `sys_url_route` (
  `routeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '伪静态路由规则',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '路由地址',
  `is_open` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统默认',
  `route_model` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配置伪静态使用的模块1.shop2.wap3.admin',
  `remark` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`routeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='系统伪静态路由' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `sys_url_route`
--

INSERT INTO `sys_url_route` (`routeid`, `rule`, `route`, `is_open`, `is_system`, `route_model`, `remark`) VALUES
(1, 'goods', 'shop/goods/goodsinfo', 1, 1, 1, ''),
(2, 'list', 'shop/goods/goodslist', 1, 1, 1, ''),
(3, 'brands', 'shop/goods/brandlist', 1, 1, 1, ''),
(4, 'integralcenter', 'shop/goods/integralcenter', 1, 1, 1, ''),
(5, 'discount', 'shop/index/discount', 1, 1, 1, ''),
(7, 'membercenter', 'shop/member/index', 1, 0, 1, ''),
(8, 'article', 'shop/cms/articleclassinfo', 1, 1, 1, '文章详情');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT '0' COMMENT '是否是前台会员',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) NOT NULL DEFAULT '0' COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) NOT NULL DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) NOT NULL DEFAULT '0' COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_is_sub` int(1) NOT NULL DEFAULT '0' COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '牛酷用户' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `wx_sub_time` int(11) DEFAULT '0' COMMENT '微信用户关注时间',
  `wx_notsub_time` int(11) DEFAULT '0' COMMENT '微信用户取消关注时间',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `current_login_time` int(11) DEFAULT '0' COMMENT '当前登录时间',
  `last_login_time` int(11) DEFAULT '0' COMMENT '上次登录时间',
  `birthday` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `IDX_sys_user_user_email` (`user_email`),
  KEY `IDX_sys_user_user_name` (`user_name`),
  KEY `IDX_sys_user_user_password` (`user_password`),
  KEY `IDX_sys_user_user_tel` (`user_tel`),
  KEY `IDX_sys_user_wx_openid` (`wx_openid`),
  KEY `IDX_sys_user_wx_unionid` (`wx_unionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='系统用户表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`uid`, `instance_id`, `user_name`, `user_password`, `user_status`, `user_headimg`, `is_system`, `is_member`, `user_tel`, `user_tel_bind`, `user_qq`, `qq_openid`, `qq_info`, `user_email`, `user_email_bind`, `wx_openid`, `wx_is_sub`, `wx_info`, `other_info`, `current_login_ip`, `current_login_type`, `last_login_ip`, `last_login_type`, `login_num`, `real_name`, `sex`, `location`, `nick_name`, `wx_unionid`, `qrcode_template_id`, `wx_sub_time`, `wx_notsub_time`, `reg_time`, `current_login_time`, `last_login_time`, `birthday`) VALUES
(10, 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 1, 1, '', 0, '', '', '', '', 0, NULL, 0, NULL, NULL, '127.0.0.1', 1, '127.0.0.1', 1, 8, '', 0, '', '牛酷用户', '', 0, 0, 0, 2019, 1555740267, 1555636644, 0),
(11, 27, 'dingzt', '5e7e1ddf9bec14f6c862cfba15417514', 1, '', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '127.0.0.1', 1, 6, '', 0, '', 'dingzt', '', 0, 0, 0, 1555569345, 1555636327, 1555580239, 0),
(12, 0, 'wulala', '5e7e1ddf9bec14f6c862cfba15417514', 1, '', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '', 0, 1, '', 0, '', 'wulala', '', 0, 0, 0, 1555569674, 1555636319, 0, 0),
(13, 28, 'lulu', '5e7e1ddf9bec14f6c862cfba15417514', 1, 'upload/avator/1555571412.gif', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '127.0.0.1', 1, 29, '', 0, '', 'lulu', '', 0, 0, 0, 1555570311, 1555742726, 1555742697, 0),
(14, 0, 'xiaojia', '5e7e1ddf9bec14f6c862cfba15417514', 1, '', 0, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '', 0, 1, '', 0, '', 'xiaojia', '', 0, 0, 0, 1555571526, 1555571526, 0, 0),
(15, 29, 'laoli', '5e7e1ddf9bec14f6c862cfba15417514', 1, '', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', '', '127.0.0.1', 1, '', 0, 1, '', 0, '', 'laoli', '', 0, 0, 0, 1555657878, 1555657878, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_admin`
--

CREATE TABLE IF NOT EXISTS `sys_user_admin` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户ID',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT '0' COMMENT '系统用户组',
  `is_admin` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统管理员组',
  `admin_status` int(11) DEFAULT '1' COMMENT '状态 默认为1',
  `desc` text COMMENT '附加信息',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='后台管理员表';

--
-- 转存表中的数据 `sys_user_admin`
--

INSERT INTO `sys_user_admin` (`uid`, `admin_name`, `group_id_array`, `is_admin`, `admin_status`, `desc`) VALUES
(10, '管理员', 10, 1, 1, NULL),
(11, '', 11, 0, 1, NULL),
(12, 'wulala', 12, 0, 1, '编辑用户'),
(13, '', 13, 0, 1, NULL),
(15, '', 14, 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_group`
--

CREATE TABLE IF NOT EXISTS `sys_user_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `desc` text COMMENT '描述',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='系统用户组表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sys_user_group`
--

INSERT INTO `sys_user_group` (`group_id`, `instance_id`, `group_name`, `group_status`, `is_system`, `module_id_array`, `desc`, `create_time`, `modify_time`) VALUES
(1, 0, '管理员组', 1, 1, '120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,507,508,509,510,512,513,517,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10021,10022,10023,10024,10075,10076,10077,10078,10079,10080,10081,10082,10083', NULL, 2017, 0),
(10, 0, '管理员组', 1, 1, '120,121,122,123,126,127,128,129,133,139,144,149,151,169,171,172,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,334,360,403,405,409,418,430,445,446,447,450,451,454,457,459,460,462,463,467,469,471,472,478,479,480,481,487,506,509,515,516,517,528,529,530,532,533,534,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,575,577,580,581,582,583,584,585,586,587,588,589,590,593,594,595,596,597,598,605,606,607,608,636,637,638,639,640,641,643,644,645,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,671,673,674,678,679,680,681,682,683,684,687,689,690,691,695,696,697,698,699,701,702,703,705,706,707,708,709,710,711,713,714,715,717,720,723,725,726,727,729,730,732,733,734,735,737,738,739,740,741,742,743,744,745,746,747,748,749,750,753,757,758,759,760,761,762,765,766,767,768,769,770,772,773,774,775,776,777,778,779,780,781,782,784,785,10000,10001,10002,10003,10006,10025,10084,10085,10086,10088,10089,10090,10092', NULL, 2019, 0),
(11, 27, '管理员组', 1, 1, '467,515,149,150,151,171,210,172,10001,10002,10003,334,478,139,169,516,517,184,185,190,194,189,533,487,534,191,192,471,472,528,529,530,179,180,186,187,446,508,195,196,197,198,199,200,201,202,203,469,218,10055,10057,10059,418,10006,678,680,679,10022,10023,10024,10025,474,519,126,127,360,144,128,133,398,409,684,726,729,730,732,727,459,463,460,461,462,454,457,403,405,120,121,129,122,123', NULL, 1555569345, 0),
(12, 0, '编辑', 1, 0, '546,557,739,740,575,741,742,710,743,744', '', 1555569619, 0),
(13, 28, '管理员组', 1, 1, '467,515,149,150,151,171,210,172,10001,10002,10003,334,478,139,169,516,517,184,185,190,194,189,533,487,534,191,192,471,472,528,529,530,179,180,186,187,446,508,195,196,197,198,199,200,201,202,203,469,218,10055,10057,10059,418,10006,678,680,679,10022,10023,10024,10025,474,519,126,127,360,144,128,133,398,409,684,726,729,730,732,727,459,463,460,461,462,454,457,403,405,120,121,129,122,123', NULL, 1555570488, 0),
(14, 29, '管理员组', 1, 1, '467,515,149,150,151,171,210,172,10001,10002,10003,334,478,139,169,516,517,184,185,190,194,189,533,487,534,191,192,471,472,528,529,530,179,180,186,187,446,508,195,196,197,198,199,200,201,202,203,469,218,10055,10057,10059,418,10006,678,680,679,10022,10023,10024,10025,474,519,126,127,360,144,128,133,398,409,684,726,729,730,732,727,459,463,460,461,462,454,457,403,405,120,121,129,122,123', NULL, 1555742949, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_log`
--

CREATE TABLE IF NOT EXISTS `sys_user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT '1' COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82 COMMENT='用户操作日志' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_version_devolution`
--

CREATE TABLE IF NOT EXISTS `sys_version_devolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `devolution_username` varchar(255) NOT NULL DEFAULT '' COMMENT '授权账户',
  `devolution_password` varchar(255) NOT NULL DEFAULT '' COMMENT '授权密码',
  `create_date` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='用户授权信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_version_patch`
--

CREATE TABLE IF NOT EXISTS `sys_version_patch` (
  `patch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patch_type` int(11) NOT NULL DEFAULT '1' COMMENT '补丁类型  1. B2C单用户商城 2.B2C 单用户分销商城 3 B2B2C多用户商城',
  `patch_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁类型名称',
  `patch_release` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁编号',
  `patch_name` varchar(255) NOT NULL DEFAULT '' COMMENT '补丁标题',
  `patch_no` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '版本号',
  `patch_file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁文件名称',
  `patch_log` text NOT NULL COMMENT '版本补丁更新日志',
  `patch_file_size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补丁文件大小',
  `is_up` int(11) NOT NULL DEFAULT '2' COMMENT '是否升级  1代表已升级  0未升级 2全部',
  `modify_date` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本补丁管理' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_website`
--

CREATE TABLE IF NOT EXISTS `sys_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id_pc` int(10) NOT NULL DEFAULT '2' COMMENT '前台网站风格（1：热情洋溢模板，2：蓝色清爽版）',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT '1' COMMENT '网站运营状态1.开启 2.关闭 ',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT '1' COMMENT '手机端运营状态 1.开启2.关闭',
  `style_id_admin` int(10) DEFAULT '4' COMMENT '后台网站风格（3：旧模板，4：新模板）',
  `create_time` int(11) DEFAULT '0' COMMENT '网站创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '网站修改时间',
  `url_type` int(11) NOT NULL DEFAULT '0' COMMENT '网站访问模式',
  `web_popup_title` varchar(50) NOT NULL DEFAULT '' COMMENT '网站弹出框标题',
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站信息表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sys_website`
--

INSERT INTO `sys_website` (`website_id`, `title`, `logo`, `web_desc`, `key_words`, `web_icp`, `style_id_pc`, `web_address`, `web_qrcode`, `web_url`, `web_email`, `web_phone`, `web_qq`, `web_weixin`, `web_status`, `third_count`, `close_reason`, `wap_status`, `style_id_admin`, `create_time`, `modify_time`, `url_type`, `web_popup_title`) VALUES
(1, '佳家生活商城', 'upload/common/1555559063.png', '多用户商城报名系统', '易学佳家', '', 1, '河南省郑州市', 'upload/common/1555559089.png', 'yzg247.new.my', '', '400-886-7993', '', '', 1, '', '对不起，佳家商城维护中，大家敬请期待...', 1, 0, 1477452112, 1555639210, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_web_style`
--

CREATE TABLE IF NOT EXISTS `sys_web_style` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `desc` text COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '1：前台样式，2：后台样式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站前台样式表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sys_web_style`
--

INSERT INTO `sys_web_style` (`style_id`, `style_name`, `style_path`, `stye_img`, `desc`, `type`, `create_time`, `modify_time`) VALUES
(1, '热情洋溢', 'default', '', NULL, 1, 0, 0),
(2, '蓝色清爽', 'blue', '', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_auth`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT '0' COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_default_replay`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_fans`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_follow_replay`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_functions_button`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_functions_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` int(11) NOT NULL COMMENT '实例',
  `button_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `keyname` varchar(20) NOT NULL DEFAULT '' COMMENT '触发关键词',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '触发网址',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发次数',
  `is_enabled` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='微信功能按钮' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_instance_msg`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_instance_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_key_replay`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_media`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_media_item`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` text,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_menu`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_msg_template`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_no` varchar(55) NOT NULL COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '内容示例',
  `template_id` varchar(55) DEFAULT '' COMMENT '模版id',
  `headtext` varchar(255) DEFAULT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) DEFAULT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模版' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_qrcode_template`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_qrcode_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实例ID',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `nick_font_color` varchar(255) NOT NULL DEFAULT '#000' COMMENT '昵称字体颜色',
  `nick_font_size` smallint(6) NOT NULL DEFAULT '12' COMMENT '昵称字体大小',
  `is_logo_show` smallint(6) NOT NULL DEFAULT '1' COMMENT 'logo是否显示',
  `header_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部左边距',
  `header_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部上边距',
  `name_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称左边距',
  `name_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称上边距',
  `logo_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo左边距',
  `logo_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo上边距',
  `code_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码左边距',
  `code_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码上边距',
  `is_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除  0未删除 1删除',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '模板样式路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='微信推广二维码模板管理' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sys_weixin_qrcode_template`
--

INSERT INTO `sys_weixin_qrcode_template` (`id`, `instance_id`, `background`, `nick_font_color`, `nick_font_size`, `is_logo_show`, `header_left`, `header_top`, `name_left`, `name_top`, `logo_left`, `logo_top`, `code_left`, `code_top`, `is_check`, `is_remove`, `template_url`) VALUES
(1, 0, 'public/static/images/qrcode_bg/qrcode_bg.png', '#2b2b2b', 23, 1, '93px', '467px', '159px', '479px', '98px', '319px', '89px', '88px', 1, 0, 'public/static/images/qrcode_bg/template_bg_img.png');

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_user_msg`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_weixin_user_msg_replay`
--

CREATE TABLE IF NOT EXISTS `sys_weixin_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` int(11) DEFAULT '0',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_wexin_onekeysubscribe`
--

CREATE TABLE IF NOT EXISTS `sys_wexin_onekeysubscribe` (
  `instance_id` int(11) NOT NULL COMMENT '实例ID',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '一键关注url',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='微信一键关注设置';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
