<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/9
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#testJson").click(function () {
                var url = this.href;
                var args = {};
                $.post(url,args,function (data) {
                    for(var i=0;i<data.length;i++){
                        var id = data[i].id;
                        var lastName = data[i].lastName;
                        alert("id:"+id+"  "+"name:"+lastName)
                    }
                });
                return false;
            });
        });
    </script>
</head>
<body>
<a href="testJson" id="testJson"> testJson</a>

<form action="testHttpMessageConverter" method="post" enctype="multipart/form-data">
    File:<input type="file" name="file2"/>
    Desc:<input type="text" name="desc2"/>
    <input type="submit" value="提交">
</form>

<form action="testFileUpload" method="post" enctype="multipart/form-data">
    File:<input type="file" name="file1"/>
    Desc:<input type="text" name="desc1"/>
    <input type="submit" value="提交">
</form>
</body>
</html>
