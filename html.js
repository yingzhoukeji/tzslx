function checkserAgent(){
    var userAgentInfo=navigator.userAgent;
    var userAgentKeywords=new Array("Android", "iPhone" ,"SymbianOS", "Windows Phone", "iPad", "iPod", "MQQBrowser");
      var flag=false;
    //排除windows系统 苹果系统
    if(userAgentInfo.indexOf("Windows NT")>-1){//改这里，不过只能判断windows系统
                flag=true;
    }
    return flag;
}
//移动设备
if(checkserAgent()){
    document.location.href="/index.html";
}