<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">修改菜单</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="${proPath}/Menu/showMenu.action">菜单管理</a> <span class="divider">/</span></li>
        <li class="active">修改菜单</li>
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
                        <form id="tab" method="post" action="${proPath}/Menu/modifyMenu.action">
                            <label>菜单名</label>
                            <input type="text" name="name" value="${data.name}" class="input-xlarge">
                            <label>链接地址</label>
                            <input type="text" name="links" value="${data.links}" class="input-xlarge">
                            <label>类别</label>
                            <input type="text" name="category" value="${data.category}" class="input-xlarge">
                            <label>是否可用</label>
                            <select name="enable" id="enable" class="input-xlarge">
                                <option value="1" <c:if test="${data.enable=='1'}">selected</c:if>>可用</option>
                                <option value="0" <c:if test="${data.enable=='0'}">selected</c:if>>不可用</option>
                            </select>
                            <label>顺序</label>
                            <input type="text" id="ord" name="ord" value="${data.ord}" class="input-small">
                            <input type="text" name="id" value="${data.id}" class="hidden">
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