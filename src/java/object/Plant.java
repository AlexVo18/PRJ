/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Plant implements Serializable{
    private int ID;
    private String name;
    private int price;
    private String imgpath;
    private String description;
    private int status;
    private int cateID;
    private String cateName;

    public Plant() {
    }

    public Plant(int ID, String name, int price, String imgpath, String description, int status, int cateID, String cateName) {
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
        this.cateID = cateID;
        this.cateName = cateName;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    
}
