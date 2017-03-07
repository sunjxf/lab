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
		<div class="cytitle"><strong>研究兴趣</strong></div>
	${news.content}

        <div style="clear:none;"></div>
		<div style="float:right;"> [<a href="javascript:window.print()">Print</a>][<a href="javascript:self.close()">Close</a>]</div>
			
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