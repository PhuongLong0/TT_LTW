package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimeFilterServlet", value = "/timeFilter")
public class TimeFilterServlet extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productdao = (ProductDAO) DAOFactory.getInstance().getProductdao();

        String timeFilterParam = request.getParameter("timeFilter");
        System.out.println("timeFilterParam: " + timeFilterParam);
        int selectedYear = 0;
        if(!timeFilterParam.isEmpty()){
            selectedYear = Integer.parseInt(timeFilterParam);

            // Tổng doanh thu trong năm
            int yearIncome = productdao.totalIncomeInYear(selectedYear);
            request.setAttribute("yearIncome", yearIncome);

            // Danh sách doanh thu hàng tháng trong năm đã chọn
            List<Double> monthlyIncome = productdao.getMonthlyIncome(selectedYear);
            request.setAttribute("monthlyIncome", monthlyIncome);

            // Danh sách lợi nhuận hàng tháng trong năm đã chọn
            List<Double> monthlyRevenue = productdao.getMonthlyRevenue(selectedYear);
            request.setAttribute("monthlyRevenue", monthlyRevenue);
        }
        request.getRequestDispatcher("timeFilter.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
