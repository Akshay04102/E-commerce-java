/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entites.Category;
import com.learn.mycart.entites.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author AKSHAY
 */
@MultipartConfig  // it means this file can accept image or auido files in productOperationServlet.java
@WebServlet(name = "productOpertaionServlet", urlPatterns = {"/productOpertaionServlet"})
public class productOpertaionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter ("operation");
            if(op.trim().equals("addCategory")) {
                // add.-cateqory
                String title = request.getParameter ("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryTitles(title);
                category.setCategoryDescription(description);
                
                
                CategoryDao categoryDao = new CategoryDao (FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory (category);
//                out.println("Category Saved");
              HttpSession httpSession = request.getSession();
              httpSession.setAttribute("message", "Category added successfully:" + catId);
              response.sendRedirect ("admin.jsp");
              return;
                
                
                
            }else if(op.trim().equals("addProduct")){
                // addproduct
                
                String pName = request.getParameter ("pName");
                String pDesc = request.getParameter ("pDesc");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter ("pQuantity"));
                int catId=Integer.parseInt (request.getParameter("catId"));
                Part part=request.getPart("pPic");  // for the imge
                
                
                
                Product p = new Product();
                p.setpName (pName) ;
                p.setpDěsc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount (pDiscount);
                p.setpQuantity(pQuantity);
                p.setPphoto(part.getSubmittedFileName());
                
                //get category by id
                CategoryDao cdoa=new CategoryDao(FactoryProvider.getFactory());
                Category category=cdoa.getCategoryId(catId);
                p.setCategory(category);
                
                //save product 
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct (p);
                
                // PIC Upload 
                
                String path = request.getRealPath("img") + File.separator + "products"+ File.separator + part.getSubmittedFileName();
                // uploading code

            FileOutputStream fos = new FileOutputStream(path);
            InputStream is = part.getInputStream();
 // reading dat
byte[] data = new byte[is.available()];
is.read(data);
// writing the data
fos.write(data);
fos.close();
                
                
                
                
                
                
                
                
                
//                out.println("Product save sug");

   HttpSession httpSession = request.getSession();
              httpSession.setAttribute("message", "product  added successfully:");
              response.sendRedirect ("admin.jsp");
              return;
                
                
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
