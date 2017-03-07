<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>
<script type="text/javascript">
    var GlobalId;
    function doDelete(id) {
        GlobalId = id;
    }
    function goyes() {
        window.location.href = "${proPath}/Menu/Delete.action?id="
            + GlobalId;
    }
</script>
<div class="content">

    <div class="header">

        <h1 class="page-title">菜单管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li class="active">菜单管理</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center" >${msg}</div>
            <div class="btn-toolbar">
                <a href="${proPath}/goURL/admin/addMenu.action"> <button class="btn btn-primary"><i class="icon-plus"></i> 添加新菜单</button></a>

                 <div class="btn-group">
                </div>
            </div>

            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>菜单名</th>
                        <th>菜单链接</th>
                        <th>类别</th>
                        <th>是否可用</th>
                        <th>排序</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${menu}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.links}</td>
                        <td>${item.category}</td>
                        <td>
                        <c:if test="${item.enable=='1'}">可用</c:if><c:if test="${item.enable=='0'}">不可用</c:if>
                        </td>
                        <td>${item.ord}</td>
                        <td>
                            <a href="${proPath}/Menu/showModifyMenu.action?id=${item.id}">编辑<i class="icon-pencil"></i></a>&nbsp;
                            <a href="#myModal" onclick="doDelete('${item.id}')" role="button" data-toggle="modal">删除<i class="icon-remove"></i></a>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">提示</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>是否确认删除?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" onclick="goyes()" data-dismiss="modal">确认</button>
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


