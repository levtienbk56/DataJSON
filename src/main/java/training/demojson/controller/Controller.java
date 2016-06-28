package training.demojson.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import training.demojson.common.Constant;
import training.demojson.domain.Account;
import training.demojson.domain.AccountDAO;

@org.springframework.stereotype.Controller
public class Controller {
	public static final Logger logger = LogManager.getLogger(Controller.class);
	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home() {
		logger.entry();
		return "pages/accounts";
	}

	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
	public String error403() {
		logger.entry();
		return "pages/error403";
	}

	@RequestMapping(value = { "/404" }, method = RequestMethod.GET)
	public String error404() {
		logger.entry();
		return "pages/error404";
	}

	/**
	 * login function use Spring security with notification message.
	 * 
	 * @see SpringSecurity
	 * @param error
	 * @param msg
	 * @param model
	 *            push notification through FreemarkerObject
	 * @return page name
	 */
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String msg, org.springframework.ui.Model model) {
		logger.entry();
		if (error != null) {
			model.addAttribute("error", Constant.LOGIN_FAIL);
		}
		if (msg != null) {
			model.addAttribute("msg", Constant.lOGIN_SUCCESS);
		}

		logger.exit(msg);
		return "pages/login";
	}

	@RequestMapping(value = { "/accounts" }, method = RequestMethod.POST)
	public @ResponseBody List<Account> getAccounts() {
		logger.entry();
		List<Account> accounts = accountDAO.selectAll();
		logger.debug(accounts.size());
		return accounts;
	}

	@RequestMapping(value = { "/accounts/delete" }, method = RequestMethod.POST)
	public @ResponseBody Integer deleteAccount(@RequestParam int id) {
		logger.entry();
		int i = accountDAO.delete(id);
		return logger.exit(i);
	}

	@RequestMapping(value = { "/accounts/update" }, method = RequestMethod.POST)
	public @ResponseBody Integer updateAccount(@RequestBody Account acc) {
		logger.entry();
		int i = accountDAO.update(acc);
		return logger.exit(i);
	}

	@RequestMapping(value = { "/accounts/insert" }, method = RequestMethod.POST)
	public @ResponseBody Integer insertAccount(@RequestBody Account acc) {
		logger.entry();
		int i = accountDAO.insert(acc);
		return logger.exit(i);
	}

	@RequestMapping(value = { "/accounts/json" }, method = RequestMethod.POST)
	public @ResponseBody Account getAccount(@RequestBody Integer id) {
		logger.entry();
		Account acc = accountDAO.selectAccount(id);
		return logger.exit(acc);
	}
}