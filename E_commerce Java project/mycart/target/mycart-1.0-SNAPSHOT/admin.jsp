
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entites.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entites.User"%>
<%@page import= "com.learn.mycart.entities.User"%>
<%
 User user = (User)Session.getAttribute("current-user");
if (user == null) {
session.setAttribute("message", "You are not logged in ll Login first");
response.sendRedirect("login.jsp");
return;
    }
else{

if (user.getUserType().equals("normal")) {
session.setAttribute("message", "You are not admin ! Do not access this page");
response.sendRedirect("login.jsp");
return;
    }
    }
    
       <!-- getting data from category dao to get all cateogries -->
              <% 
              CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
               list = cdao.getCategories(); 

// getting count
Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());

              %>
              
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
         <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
          <%@include file="components/navbar.jsp"%>
          <div class ="conatiner-admin">
              
              <div class ="conatiner-fluid mt-3">
                  <%@include file="components/message.jsp"%>
              </div>
              <!<!-- first row  -->
              <div class="row">
                  <div class = "col-md-4">
                      <div class="card">
                             <div class="card-body  text-center">
                                 <div class="container">
<img src="img/seo-and-web.png" alt="user_icon">
</div>
<h1><%=m.get("userCount")%></h1
                                 <h1>User</h1>
                      </div>
                      </div>
                  </div>
                  <div class = "col-md-4">
                        <div class="card">
                             <div class="card-body text-center">
                                                                  <div class="container">
<img src="img/seo-and-web.png" alt="user_icon">
</div>
<h1><%%>list.size()</h1
                                 <h1>Category</h1>
                      </div>
                      </div>
                  </div>
                  <div class = "col-md-4">
                         <div class="card">
                             <div class="card-body  text-center">
                                                                  <div class="container">
<img src="img/seo-and-web.png" alt="user_icon">
</div>
<h1><%=m.get("productCount")%></h1
                                 <h1>Product</h1>
                      </div>
                      </div>
                  </div>
                  
                  
                  
                  
              </div>
              
               <!<!-- second row  -->
               
               <div class="row mt-3">
                  <div class = "col-md-4">
                                            <div class="card" data-toggle = "modal" data-target = "add-product-modal">
                             <div class="card-body  text-center">
                                 <div class="container">
                                    <img src="img/seo-and-web.png" alt="user_icon">
                                </div>
                                 <p class="mt-2">Click here to add product</p>
                                 <h1>Add product </h1>
                      </div>
                      </div>
                  </div>
                    <div class = "col-md-4">
                                              <div class="card" data-toggle="modal" data-target="#add-category-modal">
                             <div class="card-body  text-center">
                                 <div class="container">
                                    <img src="img/seo-and-web.png" alt="user_icon">
                                </div>
                                   <p class="mt-2">Click here to add category</p>
                                 <h1>Add category</h1>
                      </div>
                      </div>
                  </div>
                   
               </div>  
          </div>
          
          <!-- add category modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill cateogry details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action = "productOpertaionServlet" method="post">
              <input type="hidden" name="operation" value="addCategory"/>
              <div class="form-group">
                  <input type = "text" class="form-control" name = "catTitle" placeholder="enter cateogory" required/> 
              </div>
              
               <div class="form-group">
                  <textarea type = "text" class="form-control" name = "catDescription" placeholder="enter desc" required/> 
              </div>
              
              <div class="container">
                  <button class="btn-btn-out1">Add category</button>   
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
     
          </form>
      </div>

      </div>
    </div>
  </div>
</div>
          
          <!<!-- end category modal -->
          
          
           <!-- add product modal -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Products details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action = "productOpertaionServlet" method="post" enctype="multipsrt/form-data">  <!<!-- thiis - enctype="multipsrt/form-data" is include because the form product modal contsin image or audio files -->
              
              <!<!-- it means when click on add product or catgepry button it will sleect either addCatepoty or addproduct and the value will go to productOperationServlet page -->
              <input type="hidden" name="operation" value="addProduct"/>

              <div class="form-group">
                   <input type = "text" class="form-control" name = "pName" placeholder="enter title of product" required/> 
              </div>
              
               <div class="form-group">
                  <textarea type = "text" class="form-control" name = "pDescription" placeholder="enter product desc" required/> 
              </div>
              
                 <div class="form-group">
                  <input type = "number" class="form-control" name = "pPrice" placeholder="enter price of product" required/> 
              </div>
              
                 <div class="form-group">
                  <input type = "number" class="form-control" name = "pDiscount" placeholder="enter discount of product" required/> 
              </div>
              
                 <div class="form-group">
                  <input type = "number" class="form-control" name = "pQuantity" placeholder="enter quantity of product" required/> 
              </div>
              
              
           
              
              
              <div class="form-group">
                  <select name = "catId" class="form-control" id = "">
                     <%  
                     for(Category c:list){
                     %>
                      <option value = "<%= c.getCategoryId() %>"><%=c.getCategoryTitles()%></option>
                      
                      <%  }
                     %>
                  </select>
                  
                  
              </div>
              
               <div class="form-group">
                   <label for="pPic">Select picture of product</label>
                   <br>
                  <input type = "file" id="pPic" name = "pPic"  required/> 
              </div>
              
              <div class="container">
                  <button class="btn-btn-out1">Add product </button>   
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
     
          </form>
      </div>

      </div>
    </div>
  </div>
</div>
          
          <!<!-- end product modal -->
       
                <%@include file="components/common.jsp"%>
          
    </body>
</html>
