<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/18
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>展示所有用户信息</title>
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <!--
    SpringMVC处理静态资源：
    1.为什么会有这样的问题：
    优雅的REST风格的资源URL不希望带html或.do后缀
    若将DispatcherServlet映射配置为/。
    则SpringMVC将捕获WEB容器的所有请求，包括静态资源的请求，SpringMVC
    会将他们当成一个普通请求处理，因找到对应的处理方法将导致报错
    2.解决：
    在SpringMVC的配置文件中配置<mvc:default-servlet-handler/>
    3.完成2之后，非静态资源不好用了
    解决：<mvc:annotation-driven></mvc:annotation-driven>
    -->
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var href = $(this).attr("href");
                $("form").attr("action",href).submit();
                return false;
            });
        })
    </script>
</head>
<body>

    <form action="" method="POST">
        <input type="hidden" name="_method" value="DELETE"/>
    </form>

    <h1 align="center">展示所有用户信息<h1>
    <%--${requestScope.employees}--%>
    <c:if test="${empty requestScope.employees}">没有任何员工信息</c:if>
    <c:if test="${!empty requestScope.employees}">
        <table border="1" cellpadding="10" cellspacing="0" align="center">
            <tr>
                <th>ID</th>
                <th>LastName</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Department</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${requestScope.employees}" var="emp">
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.lastName}</td>
                    <td>${emp.email}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.department.departmentName}</td>
                    <td><a href="emp/${emp.id}">Edit</a></td>
                    <td><a class="delete" href="emp/${emp.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

        <br><br>
        <a href="emp">添加新员工</a>

        <%--<form action="emp/16" method="post" >--%>
            <%--<input type="hidden" name="_method" value="delete"/>--%>
            <%--<input type="submit" value="删除16">--%>
        <%--</form>--%>

</body>
</html>
