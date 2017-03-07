<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="common/header.jspf" %>


<div class="content">

    <div class="header">
        <h1 class="page-title">首页</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${proPath}/Home/Show.action">首页</a> <span class="divider">/</span></li>
        <li>网站设置</li>
    </ul>
    <form class="form-horizontal" id="tab" method="post" action="${proPath}/Home/Save.action">
        <div style="padding: 5px;">
            <button class="btn btn-primary" type="submit"><i class="icon-save"></i> 保存</button>
        </div>

    <div class="container-fluid">
        <div class="row-fluid">
            <div style="color:green; text-align: center">${msg}</div>

            <div class="row-fluid">
                <div class="block span6">
                    <a href="#tablewidget" class="block-heading" data-toggle="collapse">网站设置</a>
                    <div id="tablewidget" class="block-body collapse in">
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">

                                <br/> <label for="keywords">网站关键字</label>
                                <textarea type="text" id="keywords" name="keywords"
                                          style="margin: 0px; width: 480px; height: 50px;">${setting.keywords}</textarea>
                                <label for="description">网站描述</label>
                                <textarea type="text" id="description" name="description"
                                          style="margin: 0px; width: 480px; height: 50px;">${setting.description}</textarea>
                                <label for="banner">顶部图片地址</label>
                                <input type="text" id="banner" name="banner" value="${setting.banner}"
                                       style="margin: 0px; width: 480px;">
                                <iframe src="${proPath}/goURL/jsp/upload.action" width="480px" height="70px"
                                        frameborder="0"></iframe>
                                <label for="interests">研究兴趣(以竖线“|”分割开)</label>
                                <textarea id="interests" name="interests" rows="3"
                                          style="margin: 0px; width: 480px; height: 100px;">${setting.interests}</textarea>
                                <label for="copyright">底部版权</label>
                                <textarea type="text" id="copyright" name="copyright"
                                          style="margin: 0px; width: 480px; height: 50px;">${setting.copyright}</textarea>
                                <br/>
                                <input type="text" id="id" name="id" value="${setting.id}" class="hidden">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="block span6">
                    <div class="block-heading">
            <span class="block-icon pull-right">
                <a href="#" class="demo-cancel-click" rel="tooltip" title="Click to refresh"></a>
            </span>

                        <a href="#widget2container" data-toggle="collapse">组内相册</a>
                    </div>
                    <div id="widget2container" class="block-body collapse in">
                        <label for="album">每张图片以竖线“,”分割开</label>
                        <textarea id="album" name="album" rows="3"
                                  style="margin: 0px; width: 480px; height: 100px;">${setting.album}</textarea>
                        <iframe src="${proPath}/goURL/jsp/upload.action" width="480px" height="270px"
                                frameborder="0"></iframe>



                    </div>
                </div>
            </div>
            <footer>
                <hr>


                <p>&copy; 2017 <a href="#" target="_blank">Sun</a></p>
            </footer>

        </div>
    </div>
    </form>

</div>


<%@include file="common/footer.jspf" %>


