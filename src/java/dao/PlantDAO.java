/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import lib.DBUtils;
import object.Category;
import object.Plant;

/**
 *
 * @author Admin
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        //Tim kiem plant dua tren keyword
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "SELECT p.PID, p.PName, p.price, p.imgPath, "
                        + "p.description, p.status, p.CateID, c.CateName \n"
                        + "FROM dbo.Plants p\n"
                        + "JOIN dbo.Categories c ON p.CateID = c.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "WHERE p.PName LIKE ? AND p.status=1";
                } else {
                    sql = sql + "WHERE c.CateName LIKE ? AND p.status=1";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        String Description = rs.getString("description");
                        int Status = rs.getInt("status");
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Plant plant = new Plant(PlantID, PlantName, Price,
                                ImgPath, Description, Status, CateID, CateName);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static Plant getPlant(String ID) {
        //Lay Plant
        Plant plant = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT p.PID, p.PName, p.price, p.imgPath, "
                        + "p.description, p.status, p.CateID, c.CateName \n"
                        + "FROM dbo.Plants p\n"
                        + "JOIN dbo.Categories c ON p.CateID = c.CateID\n"
                        + "WHERE p.status = 1 AND p.PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        String Description = rs.getString("description");
                        int Status = rs.getInt("status");
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        plant = new Plant(PlantID, PlantName, Price,
                                ImgPath, Description, Status, CateID, CateName);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return plant;
    }

    public static ArrayList<Plant> getPlants() {
        //Lay danh sach plant cho admin
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT p.PID, p.PName, p.price, p.imgPath, "
                        + "p.description, p.status, p.CateID, c.CateName \n"
                        + "FROM dbo.Plants p\n"
                        + "JOIN dbo.Categories c ON p.CateID = c.CateID\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        String Description = rs.getString("description");
                        int Status = rs.getInt("status");
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Plant plant = new Plant(PlantID, PlantName, Price,
                                ImgPath, Description, Status, CateID, CateName);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Category> getCategories() {
        // Lay cate
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT CateID, CateName \n"
                        + "FROM Categories";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Category category = new Category(CateID, CateName);
                        list.add(category);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Plant> searchPlant(String keyword) {
        //Tim kiem plant dua tren keyword
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT p.PID, p.PName, p.price, p.imgPath, "
                        + "p.description, p.status, p.CateID, c.CateName \n"
                        + "FROM dbo.Plants p\n"
                        + "JOIN dbo.Categories c ON p.CateID = c.CateID\n"
                        + "WHERE p.PName LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        String Description = rs.getString("description");
                        int Status = rs.getInt("status");
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        Plant plant = new Plant(PlantID, PlantName, Price,
                                ImgPath, Description, Status, CateID, CateName);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static void updatePlantStatus(int ID, int status) {
        //Tim kiem plant dua tren keyword
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Plants \n"
                        + "SET status = ? \n"
                        + "WHERE PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, ID);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static int addCategory(String name) {
        //Them cate
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Categories (CateName) VALUES\n"
                        + "(?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
    
    public static int addPlant(String name, int price, String imgPath, 
            String description, int status, int cateID) {
        //Them plant moi
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Plants (PName,price,imgPath,description,status,CateID) VALUES\n"
                        + "(?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateID);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
    
    public static Plant getUpdatePlant(int ID) {
        //Lay plant de update
        Plant plant = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT p.PID, p.PName, p.price, p.imgPath, "
                        + "p.description, p.status, p.CateID, c.CateName \n"
                        + "FROM dbo.Plants p\n"
                        + "JOIN dbo.Categories c ON p.CateID = c.CateID\n"
                        + "WHERE p.PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        String Description = rs.getString("description");
                        int Status = rs.getInt("status");
                        int CateID = rs.getInt("CateID");
                        String CateName = rs.getString("CateName");
                        plant = new Plant(PlantID, PlantName, Price,
                                ImgPath, Description, Status, CateID, CateName);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return plant;
    }
    public static int updatePlant(int ID, String name, int price, String imgPath, 
            String description, int status, int cateID) {
        //Update thong tin cho plant
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Plants \n"
                        + "SET PName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ?\n"
                        + "WHERE PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateID);
                pst.setInt(7, ID);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
