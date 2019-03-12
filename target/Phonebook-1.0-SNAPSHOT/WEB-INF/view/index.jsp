<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Phonebook</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
    </head>
    <s:url var="url_bg" value="/static/images/phonebookkkk.png"/>
    <body background="${url_bg}" id="index_bcg">
        <table class="nav_bar"  >
            <tr class="menu">
                <td height="25px">
                    <%-- Menu --%>
                    <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
            <tr>
        </table>
        <h3 class="log_title">User Login</h3>
        <table class="table_3 border-0">
            <td height="350px" valign="top">
                <c:if test="${err!=null}">
                    <p class="error">${err}</p>
                </c:if>
                <c:if test="${param.act eq 'lo'}">
                    <p class="success">Logout Successfully! Thanks for using our phonebook</p>
                </c:if>
                <c:if test="${param.act eq 'reg'}">
                    <p class="success">User Registered Successfully. Ready to login!</p>
                </c:if>  
                <s:url var="url_login"  value="/login"/>
                <f:form action="${url_login}" modelAttribute="command">
                    <div class="form-group">
                        <label for="usernameInput" class="label_1 table_header_2">Username</label>
                        <f:input type="username" class="form-control test" id="id_username" placeholder="Enter username" path="loginName"/>
                    </div>
                    <div class="form-group">
                        <label for="passwordInput" class="label_1">Password</label>
                        <f:input type="password" class="form-control test" id="password" placeholder="Enter password" path="password"/>
                    </div>
                    <button class="btn btn-primary login_button">Login</button> <br/>                            
            </table>
        </f:form>
    </td>
</tr>
</table>
</body>
</html>
