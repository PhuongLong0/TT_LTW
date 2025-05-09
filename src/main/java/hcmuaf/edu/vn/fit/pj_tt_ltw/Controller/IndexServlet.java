package hcmuaf.edu.vn.fit.pj_tt_ltw.Controller;

import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.DAOFactory;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.IProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.DAO.ProductDAO;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Categories;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;
import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.ShoppingCart;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "Index", value = "/index")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public static void main(String[] args) {

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = "/men.jsp";

        IProductDAO productdao = DAOFactory.getInstance().getProductdao();
        request.setAttribute("productdao", productdao);

        List<Categories> categories = ((ProductDAO) productdao).getCategories();
        request.setAttribute("categories", categories);

        int totalProducts = productdao.all().size();
        int totalPages = totalProducts / 6 + (totalProducts % 6 == 0 ? 0 : 1);
        request.setAttribute("totalPages", totalPages);

        List<Products> listProducts = productdao.all().subList(0, 6);
        request.setAttribute("listProducts", listProducts);

        ShoppingCart cart= new ShoppingCart();
        request.setAttribute("cart", cart);


        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destination);
        dispatcher.forward(request, response);


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

