package management.service;

import java.util.List;

import management.bean.OrderForm;
import management.databaseImp.OrderFormDatabaseImpl;
import management.tool.PageResult;

public class OderFormServiceImpl {
	public List<OrderForm> queryAll() {
		OrderFormDatabaseImpl oderDao = new OrderFormDatabaseImpl();
		return oderDao.queryAll();
	}

	public void delete(int id) {
		OrderFormDatabaseImpl oderDao = new OrderFormDatabaseImpl();
		oderDao.delete(id);
	}

	public PageResult queryByPages(Integer currentPage, Integer pageSize, String userName) {
		OrderFormDatabaseImpl oderDao = new OrderFormDatabaseImpl();
		return oderDao.queryByPages(currentPage, pageSize, userName);
	}

	public OrderForm queryByLogname(Integer id) {
		OrderFormDatabaseImpl oderDao = new OrderFormDatabaseImpl();
		return oderDao.queryById(id);
	}

	public void update(OrderForm oderForm) {
		OrderFormDatabaseImpl oderDao = new OrderFormDatabaseImpl();
		oderDao.update(oderForm);
	}

}
