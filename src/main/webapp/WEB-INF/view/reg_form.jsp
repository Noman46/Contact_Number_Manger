<%-- 
    Document   : index
    Created on : May 8, 2018, 3:54:12 AM
    Author     : Noman Ibrahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration || NOMAN CAPP</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href ="${url_css}" rel ="stylesheet" type="text/css"/>
    </head>
    <s:url var="url_bg6" value="/static/images/bg6.jpg"/>
    <body background="${url_bg6}">
        <table border="2" width = "80%" align="center">
            <tr>
                <td height="80px">
                    <%--Header--%>
                    <jsp:include page="include/header.jsp"/>
                </td>
            </tr>
            <tr>
                <td height="25px">
                    <%--Menue--%>
                    <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
            <tr>
                <td height="350px">
                    <%--Content--%>
                    <h3>User Registration</h3>
                    <c:if test="${err!=null}">
                        <p class="error">${err}</p>
                    </c:if>

                    <s:url var="url_reg" value = "/register" />
                    <f:form action ="${url_reg}" modelAttribute="command">
                        <table border="1">

                            <tr>
                                <td>Name</td>
                                <td><f:input path="user.name"/></td>
                            </tr>
                            
                            <tr>
                                <td>Phone</td>
                                <td><f:input path="user.phone"/></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><f:input path="user.email"/></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><f:textarea path="user.address"/></td>
                            </tr>
                            <tr>
                                <td>UserName</td>
                                <td><f:input path="user.loginName"/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><f:password path="user.password"/></td>
                            </tr>

                            <tr>

                                <td colspan="2" align = "right">
                                    <f:button>Submit</f:button><br>

                                    </td>
                                </tr>
                            </table>



                    </f:form>
                </td>
            </tr>
            <tr>
                <td height="25px">
                    <%--footer--%>
                    </br>
                    </br>
                    <jsp:include page="include/footer.jsp"/>
                </td>
            </tr>

        </table>
    </body>
</html>