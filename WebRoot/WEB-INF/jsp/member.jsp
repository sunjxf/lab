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


    <div id="main1" style="line-height:20px;">


        <div id="cyrightsidebar1">
            <div class="cytitle"><strong>
                <c:if test="${mem.category=='1'}">导师</c:if>
                <c:if test="${mem.category=='2'}">博士</c:if>
                <c:if test="${mem.category=='3'}">硕士</c:if>
            </strong></div>
            <div style=" float:left; margin-right:30px;">
                <img style=" display:block; max-width:300px" id="img"
                     src="${proPath}/upload/${mem.img}"><br>
                <h1 class="aboutbt">${mem.name}</h1></div>
            <p><strong><br><br><span style="color:#000066;"><span
                    style="color:#3366ff;">Education:</span><br></span></strong>
                ${mem.education}
                <br><br><strong><span style="color:#6666cc;BACKGROUND-COLOR: #ffffff"><span
                        style="color:#3366ff;">Work Experience:</span><br></span></strong>
                ${mem.workExperience}
                <br><br><strong><span style="color:#6666cc;BACKGROUND-COLOR: #ffffff"><span
                        style="color:#3366ff;"> Research Interests: </span><br></span></strong>
                ${mem.researchInterest}
            <p><strong><span style="color:#6633ff;"><span
                    style="color:#3366ff;">Email:</span><br> </span></strong> ${mem.email}</p>

            <p><br></p>

            <div style="clear:both;"></div>
            <div class="hits">【<a href="javascript:window.print()">Print</a>】【<a
                    href="javascript:self.close()">Close</a>】
            </div>

        </div>


        <div style="clear:both"></div>
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