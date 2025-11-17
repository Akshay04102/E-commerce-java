
package com.learn.mycart.dao;

import com.learn.mycart.entites.Product;
import com.learn.mycart.entites.User;
import static com.sun.tools.attach.VirtualMachine.list;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class ProductDao {
    
     private SessionFactory factory;
    public ProductDaoo(SessionFactory factory) {
    this.factory = factory;
    }
    
    public boolean saveProduct(Product product){
        boolean f =false;
try{
Session session = this.factory.openSession();
Transaction tx = session.beginTransaction();
session.save(product);
tx.commit();
session.close();
f = true;
}catch(Exception e){
    e.printStackTrace();
    f = false;
} 
return f;
    }
    
    
public List<Product> getAllproducts(){
Session s = this.factory.openSession();
Query query = s.createQuery (" from Product");
List<Product> list = query.list();
return list;
    
}

//get all product by category
public List<Product> getAllProductsById(int cid){
Session s = this.factory.openSession();
Query query = s.createQuery (" from Productas p where p.categoryId =: id");
query.setParameter("id", cid);
List<Product> list = query.list();    
return list;
    
}
}
