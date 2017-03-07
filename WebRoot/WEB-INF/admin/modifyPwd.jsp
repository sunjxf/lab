<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">修改密码</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="${proPath}/member/showMember.action">修改密码</a> <span class="divider">/</span></li>
        <li class="active">修改密码</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="btn-toolbar">
                <button class="btn btn-primary" onclick="$('#tab').submit()"><i class="icon-save"></i> 保存</button>
                <div class="btn-group">
                </div>
            </div>
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="tab" method="post" action="${proPath}/user/modifyPwd.action">
                            <div class="form-inline"> <label>用户名</label>
                            <input type="text" name="username" value="${users.username}" class="input-xlarge" readonly>
                            <label>密码</label>
                            <input type="password" name="password" value="${users.password}" class="input-xlarge">
                            </div><br>
                            <input type="text" name="id" value="${users.id}" class="hidden">
                        </form>
                    </div>
                </div>

            </div>


            <footer>
                <hr>



                <p>&copy; 2017 <a href="#" target="_blank">Sun</a></p>
            </footer>

        </div>
    </div>
</div>


<%@include file="common/footer.jspf"%>