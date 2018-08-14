
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
        <title>Contact Save Form || NOMAN CAPP</title>
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href ="${url_css}" rel ="stylesheet" type="text/css"/>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
    <body background="${url_bg}">
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
                    <h3>Add New Contact</h3>
                    <c:if test="${err!=null}">
                        <p class="error">${err}</p>
                    </c:if>

                    <s:url var="url_csave" value = "/user/savecontact"/>
                    <f:form action="${url_csave}" modelAttribute="command">
                        <table border="1">

                            <tr>
                                <td>Name</td>
                                <td><f:input path="name"/></td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td><f:input path="phone"/></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><f:input path="email"/></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><f:textarea path="address"/></td>
                            </tr>
                            <tr>
                                <td>Remark</td>
                                <td><f:input path="remark"/></td>
                            </tr>

                            <tr>

                                <td colspan="2" align = "right">
                                    <f:button>Save</f:button><br>

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


