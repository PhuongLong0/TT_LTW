package database;

public class DAOFactory {
	private static DAOFactory instance = new DAOFactory();

	public static DAOFactory getInstance() {
		return instance;
	}

	public UserDao getUserDao() {
		return new UserImp();
	}

	public IProductDao getProductdao() {
		return new ProductDao();
	}
	public DonHangDao getDonHangDao() {
		return new DonHangImp();
	}
}
