
package hcmuaf.edu.vn.fit.pj_tt_ltw.DAO;


import hcmuaf.edu.vn.fit.pj_tt_ltw.Model.Users;

import java.util.List;

public interface UserDao {
        List<Users> all();

        int insert(Users var1);

        int update(Users var1);

        int delete(Users var1);

        boolean checkAdmin(String var1, String var2);

        Users checkPass(String var1, String var2);

}
