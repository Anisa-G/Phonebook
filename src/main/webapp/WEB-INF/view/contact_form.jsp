<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Form - Phonebook</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <s:url var="url_css" value="/static/css/contact_form.css"/>
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
    <body class="bcground">

        <table class="nav_bar">
            <tr class="menu">
                <td height="25px">
                    <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
            <tr>
        </table>
        <table class="tbl">
            <tr>
                <td>
                    <h3 class="reg_title">Contact Form</h3>
                    <c:if test="${err!=null}">
                        <p class="error">${err}</p>

                    </c:if>                  
                    <s:url var="url_csave"  value="/user/save_contact"/>
                    <f:form action="${url_csave}" modelAttribute="command">
                        <%--NAME--%>
                        <div class="form-group">
                            <label  for="nameInput" class="label_1 table_header">Name</label>
                            <f:input type="name" class="form-control test" id="nameInput" aria-describedby="emailHelp" placeholder="Enter name"  path="name"/>
                        </div>
                        <%--Phone--%>
                        <div class="form-group">
                            <label for="phoneInput" class="label_1">Phone number</label>
                            <f:input type="phonenumber" class="form-control test" id="phoneInput" placeholder="Enter phone number" path="phone"/>
                        </div>
                        <%--Email--%>
                        <div class="form-group">
                            <label for="emailInput" class="label_1">Email address</label>
                            <f:input type="email" class="form-control test" id="emailInput" aria-describedby="emailHelp" placeholder="Enter email" path="email"/>
                        </div>
                        <%--Address--%>
                        <div class="form-group">
                            <label for="addressInput" class="label_1">Address</label>
                            <f:input type="address" class="form-control test" id="addressInput" placeholder="Enter address" path="address"/>
                        </div>
                        <%--Address--%>
                        <div class="form-group">
                            <label for="addressInput" class="label_1">Note</label>
                            <f:input type="address" class="form-control test" id="addressInput" placeholder="Enter note" path="note"/>
                        </div>
                        <button class="btn btn-primary button_2">Save</button>                                
                    </f:form>
                </td>
            </tr>
        </table>
    </body>
</html>

