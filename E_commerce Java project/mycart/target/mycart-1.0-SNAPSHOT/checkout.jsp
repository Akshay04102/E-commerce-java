
<%
 User user = (User)Session.getAttribute("current-user");
if (user == null) {
session.setAttribute("message", "You are not logged in ll Login firstTO geet acess to hceckout page");
response.sendRedirect("login.jsp");
return;
 }

%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
              <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>  
        <%@include file="components/navbar.jsp"%>
        
        
        <div class="container">
            <div class-"row>
                <div class="col-md-6">
                    <!<!-- card -->
                    <div class = "card">
                        <div class="card-body">
                                <h3 class="text-center mb-5">Your selected items</h3>
                                                <div class="cart-body">
                        </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <!<!-- from detials -->
                     <div class = "card">
                        <div class="card-body">
                                <h3 class="text-center mb-5">Your detials for order items</h3>
                 
                                
                                <!<!-- form -->
                                <form action ="#!">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Email address</label>
                          <input value = "<%user.getUserEmail();%>"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                                    
                         <div class="form-group">
                          <label for="name">Your name</label>
                          <input value = "<%user.getUserName();%>"type="text" class="form-control" id="name" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                          <label for="">Your contact</label>
                          <input value = "<%user.getUserPhone();%>"type="text" class="form-control" id="contact" aria-describedby="emailHelp">
                        </div>
                                    
                                    
                                      <div class="form-group">
    <label for="exampleFormControlTextarea1">Your shipping address</label>
    <textarea value = "<%user.getUserAdress();%>"class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
                                    
                                    <button type="submit" class="btn btn-primary">Order now </button>
                                    <button type="submit" class="btn btn-primary">Continue shopping</button>
                                </form>        
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <%@include file="components/common.jsp"%>
    </body>
</html>
