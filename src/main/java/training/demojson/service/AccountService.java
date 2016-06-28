package training.demojson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import training.demojson.domain.Account;
import training.demojson.domain.AccountDAO;

@Service
public class AccountService {
	@Autowired
	AccountDAO accountDAO;

	public Map<String, Object> getDataServerSide() {
		Map<String, Object> callbackData = new HashMap<String, Object>();

		List<Account> arr = accountDAO.selectAll();
		callbackData.put("draw", 1);
		callbackData.put("recordsTotal", arr.size());
		callbackData.put("recordsFiltered", arr.size());
		callbackData.put("data", arr);
		return callbackData;
	}
}
