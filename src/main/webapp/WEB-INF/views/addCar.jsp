<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add car</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>Add car</h1>
<form method="post" action="${pageContext.request.contextPath}/cars/add">
    <label for="model">Model</label><br>
    <input id="model" type="text" name="model">
    <br>
    <label for="manufacturer">Manufacturer</label><br>
    <select id="manufacturer" name="manufacturer_id">
        <c:forEach items="${manufacturers}" var="manufacturer">
            <option value="<c:out value="${manufacturer.id}" />">
                <c:out value="${manufacturer.name}" /></option>
        </c:forEach>
    </select>
    <button type="submit">Create car</button>
</form>
</body>
</html>
