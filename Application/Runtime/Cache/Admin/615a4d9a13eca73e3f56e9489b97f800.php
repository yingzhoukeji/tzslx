<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>编辑会员-用户管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='用户管理 > 编辑会员'; ?>
    <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
</head>
<body>
<div class="wrap"> <div id="Top">
    <div class="logo"><a target="_blank" href="<?php echo ($site["WEB_ROOT"]); ?>"><img src="/Public/Admin/Img/logo.png" /></a></div>
    <div class="help"><a href="http://www.YZ1681.COM" target="_blank">使用帮助</a><span><a href="http://www.YZ1681.COM" target="_blank">关于</a></span></div>
    <div class="menu">
        <ul> <?php echo ($menu); ?> </ul>
    </div>
</div>
<div id="Tags">
    <div class="userPhoto"><img src="/Public/Admin/Img/userPhoto.jpg" /> </div>
    <div class="navArea">
        <div class="userInfo"><div><a href="<?php echo U('Webinfo/index');?>" class="sysSet"><span>&nbsp;</span>系统设置</a> <a href="<?php echo U("Public/loginOut");?>" class="loginOut"><span>&nbsp;</span>退出系统</a></div>欢迎您，<?php echo ($my_info["email"]); ?></div>
        <div class="nav"><font id="today"><?php echo date("Y-m-d H:i:s"); ?></font>您的位置：<?php echo ($currentNav); ?></div>
    </div>
</div>
<div class="clear"></div>
    <div class="mainBody"> <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
        <div id="Right">
            <div class="contentArea">
                <div class="Item hr">
                    <div class="current">编辑会员</div>
                </div>
                <form action="" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th>登录邮箱：</th>
                            <td><input name="info[email]" type="text" class="input" size="40" value="<?php echo ($info["email"]); ?>" /></td>
                        </tr>
                        <tr>
                            <th width="120">昵称：</th>
                            <td><input name="info[nickname]" type="text" class="input" size="30" value="<?php echo ($info["nickname"]); ?>" /></td>
                        </tr>
                        <tr>
                            <th width="120">密码：</th>
                            <td><input name="info[pwd]" type="password" class="input" size="30" value="" />  不修改留空</td>
                        </tr>
                        <tr>
                            <th width="120">性别：</th>
                            <td><label><input type="radio" name="sex" value="1" <?php if($info['sex'] == 1): ?>checked<?php endif; ?> >男</label>
                                <label><input type="radio" name="sex" value="0" <?php if($info['sex'] == 0): ?>checked<?php endif; ?>>女</label></td>
                        </tr>
                        <tr>
                            <th width="120">手机号码：</th>
                            <td><input name="info[mobile]" type="text" class="input" size="30" value="<?php echo ($info["mobile"]); ?>" /></td>
                        </tr>
                        <tr>
                            <th width="120">电话：</th>
                            <td><input name="info[phone]" type="text" class="input" size="30" value="<?php echo ($info["phone"]); ?>" /></td>
                        </tr>
                        <tr>
                            <th width="120">QQ：</th>
                            <td><input name="info[qq]" type="text" class="input" size="30" value="<?php echo ($info["qq"]); ?>" /></td>
                        </tr>
                        <tr>
                            <th width="120">MSN：</th>
                            <td><input name="info[msn]" type="text" class="input" size="30" value="<?php echo ($info["msn"]); ?>" /></td>
                        </tr>
						<tr>
                            <th width="120">积分：</th>
                            <td><input name="info[srcoe]" type="text" class="input" size="30" value="<?php echo ($info["srcoe"]); ?>" /></td>
                        </tr>
                    </table>
                    <input type="hidden" name="uid" value="<?php echo ($info["uid"]); ?>"/>
                </form>
                <div class="commonBtnArea" >
                    <button class="btn submit">提交</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script type="text/javascript">
    $(window).resize(autoSize);
    $(function(){
        autoSize();
        $(".loginOut").click(function(){
            var url=$(this).attr("href");
            popup.confirm('你确定要退出吗？','你确定要退出吗',function(action){
                if(action == 'ok'){ window.location=url; }
            });
            return false;
        });

        var time=self.setInterval(function(){$("#today").html(date("Y-m-d H:i:s"));},1000);


    });

</script>
<script type="text/javascript" src="/Public/kindeditor/kindeditor.js"></script><script type="text/javascript" src="/Public/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
    $(function(){
        $(".submit").click(function(){
            commonAjaxSubmit();
            return false;
        });
    });
</script>
</body>
</html>