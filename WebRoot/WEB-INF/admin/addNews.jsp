<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/header.jspf"%>

<div class="content">

    <div class="header">

        <h1 class="page-title">添加内容</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li><a href="#">添加内容</a> </li>

    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center">${msg}</div>
            <div class="btn-toolbar">
                <button class="btn btn-primary" onclick="$('#tab').submit()"><i class="icon-save"></i> 保存</button>
                <div class="btn-group">
                </div>
            </div>
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="tab" method="post" action="${proPath}/news/addNews.action">
                            <div class="form-inline">
                            <label>标题:</label>
                            <input type="text" name="title" value="" class="input-xxlarge">
                            <label>作者:</label>
                            <input type="text" name="author" value="" class="input-large">
                            </div>  <div class="form-inline">
                            <label>链接:</label>
                            <input type="text" name="links" value="" class="input-xlarge">
                            <label>类别:</label>
                            <select name="category">
                                <option value="3333">新闻</option>
                                <option value="5555">链接</option>
                                <option value="5000">组内活动</option>
                                <option value="6000">文献学习</option>
                            </select>

                            </div>
                            <!-- 加载编辑器的容器 -->
                            <script id="container" name="content" style="width:99%;height:300px;"  type="text/plain">

                            </script>
                            <!-- 配置文件 -->
                            <script type="text/javascript" src="${proPath}/ueditor/ueditor.config.js"></script>
                            <!-- 编辑器源码文件 -->
                            <script type="text/javascript" src="${proPath}/ueditor/ueditor.all.js"></script>
                            <!-- 实例化编辑器 -->
                            <script type="text/javascript">
                                var ue = UE.getEditor('container');
                            </script>
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