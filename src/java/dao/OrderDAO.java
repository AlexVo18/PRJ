/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import lib.DBUtils;
import object.Order;
import object.OrderDetail;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(int ID, int status) {
        //Lay orders dua vao status de hien thi cho user
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                if (status == 0) {
                    String sql = "SELECT OrderID, OrdDate, shipdate, status, AccID\n"
                            + "FROM Orders\n"
                            + "WHERE AccID = ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setInt(1, ID);
                    ResultSet rs = pst.executeQuery();
                    if (rs != null) {
                        while (rs.next()) {
                            int OrderID = rs.getInt("OrderID");
                            String OrderDate = rs.getString("OrdDate");
                            String ShipDate = rs.getString("shipdate");
                            int Status = rs.getInt("status");
                            int AccID = rs.getInt("AccID");
                            Order order = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                            list.add(order);
                        }
                    }
                } else {
                    String sql = "SELECT OrderID, OrdDate, shipdate, status, AccID\n"
                            + "FROM Orders\n"
                            + "WHERE AccID = ? AND status = ?";
                    PreparedStatement pst = cn.prepareStatement(sql);
                    pst.setInt(1, ID);
                    pst.setInt(2, status);
                    ResultSet rs = pst.executeQuery();
                    if (rs != null) {
                        while (rs.next()) {
                            int OrderID = rs.getInt("OrderID");
                            String OrderDate = rs.getString("OrdDate");
                            String ShipDate = rs.getString("shipdate");
                            int Status = rs.getInt("status");
                            int AccID = rs.getInt("AccID");
                            Order order = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                            list.add(order);
                        }
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

    public static ArrayList<OrderDetail> getOrderDetail(int ID) {
        // Lay thong tin cua don hang trong phan view detail order
        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT o.DetailId, o.OrderID, o.PID, p.PName, p.price, p.imgPath, o.quantity\n"
                        + "FROM OrderDetails o\n"
                        + "JOIN Plants p ON o.PID = p.PID\n"
                        + "WHERE OrderID = ? \n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int DetailID = rs.getInt("DetailId");
                        int OrderID = rs.getInt("OrderID");
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int Price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int Quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(DetailID,
                                OrderID, PlantID, PlantName, Price, imgPath, Quantity);
                        list.add(orderdetail);
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

    public static int insertOrder(int ID, HashMap<String, Integer> cart) throws Exception {
        //Thanh toan don hang
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);// Han che commit som de co the dong nhat voi database tot hon
                String sql = "INSERT Orders(OrdDate,status,AccID) VALUES(?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                Date date = new Date(System.currentTimeMillis());
                pst.setDate(1, date);
                pst.setInt(2, 1); //1<-> pendding
                pst.setInt(3, ID);
                result = pst.executeUpdate();
                if (result > 0) { // Kiem tra xem Order da dc update chua
                    sql = "SELECT TOP 1 OrderID\n"
                            + "FROM Orders\n"
                            + "ORDER BY OrderID desc";
                    pst = cn.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();
                    if (rs != null && rs.next()) {
                        int OrderID = rs.getInt("OrderID");
                        if (cart != null && cart.size() > 0) {
                            for (String plantID : cart.keySet()) {
                                int quantity = cart.get(plantID);
                                sql = "INSERT OrderDetails(OrderID,PID,quantity) VALUES(?,?,?)";
                                pst = cn.prepareStatement(sql);
                                pst.setInt(1, OrderID);
                                pst.setString(2, plantID);
                                pst.setInt(3, quantity);
                                result = pst.executeUpdate();
                            }
                        }
                    }
                }
                cn.commit();
                cn.setAutoCommit(true);
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

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

    public static int cancelOrder(int orderID, int status) {
        // Huy don hang
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Orders \n "
                        + "SET status = ? \n"
                        + "WHERE orderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
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

//    public static ArrayList<OrderDetail> orderOrderAgain(int ID){
//        //Dat don hang lai
//        
//    }
    public static ArrayList<Order> getOrders() {
        // Lay het don hang cho admin
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, status, accID\n"
                        + "FROM Orders";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int OrderID = rs.getInt("OrderID");
                        String OrderDate = rs.getString("OrdDate");
                        String ShipDate = rs.getString("shipdate");
                        int Status = rs.getInt("status");
                        int AccID = rs.getInt("accID");
                        Order order = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(order);
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

    public static ArrayList<Order> searchOrder(String keyword) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT o.OrderID, o.OrdDate, o.shipdate, o.status, o.accID\n"
                        + "FROM Orders o \n"
                        + "JOIN Accounts a ON o.accID = a.accID\n"
                        + "WHERE a.email LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int OrderID = rs.getInt("OrderID");
                        String OrderDate = rs.getString("OrdDate");
                        String ShipDate = rs.getString("shipdate");
                        int Status = rs.getInt("status");
                        int AccID = rs.getInt("accID");
                        Order order = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(order);
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

    public static int updateOrder(int orderID, int status) {
        // Doi status trong admin
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Orders \n "
                        + "SET status = ? \n"
                        + "WHERE orderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
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

    public static Order getOrders(int ID) {
        // Lay 1 don hang cho admin
        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, status, accID\n"
                        + "FROM Orders \n"
                        + "WHERE OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int OrderID = rs.getInt("OrderID");
                        String OrderDate = rs.getString("OrdDate");
                        String ShipDate = rs.getString("shipdate");
                        int Status = rs.getInt("status");
                        int AccID = rs.getInt("accID");
                        order = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
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
        return order;
    }

    public static int updateShipDate(int orderID, String shipDate) {
        // Doi status trong admin
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Orders \n "
                        + "SET shipdate = ? \n"
                        + "WHERE orderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, shipDate);
                pst.setInt(2, orderID);
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
