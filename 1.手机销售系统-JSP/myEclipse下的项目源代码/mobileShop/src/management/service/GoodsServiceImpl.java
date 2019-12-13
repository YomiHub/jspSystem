package management.service;

import java.util.List;

import management.bean.Goods;
import management.databaseImp.GoodsDatabaseImpl;
import management.tool.PageResult;

public class GoodsServiceImpl {
	public List<Goods> queryAll() {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		//以后企业项目在service里面可能会做很多事情
		return goodsDao.queryAll();
	}

	public void add(Goods goods) {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		goodsDao.add(goods);
	}

	public void delete(String mobile_version) {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		goodsDao.delete(mobile_version);
	}

	public PageResult queryByPages(Integer currentPage, Integer pageSize, String mobileVersion) {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		return goodsDao.queryByPages(currentPage, pageSize, mobileVersion);
	}

	public Goods queryByVersion(String version) {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		return goodsDao.queryByVersion(version);
	}

	public void update(Goods goods) {
		GoodsDatabaseImpl goodsDao = new GoodsDatabaseImpl();
		goodsDao.update(goods);
	}

}
