//var serverUrl="http://192.168.0.103:81/jyst/api.php/Index";
var serverUrl="http://www.tzslx.com/dsapi/api.php/Index";
//var picUrl="http://192.168.0.102:81/jyst/api.php/Index/jpg?id=";
//var picUrl="http://192.168.0.103:81";
var picUrl="http://www.tzslx.com";
var indexUrl="http://www.tzslx.com/wx/index.html";
var lang="zh-cn";
function GetQueryString(name)     
{     
     var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");    			    
     var r=window.location.search.substr(1).match(reg);     
     if(r!=null) return unescape(r[2]);   
     return   null;
}
String.prototype.replaceAll  = function(s1,s2){
	return this.replace(new RegExp(s1,"gm"),s2);
}