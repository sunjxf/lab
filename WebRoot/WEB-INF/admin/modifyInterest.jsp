<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">研究兴趣</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="#">研究兴趣</a> </li>

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
                        <form id="tab" method="post" action="${proPath}/news/modifyInterest.action">
                            <div class="form-inline">
                            <label>标题:</label>
                            <input type="text" name="title" value="${news.title}" class="input-xxlarge">
                            <label>作者:</label>
                            <input type="text" name="author" value="${news.author}" class="input-large">
                            </div>  <div class="form-inline">

                            <input type="text" name="links" value="${news.links}" class="input-xlarge hidden">

                            <input type="text" name="category" value="${news.category}" class="input-small hidden">
                            </div>
                            <!-- 加载编辑器的容器 -->
                            <script id="container" name="content" style="width:99%;height:300px;"  type="text/plain">
                                ${news.content}
                            </script>
                            <!-- 配置文件 -->
                            <script type="text/javascript" src="${proPath}/ueditor/ueditor.config.js"></script>
                            <!-- 编辑器源码文件 -->
                            <script type="text/javascript" src="${proPath}/ueditor/ueditor.all.js"></script>
                            <!-- 实例化编辑器 -->
                            <script type="text/javascript">
                                var ue = UE.getEditor('container');
                            </script>
                            <input type="text" name="id" value="${news.id}" class="input-small hidden">
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