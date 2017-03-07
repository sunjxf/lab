<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="common/header.jspf" %>
<script type="text/javascript">
    var GlobalId;
    function doDelete(id) {
        GlobalId = id;
    }
    function goyes() {
        window.location.href = "${proPath}/publication/DeletePublication.action?id="
            + GlobalId;
    }
</script>
<div class="content">

    <div class="header">

        <h1 class="page-title">论文管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li class="active">论文管理</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center">${msg}</div>
            <div class="btn-toolbar">
                <a href="${proPath}/goURL/admin/addPublication.action">
                    <button class="btn btn-primary"><i class="icon-plus"></i> 添加论文</button>
                </a>

                <div class="btn-group">
                </div>
            </div>

            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>论文名</th>
                        <th>年份</th>
                        <th>文件</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pub}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td width="60%">${item.title}</td>
                            <td>${item.year}</td>
                            <td width="20%">${item.file}</td>
                            <td width="10%">
                                <a href="${proPath}/publication/showModifyPublication.action?id=${item.id}">编辑<i
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


