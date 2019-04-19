<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/21
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>国际化测试2</title>
</head>
<body>
    <fmt:message key="i18n.password"></fmt:message>
    <br>
    <a href="i18n">i18n Page</a>
    <br>
    <a href="i18n?locale=zh_CH">中文</a>
    <br>
    <a href="i18n?locale=en_US">English</a>
</body>
</html>
