-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 05 月 24 日 03:12
-- 服务器版本: 5.5.8-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `books`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_access`
--

CREATE TABLE IF NOT EXISTS `auth_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限列表(仅对数据库表的字段)' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_groups`
--

CREATE TABLE IF NOT EXISTS `auth_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(20) NOT NULL COMMENT '唯一标识',
  `name` varchar(200) NOT NULL COMMENT '用户组名',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_access`
--

CREATE TABLE IF NOT EXISTS `auth_group_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '用户组ID',
  `access_id` int(11) NOT NULL COMMENT '权限列表ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与权限列表 关系' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_users`
--

CREATE TABLE IF NOT EXISTS `auth_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '登录使用的EMAIL',
  `password` varchar(100) NOT NULL COMMENT '加密后的密码',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否激活',
  `active_code` varchar(200) NOT NULL COMMENT '用户激活码',
  `yourself` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只有操作自己添加的数据权限。1为是',
  `created` int(11) NOT NULL COMMENT '创建时间',
  `updated` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户(管理员)' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `auth_users`
--

INSERT INTO `auth_users` (`id`, `username`, `email`, `password`, `active`, `active_code`, `yourself`, `created`, `updated`) VALUES
(1, 'admin', 'test@test.com', '$2a$10$hPcZTqXm2Gyel5nM5Fj1D.hW/DcPvt2KREFCMCT5F3fiQZTIjWEN6', 1, '', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_group`
--

CREATE TABLE IF NOT EXISTS `auth_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `group_id` int(11) NOT NULL COMMENT '用户组ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户与组 对应关系' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `core_config`
--

CREATE TABLE IF NOT EXISTS `core_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` int(11) NOT NULL,
  `body` text NOT NULL,
  `memo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `core_modules`
--

CREATE TABLE IF NOT EXISTS `core_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `label` varchar(50) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `core` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `core_modules`
--

INSERT INTO `core_modules` (`id`, `name`, `label`, `memo`, `core`, `active`, `sort`) VALUES
(1, 'core', 'Core', '内核', 1, 1, 0),
(2, 'auth', 'auth', '权限', 1, 1, 0),
(3, 'email', 'email', '邮件', 0, 1, 0),
(4, 'member', 'member', '会员', 0, 1, 0),
(5, 'oauth', 'oauth', '登录', 0, 1, 0),
(6, 'cart', 'cart', '购物车', 0, 1, 0),
(7, 'comment', 'comment', '评论', 0, 1, 0),
(8, 'content', 'content', '内容', 0, 1, 0),
(9, 'document', 'document', '手册', 0, 1, 0),
(10, 'file', 'file', '文件', 0, 1, 0),
(11, 'image', 'image', '图片', 0, 1, 0),
(12, 'media', 'media', '文章/相册/视频', 0, 1, 0),
(13, 'menu', 'menu', '菜单', 0, 1, 0),
(14, 'payment', 'payment', '支付', 0, 1, 0),
(15, 'svn', 'svn', 'SVN同步', 0, 1, 0),
(16, 'tag', 'tag', '标签云', 0, 1, 0),
(17, 'taxonomy', 'taxonomy', '分类', 0, 1, 0),
(18, 'i18n', 'i18n', '多语言', 0, 1, 0),
(19, 'multisite', 'multisite', '多站点', 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `email_config`
--

CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(200) NOT NULL,
  `from_name` varchar(200) NOT NULL,
  `smtp` varchar(200) NOT NULL,
  `from_password` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `email_config`
--

INSERT INTO `email_config` (`id`, `from_email`, `from_name`, `smtp`, `from_password`, `type`, `port`) VALUES
(1, 'mincms@yeah.net', 'yiiphp', 'smtp.yeah.net', 'gimmNnx0UkZt5Eqf3SLVq/15X2IHkMvtL3qKrrGrpbQ=', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `email_send`
--

CREATE TABLE IF NOT EXISTS `email_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_email` varchar(200) NOT NULL,
  `to_name` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `attach` text NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `email_send`
--

INSERT INTO `email_send` (`id`, `to_email`, `to_name`, `title`, `body`, `attach`, `created`) VALUES
(1, 'yiiphp@qq.com', '', 'aaa', 'cccc', '', 1369302378),
(2, 'yiiphp@qq.com', '', 'aaa', 'cccc', '', 1369302735),
(3, 'yiiphp@qq.com', '测试', '这是测试', '看看吧', '', 1369302786);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
