<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="common/header.jspf" %>
<script type="text/javascript">
    var GlobalId;
    function doDelete(id) {
        GlobalId = id;
    }
    function goyes() {
        window.location.href = "${proPath}/member/DeleteMember.action?id="
            + GlobalId;
    }
</script>
<div class="content">

    <div class="header">

        <h1 class="page-title">成员管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li class="active">成员管理</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center">${msg}</div>
            <div class="btn-toolbar">
                <a href="${proPath}/goURL/admin/addMember.action">
                    <button class="btn btn-primary"><i class="icon-plus"></i> 添加成员</button>
                </a>

                <div class="btn-group">
                </div>
            </div>

            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>姓名</th>
                        <th>图片</th>
                        <th>类型</th>
                        <th>邮箱</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${mem}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td width="10%">${item.name}</td>
                            <td width="40%">${item.img}</td>
                            <td width="10%">
                                <c:if test="${item.category=='1'}">导师</c:if>
                                <c:if test="${item.category=='2'}">博士</c:if>
                                <c:if test="${item.category=='3'}">硕士</c:if>
                            </td>
                            <td width="20%">${item.email}</td>
                            <td>
                                <a href="${proPath}/member/showModifyMember.action?id=${item.id}">编辑<i
                                        class="icon-pencil"></i></a>&nbsp;
                                <a href="#myModal" onclick="doDelete('${item.id}')" role="button" data-toggle="modal">删除<i
                                        class="icon-remove"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination pagination-centered">
                    <ul>
                        <li><a href="?pageIndex=1">&nbsp;&nbsp;第一页&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="?pageIndex=${page.pageIndex-1}">上一页</a></li>

                        <li><a href="?pageIndex=${page.pageIndex+1}">&nbsp;&nbsp;下一页&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="?pageIndex=${page.totalPage}">&nbsp;&nbsp;最后一页&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="#">${page.pageIndex}/${page.totalPage}</a>
                        </li>
                    </ul>
                </div>
            </div>


            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
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


<%@include file="common/footer.jspf" %>


