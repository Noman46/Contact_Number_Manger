
<%-- 
    Document   : index
    Created on : May 8, 2018, 3:54:12 AM
    Author     : Noman Ibrahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User DashBoard || NOMAN CAPP</title>
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
                      TODO: User related option will be here
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
