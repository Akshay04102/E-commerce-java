
package com.learn.mycart.entites;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Category {
    
@Id
@GeneratedValue(strategy =GenerationType.IDENTITY)
private int categoryId;
private String categoryTitles;
private String categoryDescription;
@OneToMany(mappedBy = "category")
private List<Product> products = new ArrayList<>();

    public Category() {
    }
    

    public Category(int categoryId, String categoryTitles, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitles = categoryTitles;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTitles, String categoryDescription , List<Product> products ) {
        this.categoryTitles = categoryTitles;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitles() {
        return categoryTitles;
    }

    public void setCategoryTitles(String categoryTitles) {
        this.categoryTitles = categoryTitles;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitles=" + categoryTitles + ", categoryDescription=" + categoryDescription + '}';
    }


    
}
