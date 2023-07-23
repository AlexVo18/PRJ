<%-- 
    Document   : manageplants
    Created on : Mar 3, 2023, 4:05:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles/adminstyles.css">
    </head>
    <body>
        <p:import url="header_adminpage.jsp"></p:import>
            <nav class="">
                <ul>
                    <li>
                        <form action="MainController" method="post">
                            <input type="text" name="txtsearch" 
                                   value="<%=(request.getParameter("keyword") != null) ? request.getParameter("keyword") : ""%>"
                            placeholder="Enter plant name">
                        <button type="submit" value="SearchPlant" name="action">Search</button>
                    </form>
                </li>
                <li><a href="MainController?action=ManageCategories">Add new plant</a></li>
                <li><a href="addcategory.jsp">Add new category</a></li>
            </ul>    
        </nav>
        <table class="admin-plant">
            <p:forEach var="cate" items="${ requestScope.CateList2 }">
                <thead>
                <td class="admin-plant-cate">
                    <h1><p:out value="${ cate.getCateName() }"></p:out></h1>
                    </td>
                    <tr>
                        <th>ID</th>
                        <th>Plant Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
            <p:forEach var="plant" items="${ requestScope.PlantList }">
                <p:if test="${ cate.getCateID() eq plant.getCateID() }">
                    <tbody>
                        <tr>
                            <td><p:out value="${ plant.getID() }"></p:out></td>
                            <td><p:out value="${ plant.getName() }"></p:out></td>
                            <td><p:out value="${ plant.getPrice() }"></p:out></td>
                                <td>
                                <p:url value="images/${plant.getImgpath()}" var="imageURL"></p:url>
                                <img src="${imageURL}" width="100" height="100"/>
                            </td>
                            <td><p:out value="${ plant.getDescription() }"></p:out></td>
                            <td><p:choose>
                                    <p:when test="${ plant.getStatus() eq 1}"> In stock </p:when>
                                    <p:otherwise>Out of stock</p:otherwise>
                                </p:choose></td>
                            <td>
                                <p:url var="stock" value="MainController">
                                    <p:param name="ID" value="${ plant.getID() }"></p:param>
                                    <p:param name="status" value="${ plant.getStatus() }"></p:param>
                                    <p:param name="action" value="UpdateStatusPlant"></p:param>
                                </p:url>
                                <p:url var="view" value="MainController">
                                    <p:param name="ID" value="${ plant.getID() }"></p:param>
                                    <p:param name="action" value="ViewUpdatePlant"></p:param>
                                </p:url>
                                <a href="${ stock }">Update status</a><br>
                                <a href="${ view }">Change plant info</a><br>
                            </td>
                        </tr>
                    </tbody>
                </p:if>
            </p:forEach>
            <p:forEach var="plant" items="${ requestScope.SearchPlantList }">
                <p:if test="${ cate.getCateID() eq plant.getCateID() }">
                    <tbody>
                        <tr>
                            <td><p:out value="${ plant.getID() }"></p:out></td>
                            <td><p:out value="${ plant.getName() }"></p:out></td>
                            <td><p:out value="${ plant.getPrice() }"></p:out></td>
                                <td>
                                <p:url value="images/${plant.getImgpath()}" var="imageURL"></p:url>
                                <img src="${imageURL}" width="100" height="100"/>
                            </td>
                            <td><p:out value="${ plant.getDescription() }"></p:out></td>
                            <td><p:choose>
                                    <p:when test="${ plant.getStatus() eq 1}"> In stock </p:when>
                                    <p:otherwise>Out of stock</p:otherwise>
                                </p:choose></td>
                            <td>
                                <p:url var="stock" value="MainController">
                                    <p:param name="ID" value="${ plant.getID() }"></p:param>
                                    <p:param name="status" value="${ plant.getStatus() }"></p:param>
                                    <p:param name="action" value="UpdateStatusPlant"></p:param>
                                </p:url>
                                <p:url var="view" value="MainController">
                                    <p:param name="ID" value="${ plant.getID() }"></p:param>
                                    <p:param name="action" value="ViewUpdatePlant"></p:param>
                                </p:url>
                                <a href="${ stock }">Update status</a><br>
                                <a href="${ view }">Change plant info</a><br>
                            </td>
                        </tr>
                    </tbody>
                </p:if>
            </p:forEach>
        </p:forEach>
    </table>
</body>
</html>
