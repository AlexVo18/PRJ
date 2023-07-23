<%-- 
    Document   : viewupdateplant
    Created on : Mar 11, 2023, 1:19:32 PM
    Author     : Admin
--%>

<%@page import="object.Category"%>
<%@page import="object.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header_adminpage.jsp" %>
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
        <%
            Plant plant = (Plant) request.getAttribute("plant");
            ArrayList<Category> catelist = (ArrayList<Category>) request.getAttribute("CateList");
        %>
        <form action="MainController" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Plant Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Category</th>
                    <th></th>
                </tr>
                <tr>
                    <td> 
                        <%= plant.getID()%>
                        <input type="text" name="txtid" value="<%= plant.getID()%>" hidden="">
                    </td>
                    <td><input type="text" name="txtname" value="<%= plant.getName()%>"></td>
                    <td><input type="text" name="txtprice" value="<%= plant.getPrice()%>"></td>
                    <td>
                        <img src="images/<%= plant.getImgpath()%>" width="100" height="100"><br>
                        <input type="file" name="txtimage" value="">
                    </td>
                    <td><input type="text" name="txtdescription" value="<%= plant.getDescription()%>"></td>
                    <td>
                        <input type="text" name="txtstatus" value="<%= plant.getStatus()%>" pattern="[0-1]{1}"><br>
                        <p style="font-size: 13px">(1 for in stock, 0 for out of stock)</p>
                    </td>
                    <td>
                        <select name="txtcategory">
                            <% for (Category c : catelist) {%>
                            <option value="<%= c.getCateID() %>"><%= c.getCateName()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
            </table>
            <button type="submit" name="action" value="UpdatePlant">Submit</button>
        </form>
    </body>
</html>
