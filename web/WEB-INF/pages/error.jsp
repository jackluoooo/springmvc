<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/23
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出错啦！</title>
</head>
<body>
    <h4>Error Page!</h4>
    <%--<h3>Error is ${requestScope.ex}</h3>--%>
    <h3>Error is ${ex}</h3>
    <%--@SimpleMappingExceptionResolver的默认名称叫exception，可以通过配置来改变--%>
    <h3>Error is ${exception}</h3>
</body>
</html>
