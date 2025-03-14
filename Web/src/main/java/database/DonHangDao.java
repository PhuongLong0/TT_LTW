package database;

import java.util.List;

import bean.DonHang;

public interface DonHangDao {
	public List<DonHang> all();

	public int insert(DonHang donhang);
	public int update(DonHang donhang);
	public int delete(DonHang donhang);

	public void duyet(int id);
	
}
