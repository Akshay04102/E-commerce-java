<%-- 
    Document   : register
    Created on : 11 Jul 2025, 5:19:28 pm
    Author     : AKSHAY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
                <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
                
        <%@include file="components/navbar.jsp"%>
        <div class="row mt-"">
<div class="col-md-4 offset-md-4">
    //include basically print all the data from the message page print here
     <%@include file="components/message.jsp"%>
    <form action = "RegisterServlet" method = "post">
  <div class="form-group">
    <label for="name">User name</label>
    <input name = "name" type="text" class="form-control" id="name" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="email"> user Email</label>
    <input name = "email" type="email" class="form-control" id="email" aria-describedby="emailHelp">
  </div>
        
     <div class="form-group">
    <label for="pass"> user password</label>
    <input name = " password" type="pass" class="form-control" id="pass" aria-describedby="emailHelp">
    
    
          <div class="form-group">
    <label for=""> user phone no</label>
    <input name ="no"  type="" class="form-control" id="" aria-describedby="emailHelp">
  </div>

            
          <div class="User address">
    <label for="pass"> user password</label>
    <input name = "address" type="pass" class="form-control" id="pass" aria-describedby="emailHelp">
  </div>
  <button type="submit" class="btn btn-primary">Register</button>
</form>
    
    
</div>
        </div>
    </body>
</html>
