<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<s:url var="url_logout" value = "/logout"/>
<s:url var="url_register" value = "/reg_form"/>


<c:if test="${sessionScope.userId == null}">
    <!-- User is not yet logged in:- Guest User --> 
    <a href="#">HOME</a> | <a href="#">LOGIN</a> | <a href="${url_register}">REGISTER</a> | <a href="#">ABOUT</a>
</c:if>


    <!-- For admin Page Menue -->
<c:if test="${sessionScope.userId !=null && sessionScope.role == 1}">
    <!-- Admin is logged in:- Admin User --> 
    <a href="#">HOME</a> | <a href="<s:url value="/admin/userList"/>">User List</a> | <a href="${url_logout}">Logout</a> |

    <!-- For User Page Menue -->

</c:if>

    <c:if test="${sessionScope.userId !=null && sessionScope.role == 2}">
    <s:url var="url_contact_form" value = "/addContact"/>
    <s:url var="url_contact_list" value = "/user/clist"/>
    
    <a href="#">HOME</a> | <a href="${url_contact_form}">Add Contact</a> | <a href="${url_contact_list}">Contact List</a> | <a href="${url_logout}">Logout</a> |
</c:if>

