package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Products;

import java.util.List;

public class DAOFactory {
    private static DAOFactory instance = new DAOFactory();

    public static DAOFactory getInstance() {
        return instance;
    }

    public UserDao getUserDao() {
        return new UserImp();
    }

    public IProductDAO getProductdao() {
        return new IProductDAO() {
            @Override
            public List<Products> all() {
                return List.of();
            }

            @Override
            public int insert(Products product) {
                return 0;
            }

            @Override
            public int update(Products product) {
                return 0;
            }

            @Override
            public int delete(Products product) {
                return 0;
            }

            @Override
            public Products findById(String id) {
                return null;
            }

            @Override
            public int count(String txtSearch) {
                return 0;
            }

            @Override
            public List<Products> searchResult(String txtSearch) {
                return List.of();
            }
        };
    }
    public OrderDAO getDonHangDao() {
        return new OrderImp();
    }
}
