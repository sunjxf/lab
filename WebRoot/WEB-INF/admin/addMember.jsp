<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">添加成员</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="${proPath}/member/showMember.action">成员管理</a> <span class="divider">/</span></li>
        <li class="active">添加成员</li>
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
                        <form id="tab" method="post" action="${proPath}/member/addMember.action">
                            <div class="form-inline"> <label>姓名</label>
                            <input type="text" name="name" value="" class="input-xlarge">
                            <label>邮箱</label>
                            <input type="text" name="email" value="" class="input-xlarge">
                            </div><br><div class="form-inline">
                        <label>类别</label>
                            <select name="category">
                                <option value="1">导师</option>
                                <option value="2">博士</option>
                                <option value="3">硕士</option>
                            </select></div><br><div class="form-inline">
                            <label>头像</label>
                            <input type="text" name="img" value="" class="input-xlarge">(请上传头像图片)</div>
                            <iframe src="${proPath}/goURL/jsp/upload.action" width="480px" height="70px" frameborder="0" ></iframe>
                            <label>教育背景</label>
                            <textarea type="text" name="education" class="input-xlarge" rows="3" style="margin: 0px; width: 480px; height: 100px;"></textarea>
                            <label>工作经验</label>
                            <textarea type="text" name="workExperience" class="input-xlarge" rows="3" style="margin: 0px; width: 480px; height: 100px;"></textarea>
                            <label>研究兴趣</label>
                            <textarea type="text" name="researchInterest" class="input-xlarge" rows="3" style="margin: 0px; width: 480px; height: 100px;"></textarea>
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