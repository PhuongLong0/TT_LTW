package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public enum StatusOrder {
    CONFIRMATIONING("confirmationing"),
    DELIVERING("delivering"),
    PAID("paid");

    private final String value;
    StatusOrder(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    //chuyển đổi chuỗi sang enum
    public static StatusOrder fromString(String value) {
        for (StatusOrder status : StatusOrder.values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        throw new IllegalArgumentException();
    }
}
