                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
<%-- 
    Document   : index
    Created on : May 8, 2018, 3:54:12 AM
    Author     : Noman Ibrahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTACT LIST || NOMAN CAPP</title>
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
                    <c:if test="${param.act eq 'sv'}">
                        <p class="success">Your Contact is Saved Successfully</p>

                    </c:if>
                    <c:if test="${param.act eq 'del'}">
                        <p class="success">Your Contact is Deleted Successfully</p>

                    </c:if>

                    <c:if test="${param.act eq 'ed'}">
                        <p class="success">Your Contact is Edited Successfully</p>

                    </c:if>



                    <h3 align="center"> Contact List</h3>
                    <!-- ${contactList} -->
                    <!-- Search Operation -->
                    <form action="<s:url value="/user/contact_search"/>" align="center">
                        <input type="text" name="freeText" value="${param.freeText}" placeholder="Enter Your text">
                        <button>FIND</button>
                    </form>
                    </br>
                    
                    
                    <form action ="<s:url value="/user/bulk_cDelete"/>">
                        <table align="center">
                            <tr><td><button>Delete Selected</button><br/></td></tr>
                        
                        </table>
                    
                    <table border = "1" align="center">
                        <tr>
                            <th>SN</th>
                            <th>CID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>email</t>
                            <th>Address</th>
                            <th>Remark</th>
                            <th>Action</th>
                        </tr>
                        <c:if test="${(empty contactList) && (param.freeText ==null)}">
                            <tr>
                                <td align="center" colspan="8" class="error">No Records Present</td>
                            </tr>
                        </c:if>
                            <c:if test="${(empty contactList) && (param.freeText !=null) }">
                            <tr>
                                <td align="center" colspan="8" class="error">No records Found for the search <h3 style="color:green;">"${param.freeText}"</h3></br>please Type another text to search</td>
                            </tr>
                        </c:if>
                 



                        <c:forEach var="c" items="${contactList}" varStatus = "status">
                            <tr>
                                <td><input type="checkbox" name="cid"  value="${c.contactId}"></td>
                                <td>${c.contactId}</td>
                                <td>${c.name}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <td>${c.remark}</td>
                                <s:url var="url_delete" value="/user/delete">
                                    <s:param name="cid" value="${c.contactId}"/>
                                </s:url>
                                <s:url var="url_edit" value="/user/edit_contact">
                                    <s:param name="cid" value="${c.contactId}"/>
                                </s:url>

                                <td><a href="${url_edit}">Edit</a>| <a href="${url_delete}">Delete</a></td>
                            </tr>

                        </c:forEach>


                    </table>
                        </form>
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

