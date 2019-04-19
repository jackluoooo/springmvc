<%--springmvc表单标签--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/18
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
</head>
<body>
    <h3>字符串添加功能</h3>
    <form action="/testConversionServiceConverter" method="post">
        <%--lastName-email-gender-did--%>
        <%--例如：GG-gg@hotmail.com-femaie-3--%>
        Employee:<input type="text" name="employee"/>
            <input type="submit" value="提交字符串">

    </form>
    <h3>表单添加功能</h3>
    <%--
    1.为什么需要使用from标签。
    可以更快速的开发出表单页面，而且可以更方便的进行表单值的回显。
    path属性对应html表单的name属性
    2.可以通过modelAttribute属性指定绑定的属性模型
    若没有指定该属性，则默认从request域对象中读取command的表单bean
    如果该属性值也不存在，则会发生错误
    3.也就是说，modeAttribute指定bean对象，path指定对应属性
    --%>
    <form:form action="${pageContext.request.contextPath}/emp" method="post" modelAttribute="employee">
        <c:if test="${employee.id == 0}">
            LastName:<form:input path="lastName"/><form:errors path="lastName"></form:errors>
            <br>
        </c:if>
        <c:if test="${employee.id != 0}">
            <%--form的path属性在modelAttributre的Bean的对应属性一定要存在--%>
            <form:hidden path="id"/>
            <input type="hidden" name="_method" value="put"/>
        </c:if>
        Email:<form:input path="email"/><form:errors path="email"></form:errors>
        <br>
        Gender:<form:input path="gender"/>
        <br>
        Department:<form:select path="department" items="${departments}"
        itemLabel="departmentName" itemValue="id"/>
        <br>
        <!--
        1.数据类型转换
        2.数据类型格式化
        3.数据校验。
            3.1 如何校验？注解？
                1. 使用JSR 303验证标准
                2. 加入hibernate validator验证控件
                3. 在SpringMVC配置文件中添加<mvc:annotation-driven/>
                4. 需要在bean的属性上添加对应的注解。
                5. 在目标方法bean类型的前面添加@Valid注解
            3.2 验证出错转向哪一个页面？
            3.3 错误消息？如何显示，如何把错误消息进行国际化。
        -->
        <%--Birth:<form:input path="birth"/><form:errors path="birth"></form:errors>--%>
        <%--<br>--%>
        <input type="submit" value="提交"/>
    </form:form>
</body>
</html>
