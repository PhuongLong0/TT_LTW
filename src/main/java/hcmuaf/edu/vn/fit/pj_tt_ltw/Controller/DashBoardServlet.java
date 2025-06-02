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

        //Lấy tổng doanh thu không tính chi phí
        int totalIncome = productdao.getTotalIncome();
        request.setAttribute("totalIncome", totalIncome);

        // Tổng đơn hàng lọc theo thời gian
        int newOrders = productdao.getTotalNewOrder();
        System.out.println("New Orders: " + newOrders); // kiểm tra log
        request.setAttribute("totalNewOrders", newOrders);

        // Tổng chi phí
        int totalExpense = productdao.getTotalExpense();
        request.setAttribute("totalExpense", totalExpense);

        // Khoảng thời gian
        List<Integer> yearly = productdao.getTimePeriod();
        for(int year : yearly){
            System.out.println("year: " + year);
        }
        request.setAttribute("yearly", yearly);

        // Lấy năm đã chọn để lọc
        String timeFilterParam = request.getParameter("timeFilter");
        int selectedYear = 0;
        if(!yearly.isEmpty()){
            // Nếu chưa chọn năm để mặc định là năm mới nhất
            selectedYear = yearly.get(yearly.size()-1);
        }
        // Nếu năm lấy được khác null
        if(timeFilterParam != null && !timeFilterParam.isEmpty()) {
            selectedYear = Integer.parseInt(timeFilterParam);
        }
        request.setAttribute("selectedYear", selectedYear);

        // Lấy doanh thu theo năm đã chọn
        System.out.println("selected year: " + selectedYear);
        int yearIncome = productdao.totalIncomeInYear(selectedYear);
        System.out.println("yearIncome: " + yearIncome);
        request.setAttribute("yearIncome", yearIncome);

        // Danh sách doanh thu hàng tháng trong năm đã chọn
        List<Double> monthlyIncome = productdao.getMonthlyIncome(selectedYear);
        request.setAttribute("monthlyIncome", monthlyIncome);

        // Danh sách lợi nhuận hàng tháng theo năm đã chọn
        List<Double> monthlyRevenue = productdao.getMonthlyRevenue(selectedYear);
        request.setAttribute("monthlyRevenue", monthlyRevenue);
        
        request.getRequestDispatcher("dashBoard.jsp").forward(request, response);


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
