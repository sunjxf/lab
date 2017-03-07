<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="/common/common.jspf" %>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
    <title>实验室首页</title>
    <meta name="keywords" content="${setting.keywords}"/>
    <meta name="description" content="${setting.description}"/>
    <link rel="stylesheet" type="text/css" href="${proPath}/css/gorotron2.css"/>
</head>
<body>
<script src="${proPath}/js/jquery-1.7.2.min.js">

</script>


<div id="container">
    <div id="banner" style="clear:both;">
        <img src="${proPath}/upload/${setting.banner}"/>
    </div>
    <div style="width:960px; " id="navBar">
        <ul style="list-style:none;">
            <c:forEach items="${menu}" var="item">
                <li><a href="${item.links}?category=${item.category}">${item.name}</a></li>
                <li>|</li>
            </c:forEach>

        </ul>
    </div>
    <div style="clear:both"></div>
    <div id="sideBarleft">
        <div class="cytitle">
            <strong>研究兴趣</strong>
        </div>
        <div id="box" style="height:200px; overflow:hidden;">
            <c:forEach items="${interests}" var="item">

                <img alt="" src="${proPath}/images/list.gif"/>&nbsp;&nbsp;${item}
                <br/>
                <br/> </c:forEach>

        </div>
        <div id="box2" style="margin-top:5px; margin-bottom:5px;"></div>
        <div class="cytitle">
            <strong>友情链接</strong>
        </div>
        <div id="box3" style="line-height:200%;  ">
            <div style="padding-left:20px;">
                <c:forEach items="${linksList}" var="item">
                <a href="${item.links}" target="_blank">${item.title}</a>
                <br/>
                </c:forEach>
            </div>
        </div>
    </div>

    <div id="main" style="line-height:20px; padding-left:15px;  border-left:#09F 1px dotted; ">
        <div class="cytitle">
            <span style="float:right"><a href="#"></a></span>
            <strong>组内相册</strong>
        </div>
        <div style="line-height:20px; margin-bottom:8px;">
            <embed src="${proPath}/images/picview.swf"

                   flashvars="bcastr_file=${album}&amp;bcastr_config=0xffffff:文字颜色|3:文字位置|0x0066ff:文字背景颜色|30:文字背景透明度|0xffffff:按键文字颜色|0x0066ff:按键默认颜色|0x000033:按键当前颜色|6:自动播放时间(秒)|2:图片过渡效果|1:是否显示按钮|_blank:打开窗口"
                   width="660" height="300" loop="true" quality="high"
                   pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"
                   menu="false" wmode="transparent"/>
        </div>
        <div style="clear:both"></div>
        <div style="float:left; width:100%;">
            <div class="cytitle">
                <span><a href="${proPath}/contentlist.action?category=3333">更多&gt;&gt;</a></span>
                <strong>实验室新闻</strong>
            </div>
            <div style=" text-align:justify; text-justify:inter-ideograph;">
                <ul class="li3">
                    <c:forEach items="${newsList}" var="item">
                    <li><p>  <a href="${proPath}/showcontent.action?id=${item.id}" target="_blank">${item.title}</a>   </p></li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>

    <div id="clear"></div>
</div>

<div id="bottom">
</div>
<div id="copy">
    ${setting.copyright} &nbsp;&nbsp;&nbsp;<a href="${proPath}/goURL/admin/sign-in.action">网站管理</a>
    <p></p>
</div>
</body>
</html>