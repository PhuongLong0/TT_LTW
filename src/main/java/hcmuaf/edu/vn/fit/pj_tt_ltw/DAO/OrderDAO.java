package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;

import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Orders;

import java.util.List;

public interface OrderDAO {
    public List<Orders> all();

    public int insert(Orders order);
    public int update(Orders order);
    public int delete(Orders order);

    public void duyet(int id);

}
