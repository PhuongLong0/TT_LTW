package hcmuaf.edu.vn.fit.pj_tt_ltw.Model;

public enum PaymentMethod {
    TRANFER("tranfer"),
    CASH("cash");

    private final String value;
    PaymentMethod(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    //chuyển đổi chuỗi sang enum
    public static PaymentMethod fromString(String value) {
        for (PaymentMethod payment : PaymentMethod.values()) {
            if (payment.getValue().equals(value)) {
                return payment;
            }
        }
        throw new IllegalArgumentException();
    }
}
