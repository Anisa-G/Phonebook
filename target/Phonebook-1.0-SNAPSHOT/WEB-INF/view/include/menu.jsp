<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<s:url var="url_logout" value="/logout"/>

<c:if test="${sessionScope.userId==null}">
    <s:url var="url_reg_form" value="/reg_form"/>
    <s:url var="url_index" value="/index"/>
    <a class="menu_item" href="${url_index}">Home</a> | <a class="menu_item" href="${url_index}">Login</a> | <a class="menu_item" href="${url_reg_form}">Register</a> | <a class="menu_item" href="#">About</a> | <a class="menu_item" href="#">Help</a>   
</c:if>
<c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">  
    <a class="menu_item" href="#">Home</a> | <a class="menu_item" href="<s:url value="/admin/users"/>">User List</a> | <a class="menu_item" href="${url_logout}">Logout</a>  
</c:if>
<c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
    <s:url var="url_uhome" value="/user/dashboard"/>
    <s:url var="url_cform" value="/user/contact_form"/>
    <s:url var="url_clist" value="/user/clist"/>
    <a class="menu_item" href="${url_uhome}">Home</a> | <a class="menu_item" href="${url_cform}">Add Contact</a> | <a class="menu_item" href="${url_clist}">Contact List</a> | <a  class="menu_item" href="${url_logout}">Logout</a>  
</c:if>



