<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Driver to Car</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>Add Driver to Car</h1>
<form method="post" action="${pageContext.request.contextPath}/cars/drivers/add">
    <label for="driver">Driver</label><br>
    <select id="driver" name="driver_id">
        <c:forEach items="${drivers}" var="driver">
            <option value="<c:out value="${driver.id}" />">
                <c:out value="${driver.name}" /></option>
        </c:forEach>
    </select>
    <br>
    <label for="car">Car</label><br>
    <select id="car" name="car_id">
        <c:forEach items="${cars}" var="car">
            <option value="<c:out value="${car.id}" />">
                <c:out value="${car.model}" /></option>
        </c:forEach>
    </select>
    <button type="submit">Create car</button>
</form>
</body>
</html>
