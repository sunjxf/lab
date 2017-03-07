<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="common/header.jspf" %>
<script type="text/javascript">
    var GlobalId;
    function doDelete(id) {
        GlobalId = id;
    }
    function goyes() {
        window.location.href = "${proPath}/news/deleteNews.action?category=${page.category}&id="
            + GlobalId;
    }
</script>
<div class="content">

    <div class="header">

        <h1 class="page-title">内容管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>

    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center">${msg}</div>

            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>标题</th>
                        <th>时间</th>
                        <th>作者</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${news}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td width="60%">${item.title}</td>
                            <td width="10%"><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd" /> </td>
                            <td width="10%">${item.author}</td>
                            <td width="10%">
                                <a href="${proPath}/news/showModifyNews.action?id=${item.id}">编辑<i
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
                        <li><a href="?category=${page.category}&pageIndex=1">&nbsp;&nbsp;第一页&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="?category=${page.category}&pageIndex=${page.pageIndex-1}">上一页</a></li>

                        <li><a href="?category=${page.category}&pageIndex=${page.pageIndex+1}">&nbsp;&nbsp;下一页&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="?category=${page.category}&pageIndex=${page.totalPage}">&nbsp;&nbsp;最后一页&nbsp;&nbsp;</a>
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


