

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : index
    Created on : May 10, 2018, 3:54:12 AM
    Author     : Noman Ibrahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List|| NOMAN CAPP</title>
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
                      <h3 align="center">Users List</h3>
                      <table border="1" align="center">
                          <tr>
                              <th>SR</th>
                              <th>Name</th>
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Address</th>
                              <th>User_Name</th>
                              <th>Status</th>
                          </tr>
                          <c:forEach var="u" items="${userList}" varStatus="st">
                               <tr>
                              <th>${st.count}</th>
                              <th>${u.name}</th>
                              <th>${u.phone}</th>
                              <th>${u.email}</th>
                              <th>${u.address}</th>
                              <th>${u.loginName}</th>
                              <th>${u.loginStatus}</th>
                          </tr>
                          </c:forEach>
                          
                      </table>
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
