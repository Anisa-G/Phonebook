<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact List - Phonebook</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <s:url var="url_css" value="/static/css/clist.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>  

        <table class="nav_bar">
            <tr class="menu">
                <td height="25px">
                    <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
            <tr>
        </table>               
        <h3 id="clist_header">Contact List</h3>
        <table>
            <tr>
                <c:if test="${param.act eq 'sv'}">
                <p class="success">Contact Saved Successfully</p>
            </c:if>
            <c:if test="${param.act eq 'del'}">
                <p class="success">Contact Deleted Successfully</p>
            </c:if>

            <table>
                <tr>
                    <td>
                        <form action="<s:url value="/user/contact_search"/>">
                            <input type="text" name="freeText" value="${param.freeText}" placeholder="Search" class="clist_find">
                            <button class="btn" id="find_button">Find</button>
                        </form>
                    </td>                           
                </tr>
            </table>

            <form action="<s:url value="/user/bulk_cdelete"/>">           
                <button class="dltbtn">Delete Selected Records</button>

                <table class="container" id="clist_table">

                    <thead>
                        <tr>      
                            <th width="30px"><h1>Select</h1></th>
                            <th width="80px"><h1>CID</h1></th>
                            <th width="150px"><h1>Name</h1></th>
                            <th width="150px"><h1>Phone</h1></th>
                            <th width="200px" ><h1>Email</h1></th>
                            <th width="370px" ><h1>Address</h1></th>
                            <th width="430px" ><h1>Note</h1></th>
                            <th colspan="2"><h1>Action</h1></th>
                        </tr>

                        <c:if test="${empty contactList}">
                            <tr>
                                <td align="center" colspan="8" class="error">No Records Present</td>
                            </tr>
                        </c:if>

                        <c:forEach var="c" items="${contactList}" varStatus="st">
                            <tr>
                                <td align="center"><input type="checkbox" name="cid" value="${c.contactId}"/></td>
                                <td>${c.contactId}</td>
                                <td >${c.name}</td>
                                <td >${c.phone}</td>
                                <td >${c.email}</td>
                                <td >${c.address}</td>
                                <td >${c.note}</td>    
                                <s:url var="url_del" value="/user/del_contact">
                                    <s:param name="cid" value="${c.contactId}"/>
                                </s:url>   
                                <s:url var="url_edit" value="/user/edit_contact">
                                    <s:param name="cid" value="${c.contactId}"/>
                                </s:url> 
                                <td class="del"><a href="${url_edit}">Edit</a></td>
                                <td class="del"><a href="${url_del}">Delete</a></td>
                            </tr> 
                        </c:forEach>
                </table>
            </form>     
        </td>
    </tr>
    <tr>
    </tr>
</table>
</body>
</html>
