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
        <title>LOGIN PAGE || NOMAN CAPP</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href ="${url_css}" rel ="stylesheet" type="text/css"/>
    </head>
    <s:url var="url_bg6" value="/static/images/bg6.jpg"/>
    <body background="${url_bg6}">
        <table border="1" width = "80%" align="center">
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
                    <h3>User Login</h3>
                    <c:if test="${err!=null}">
                        <p class="error">${err}</p>
                    </c:if>

                    <!-- FOR LOGOUT MESSAGE -->
                    <c:if test="${param.act eq 'lo'}">
                        <p class="success">You Logged out successfully !!</p>
                    </c:if>


                    <!-- FOR REGISTRATION SUCCESS MESSAGE -->
                    <c:if test="${param.act eq 'reg'}">
                        <p class="success">REGISTRATION SUCCESSFUL !! PLEASE lOGIN TO CONTINUE</p>
                    </c:if>

                    <s:url var="url_logIn" value = "/login" />
                    <f:form action ="${url_logIn}" modelAttribute="command">
                        <table border="1">
                            <tr>
                                <td>UserName</td>
                                <td><f:input path="loginName"/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><f:password path="password"/></td>
                            </tr>
                            <tr>

                                <td colspan="2" align = "right">
                                    <f:button>LogIn</f:button><br>
                                    <s:url var="url_register" value = "/reg_form"/>
                                        <a href="${url_register}">Register If You have not any account</a>
                                    </td>
                                </tr>
                            </table>



                    </f:form>
                </td>
            </tr>
            <tr>
                <td height="25px">
                    <%--footer--%>
                    <jsp:include page="include/footer.jsp"/>
                </td>
            </tr>

        </table>
    </body>
</html>
