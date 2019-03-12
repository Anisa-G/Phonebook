<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration - Phonebook</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <s:url var="url_css" value="/static/css/style.css"/>
        <link href="${url_css}" rel="stylesheet" type="text/css"/>  
        <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
        <script src="${url_jqlib}"></script>
        <script>
            $(document).ready(function () {
                $("#id_check_avail").click(function () {
                    $.ajax({
                        url: 'check_avail',
                        data: {username: $("#id_username").val()},
                        success: function (data) {
                            $("#id_res_div").html(data);
                        }
                    });
                });
            });
        </script>
    </head>
    <s:url var="url_bg" value="/static/images/bcground.jpg"/>
    <body background="${url_bg}" class="bcground">
        <table class="nav_bar">
            <tr class="menu">
                <td height="25px">
                    <%-- Menu --%>
                    <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
        </table>
        <h3 class="reg_title">User Registration</h3>
        <table class="table_2 border-0">
            <tr>
                <td height="350px" valign="top">
                    <c:if test="${err!=null}">
                        <p class="error">${err}</p>
                    </c:if>                  
                    <s:url var="url_reg"  value="/register"/>
                    <f:form action="${url_reg}" modelAttribute="command">

                        
                        <%--NAME--%>
                        <div class="form-group">
                            <label for="nameInput" class="label_1 table_header">Name</label>
                            <f:input type="name" class="form-control test" id="nameInput" aria-describedby="emailHelp" placeholder="Enter name"  path="user.name"/>
                        </div>

                        
                        <%--Phone--%>
                        <div class="form-group">
                            <label for="phoneInput" class="label_1">Phone number</label>
                            <f:input type="phonenumber" pattern="^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$" class="form-control test" id="phoneInput" placeholder="Enter phone number" path="user.phone"/>
                        </div>


                        <%--Email--%>
                        <div class="form-group">
                            <label for="emailInput" class="label_1">Email address</label>
                            <f:input type="email" pattern="^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$" class="form-control test" id="emailInput" aria-describedby="emailHelp" placeholder="Enter email" path="user.email"/>
                            <small id="emailHelp" class="form-text text-muted label_1">We'll never share your email with anyone else.</small>
                        </div>

                        <%--Address--%>
                        <div class="form-group">
                            <label for="addressInput" class="label_1">Address</label>
                            <f:input type="address" class="form-control test" id="addressInput" placeholder="Enter address" path="user.address"/>
                        </div>


                        <%--Username--%>
                        <div class="form-group">
                            <label for="usernameInput" class="label_1">Username</label>
                            <f:input type="username" class="form-control test" id="id_username" placeholder="Enter username" path="user.loginName"/>    <%--     loginName     --%> 
                        </div>
                        <%--Button--%>
                        <button class="btn btn-secondary button_1" type="button" id="id_check_avail">Check Availability</button>
                        <div id="id_res_div" class="error label_2"></div>


                        <%--Password--%>
                        <div class="form-group">
                            <label for="passwordInput" class="label_1">Password</label>
                            <f:input type="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9].{8,12}$" class="form-control test" id="passwordInput" placeholder="Password" path="user.password"/>
                        </div>
                        
                        <button class="btn btn-primary button_2">Submit</button> <br/>
                    </f:form>
        </table>
    </body>
</html>
