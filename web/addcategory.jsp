<%-- 
    Document   : addcategory
    Created on : Mar 7, 2023, 7:55:02 PM
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
        <form action="MainController" method="post" class="">
            <h1>Add a new category</h1>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="txtname" required=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit" value="AddCategory" name="action">Add</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
