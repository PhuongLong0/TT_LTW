package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

public class DAOFactory {
    private static DAOFactory instance = new DAOFactory();

    public static DAOFactory getInstance() {
        return instance;
    }

    public UserDao getUserDao() {
        return new UserImp();
    }

    public IProductDAO getProductdao() {
        return new ProductDAO();

    }
    public OrderDAO getDonHangDao() {
        return new OrderImp();
    }
}
