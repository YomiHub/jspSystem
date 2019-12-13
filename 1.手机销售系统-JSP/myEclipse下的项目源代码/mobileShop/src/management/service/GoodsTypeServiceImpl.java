package management.service;

import java.util.List;
import management.tool.PageResult;
import management.databaseImp.GoodsTypeDatabaseImpl;
import management.bean.GoodsType;

public class GoodsTypeServiceImpl{

	public List<GoodsType> queryAll() {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		return GoodsTypeDao.queryAll();
	}
	
	public GoodsType queryById(int id) {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		return GoodsTypeDao.queryById(id);
	}

	public void add(GoodsType goodsType) {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		GoodsTypeDao.add(goodsType);
	}
	
	public void update(GoodsType goodsType) {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		GoodsTypeDao.update(goodsType);
	}

	public void delete(Integer id) {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		GoodsTypeDao.delete(id);
	}


	public PageResult queryByPages(Integer currentPage, Integer pageSize,String name) {
		GoodsTypeDatabaseImpl GoodsTypeDao = new GoodsTypeDatabaseImpl();
		return GoodsTypeDao.queryByPages(currentPage, pageSize,name);
	}

}
