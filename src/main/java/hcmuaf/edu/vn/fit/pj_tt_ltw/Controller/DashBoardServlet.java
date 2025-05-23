package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;


import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.IProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashBoardServlet", value = "/dashBoard")
public class DashBoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productdao = (ProductDAO) DAOFactory.getInstance().getProductdao();

        int totalIncome = productdao.getTotalIncome();
        request.setAttribute("totalIncome", totalIncome);

        int newOrders = productdao.getTotalNewOrder();
        System.out.println("New Orders: " + newOrders); // kiểm tra log
        request.setAttribute("totalNewOrders", newOrders);

        int totalExpense = productdao.getTotalExpense();
        request.setAttribute("totalExpense", totalExpense);

        request.getRequestDispatcher("dashBoard.jsp").forward(request, response);


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
