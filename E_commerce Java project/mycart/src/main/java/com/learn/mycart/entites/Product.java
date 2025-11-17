package com.learn.mycart.entites;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
public class Product {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int pId;
private String pName;
private String pDěsc;
private String pphoto;
private int pPrice;
private int pDiscount;
private int pQuantity;
@ManyToOne
private Category category;

    public Product() {
    }

    public Product(String pName, String pDěsc, String pphoto, int pPrice, int pDiscount, int pQuantity ,Category category ) {
        this.pName = pName;
        this.pDěsc = pDěsc;
        this.pphoto = pphoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDěsc() {
        return pDěsc;
    }

    public void setpDěsc(String pDěsc) {
        this.pDěsc = pDěsc;
    }

    public String getPphoto() {
        return pphoto;
    }

    public void setPphoto(String pphoto) {
        this.pphoto = pphoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pD\u011bsc=" + pDěsc + ", pphoto=" + pphoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }

    //calculate price after discount
    public int getPriceAfterApplyingDiscount(){
    int d= (int) ((this.getpDiscount()/100.0)* this.getpPrice());
    return this.getpPrice() -d;
    }
}
