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


<div id="main1" style="line-height:20px;min-height: 600px;">
     <div id="cyrightsidebar1" >
		<div class="cytitle"><strong>内容列表</strong></div>

         <ul class="newslb">
             <li class='zwbt' ></li>
             ${msg}
             <c:forEach items="${news}" var="item">
             <li style='margin-bottom:8px;background-image:none;height:auto'><a href="${proPath}/showcontent.action?id=${item.id}"><p>${item.title}</p></a></li>
             <li class='zwbt'  style='border-bottom:#09F dotted 1px;'></li>
             <li class='zwbt' ></li>
             </c:forEach>
         </ul>
         <div style="height: 40px; margin: 20px 0;text-align: center;">
             <ul style="display: inline-block;margin-left: 0;margin-bottom: 0;">
                 <li style="display: inline;"><a href="?category=${page.category}&pageIndex=1">&nbsp;&nbsp;第一页&nbsp;&nbsp;</a>
                 </li>
                 <li style="display: inline;"><a href="?category=${page.category}&pageIndex=${page.pageIndex-1}">上一页</a></li>

                 <li style="display: inline;"><a href="?category=${page.category}&pageIndex=${page.pageIndex+1}">&nbsp;&nbsp;下一页&nbsp;&nbsp;</a>
                 </li>
                 <li style="display: inline;"><a href="?category=${page.category}&pageIndex=${page.totalPage}">&nbsp;&nbsp;最后一页&nbsp;&nbsp;</a>
                 </li>
                 <li style="display: inline;"><a href="#">${page.pageIndex}/${page.totalPage}</a>
                 </li>
             </ul>
         </div>
        <div style="clear:none;"></div>

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