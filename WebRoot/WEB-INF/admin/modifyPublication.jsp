<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">添加论文</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="${proPath}/publication/showPublication.action">论文管理</a> <span class="divider">/</span></li>
        <li class="active">添加论文</li>
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
                        <form id="tab" method="post" action="${proPath}/publication/modifyPublication.action">
                            <label>论文名</label>
                            <input type="text" name="title" value="${pub.title}" class="input-xxlarge">
                            <label>年份</label>
                            <input type="text" name="year" value="${pub.year}" class="input-small">
                            <label>文件</label>
                            <input type="text" name="file" value="${pub.file}" class="input-xxlarge"><br/>
                            <iframe src="${proPath}/goURL/jsp/upload.action" width="480px" height="70px" frameborder="0" ></iframe>
                            <input type="text" name="id" value="${pub.id}" class="input-small hidden">
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