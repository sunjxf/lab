<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="proPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="../../js/jquery-1.7.2.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        j = 1;
        $(document).ready(function(){

            $("#btn_add").click(function(){
                document.getElementById("newUpload").innerHTML+='<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  /><input type="button" value="删除"  onclick="del('+j+')"/></div>';
                j = j + 1;
            });
        });

        function del(o){
            document.getElementById("newUpload").removeChild(document.getElementById("div_"+o));
        }

    </script>
</head>
<body>
<form name="ff" action="${proPath}/file/upload.action" enctype="multipart/form-data" method="post">
<div id="newUpload">
    <input type="file" name="file">
</div>
    <input type="button" id="btn_add" value="增加一行" ><input type="submit" value="上传" >
</form>
</body>
</html>