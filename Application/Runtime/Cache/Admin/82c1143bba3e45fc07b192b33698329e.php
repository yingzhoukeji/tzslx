<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>模型管理-后台管理首页-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='模型管理 > 添加模型'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
    </head>
    <body>
        <div class="wrap">
            <div id="Top">
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
            <div class="mainBody">
                <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
                <div id="Right">
<div class="Item hr">
    <div class="current">添加模型</div>
</div>
<form>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
        <tr>
            <th width="100">模型名称：</th>
            <td><input id="model_name" type="text" class="input" size="20" name="model[name]" /> <a href="javascript:void(0)" id="check_model_name">检测是否可用</a>（不能包含特殊字符）</td>
        </tr>
        <tr>
            <th width="100">数据表名：</th>
            <td><input id="tbl_name" type="text" class="input" size="20" name="model[tbl_name]" /> <a href="javascript:void(0)" id="check_tal_name">检测是否可用</a>（存放该模型的数据表名称，只能由"_"、a~z组成）</td>
        </tr>
        <tr>
            <th width="100">主菜单名：</th>
            <td><input id="menu_name" type="text" class="input" size="20" name="model[menu_name]" /> <a href="javascript:void(0)" id="check_menu_name">检测是否可用</a>（用于在主菜单和子菜单上显示，比如"文章"，系统则会生成"文章管理"菜单）</td>
        </tr>
        <tr>
            <th width="100">是否为内部表：</th>
            <td><label><input type="radio" name="model[is_inner]" value="0" checked="checked" /> 否</label> &nbsp; <label><input type="radio" name="model[is_inner]" value="1" /> 是</label> （内部表将不会被显示在菜单上）</td>
        </tr>
<!--         <tr>
            <th width="100">是否生成主键：</th>
            <td><label><input type="radio" name="model[has_pk]" value="0" /> 否</label> &nbsp; <label><input type="radio" name="model[has_pk]" value="1" checked="checked" /> 是</label> （如果生成主键则会在数据表中生成一个名为id自动递增的字段）</td>
        </tr> -->
        <tr>
        <th width="100">引擎类型：</th>
            <td>
                <select name="model[tbl_engine]">
					<option value="MyISAM">MyISAM</option>
                    <option value="InnoDB">InnoDB</option>
                    <option value="MEMORY">MEMORY</option>
                    <option value="BLACKHOLE">BLACKHOLE</option>
                    <option value="MRG_MYISAM">MRG_MYISAM</option>
                    <option value="ARCHIVE">ARCHIVE</option>
                </select>（生成后不可修改）
            </td>
        </tr>
        <tr>
            <th>模型描述：</th>
            <td><textarea id="content" class="input" style="height: 80px; width: 50%;" name="model[description]" placeholder="模型的注释，同时也会作为表的注释"></textarea></td>
        </tr>
        <input type="hidden" name="model[has_pk]" value="1" />
    </table>
</form>
<div class="commonBtnArea" >
    <button class="btn submit">提交</button>
</div>

<script type="text/javascript">
function submitForm(action) {
    $(".submit").click(function(){
        if ("" == $.trim($("#model_name").val())) {
            popup.error("模型名称不能为空");
            return false;
        } else if ("" == $.trim($("#tbl_name").val())) {
            popup.error("数据表名称不能为空");
            return false;
        }

        var url = ('create' == action) ? "<?php echo U('Models/create');?>" : "<?php echo U('Models/update');?>";


        commonAjaxSubmit(url);
        return false;
    });
}

$(function(){
    $("#check_model_name").click(function(){
        $.getJSON("<?php echo U('Models/checkModelName', array('id' => $model['id']));?>", { model_name: $("#model_name").val() }, function(json){
            $("#check_model_name").css("color",json.status==1?"#0f0":"#f00").html(json.info);
        });
    });

    $("#check_tal_name").click(function(){
        $.getJSON("<?php echo U('Models/checkTblName', array('id' => $model['id']));?>", { tbl_name:$("#tbl_name").val()}, function(json){
            $("#check_tal_name").css("color",json.status==1?"#0f0":"#f00").html(json.info);
        });
    });

    $("#check_menu_name").click(function(){
        $.getJSON("<?php echo U('Models/checkMenuName', array('id' => $model['id']));?>", { menu_name:$("#menu_name").val()}, function(json){
            $("#check_menu_name").css("color",json.status==1?"#0f0":"#f00").html(json.info);
        });
    });
});
</script>

<script type="text/javascript">
$(function(){
    submitForm("create");
});
</script>
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
    </body>
</html>