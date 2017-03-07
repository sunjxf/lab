<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${proPath}/lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="${proPath}/stylesheets/theme.css">
    <link rel="stylesheet" href="${proPath}/lib/font-awesome/css/font-awesome.css">

    <script src="${proPath}/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
   </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="#"><span class="first">Lab</span> <span class="second">后台登录系统</span></a>
        </div>
    </div>
    


    

    
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form id="ff" method="post" action="${proPath}/user/login.action">
                    <label>用户名</label>
                    <input type="text" name="username"  class="span12">
                    <label>密码</label>
                    <input type="password" name="password" class="span12">
                    <label>验证码</label>
                    <div class="form-inline">
                    <input type="text" name="code" class="span2">
                    <img id="img" src="${proPath}/user/authImage.action" onclick="javascript:changeImg()"/>
                    <a href='#' onclick="javascript:changeImg()"><label>看不清？</label></a>
                    </div>
                    <a href="#" onclick="$('#ff').submit();" class="btn btn-primary pull-right">登录</a>
                    <div style="color:red" >${requestScope.msg}</div>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>


  <script type="text/javascript">
      function changeImg(){
          var img = document.getElementById("img");
          img.src = "${proPath}/user/authImage.action?date=" + new Date();;
      }
  </script>


    <script src="${proPath}/lib/bootstrap/js/bootstrap.js"></script>
    
  </body>
</html>


