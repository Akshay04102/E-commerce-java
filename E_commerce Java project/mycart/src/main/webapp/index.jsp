<%-- 
    Document   : index
    Created on : 10 Jul 2025, 5:58:53 pm
    Author     : AKSHAY
--%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entites.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entites.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
       <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>  
        <%@include file="components/navbar.jsp"%>
         <div class="row">
             <%
                 String cat = request.getParameter("category");
//                out.println(cat);
                 ProductDao dao = new ProductDao (FactoryProvider.getFactory());
                 List<Product> list = null;
                if (cat ==null || cat.trim().equals ("all")){
                    list = dao.getAllproducts();
                 }else{
                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
                 }
              
           CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
              List<Category> clist = cdao.getCategories();
             %>
            
<!--show categories-->
<div class="col-md-2">
<ul class="list-group">
   <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
   All product category
  </a>

</ul>

<%
for (Category c : clist) {

%>
  <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitles()%></a>
<%
    }
%>

</div>
<!--show products-->
<div class=col-md-8>
  <div class="col-md-8">
      <!-- row -->
        <div class="row mt-4">
<!--col:12-->
            <div class="col-md-12">
        <div class="card-columns">
            
            
            <%
        for (Product p : list) {

            %>
            
            <!<!-- product card -->
 <div class="card" >
      <img src="img/products/<%=p.getPphoto()%>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%=p.getpName()%></h5>
    <p class="card-text"><%=Helper.getl0Words(p.getpDěsc())%></p>
  </div>
    
    <div class="card-footer">
<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)>Add to Cart</button>
<button class="btn btn-outline-primary "> &#8377; <%=p.getPriceAfterApplyingDiscount() %>/- <span><%=p.getpPrice()%><%=p.getpDiscount()%>%off</span> </button>
</div>  
    
</div>
            
         
            
<%
    }

if (list.size() == 0) {
    out.println("<h3No item in this category<h3"); 
}
%>
            
            
            
            
            
            
            
            
            
            
        </div>

</div>
         </div>
   <%@include file="components/common.jsp"%>
    </body>
</html>
