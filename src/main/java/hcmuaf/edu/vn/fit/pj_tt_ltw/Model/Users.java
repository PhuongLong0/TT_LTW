package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

import java.sql.Timestamp;

public class Users {
    private int userId;
    private String userName ;
    private String firstname;
    private String lastname ;
    private String passwordUser ;
    private int role;
    private String email;
    private Timestamp created_at ;
    private Timestamp updated_at ;

    public Users(int userId, String userName,String firstname, String lastname, String password, String role, String email) {
    this.userId = userId;
    this.userName = userName;
    this.firstname = firstname;
    this.lastname = lastname;
    this.passwordUser = password;
    this.role = Integer.parseInt(role);
    this.email = email;
    this.created_at=new Timestamp(System.currentTimeMillis());
    this.updated_at=new Timestamp(System.currentTimeMillis());

    }

    //create account
    public Users(String name, String pass, String role, String s) {
        this.userName = name;
        this.passwordUser = pass;
        this.role = Integer.parseInt(role);
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
        public int getRole() {
            return this.role;
        }

        public void setRole(int role) {
            this.role = role;
        }

        public String getFirstname() {
            return this.firstname;
        }

        public void setFirstname(String firstname) {
            this.firstname = firstname;
        }

        public String getLastname() {
            return this.lastname;
        }

        public void setLastname(String lastname) {
            this.lastname = lastname;
        }

        public String getEmail() {
            return this.email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPassword() {
            return this.passwordUser;
        }

        public void setPassword(String password) {
            this.passwordUser = password;
        }
        public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
        }
        public Timestamp getCreated_at() {
        return this.created_at;
        }
        public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
        }
        public Timestamp getUpdated_at() {
        return this.updated_at;
        }
}
