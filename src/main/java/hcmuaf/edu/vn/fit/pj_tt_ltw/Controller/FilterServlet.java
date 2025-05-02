package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.CategoryDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Categories;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name ="FilterServlet", value = "/FilterServlet")
public class FilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryDAO categoryDAO = new CategoryDAO();
        List<Categories> categories = categoryDAO.getCategoriesWithProductCount();
        request.setAttribute("categories", categories);

        String categoryFilter = request.getParameter("category");
        String page = request.getParameter("page");
        String admin= request.getParameter("admin");
        String destination = "filteredProducts.jsp";
        ServletContext application = getServletContext();
        ProductDAO dao = (ProductDAO) application.getAttribute("products");
        if (dao == null) {
            dao = new ProductDAO(); // Tạo mới nếu chưa có
            application.setAttribute("products", dao);
        }
        List<Products> filterProduct = dao.filter(categoryFilter);

        System.out.println("Categories: ");
        for(Categories c : categories) {
            System.out.println(c.getCategoryName() + " - " + c.getNum());
        }


        if(page!= null) {
            int pageNum= Integer.parseInt(page)-1;
            filterProduct= dao.all().subList(pageNum*6, Math.min(pageNum*6+6, dao.all().size()));
        }
        if(admin!=null) {
            destination = "adminListProduct.jsp";
        }
        request.setAttribute("filter", filterProduct);
        request.getRequestDispatcher(destination).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
