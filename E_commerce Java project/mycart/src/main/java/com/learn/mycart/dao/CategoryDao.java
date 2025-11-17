
package com.learn.mycart.dao;

import com.learn.mycart.entites.Category;
import com.learn.mycart.entites.User;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    private SessionFactory factory;
    public CategoryDao(SessionFactory factory) {
   this.factory = factory;
    }
    
//save the cateogry to db
public int saveCategory(Category cat){
Session session = this.factory.openSession();

Transaction tx = session.beginTransaction();
int catId = (int)session.save(cat);
tx.commit();
session.close();
return catId;
}

// to get category for the product page
public List<Category> getCategories(){
    
    // this is hibernate
    Session s = this.factory.openSession();
    Query query = s.createQuery("from Category");
    List <Category> list = query.list();
    return list;
}


public Category getcategoryById (int cid) {
Category cat = null;
try {
Session session = this.factory.openSession();
cat = session.get(Category.class, cid);
session.close();
}
catch (Exception e){
e.printStackTrace();
}
return cat;
}
}
    
