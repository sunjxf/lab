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
            <div style="clear:both"></div>

            <c:forEach var="c" items="${cg}">
                <div class="cytitle">
                    <strong>
                        <c:if test="${c=='1'}">课题组负责人</c:if>
                        <c:if test="${c=='2'}">教师</c:if>
                        <c:if test="${c=='3'}">博士后</c:if>
                        <c:if test="${c=='4'}">博士</c:if>
                        <c:if test="${c=='5'}">硕士</c:if>
                        <c:if test="${c=='6'}">已毕业博/硕士</c:if>

                    </strong>
                </div>

                <ul class="cp">
                    <c:forEach var="item" items="${mem}">
                        <c:if test="${item.category==c}">
                            <li><a title="${item.name}" href="${proPath}/member.action?id=${item.id}"><img alt="${item.name}" src="${proPath}/upload/${item.img}"/>
                                <p>${item.name}</p></a></li>
                        </c:if>
                    </c:forEach>
                </ul>
                <div style="clear:both"></div>
            </c:forEach>


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