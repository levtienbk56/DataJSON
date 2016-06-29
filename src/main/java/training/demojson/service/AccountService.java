package training.demojson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import training.demojson.domain.Account;
import training.demojson.domain.AccountDAO;

@Service
public class AccountService {
	public static final Logger logger = LogManager.getLogger(AccountService.class);

	@Autowired
	AccountDAO accountDAO;

	public Map<String, Object> getDataServerSide() {
		Map<String, Object> callbackData = new HashMap<String, Object>();

		List<Account> arr = accountDAO.selectAll();
		callbackData.put("draw", 10);
		callbackData.put("recordsTotal", arr.size());
		callbackData.put("recordsFiltered", arr.size());
		callbackData.put("data", arr);
		return callbackData;
	}

	// TODO: chỉ query một đoạn, tách câu lệnh query tổng số riêng
	public Map<String, Object> search(String key, int page, int limit) {
		Map<String, Object> callbackData = new HashMap<String, Object>();

		// total search result
		List<Account> arr = accountDAO.search(key, (page - 1) * limit, limit);
		int count = accountDAO.searchCount(key);
		// pack data return to client
		callbackData.put("key", key);
		callbackData.put("totalRecord", count);
		callbackData.put("totalRecordFiltered", arr.size());
		callbackData.put("data", arr);
		return logger.exit(callbackData);
	}
}
