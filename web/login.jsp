<%-- 
    Document   : login
    Created on : Feb 10, 2023, 9:40:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <form action="MainController" method="post">
                <h1>Login</h1>
                <table>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" name="txtemail" placeholder="Input your email here"></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="txtpassword" placeholder="Password here"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" value="SaveLogin" name="savelogin">Remember me</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Login" name="action"></td>
                    </tr>

                </table>
            </form>
            <%=(request.getAttribute("ERROR") != null) ? request.getAttribute("ERROR") : ""%>
            <%=(request.getAttribute("Success") != null) ? request.getAttribute("Success") : ""%>
            <%=(request.getAttribute("NeedLogin") != null) ? request.getAttribute("NeedLogin") : ""%>
            <%=(request.getAttribute("NotLogin") != null) ? request.getAttribute("NotLogin") : ""%>
        </div>
    </body>
</html>
