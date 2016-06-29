package training.demojson.domain;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountDAOImpl extends JdbcDaoSupport implements AccountDAO {

	@Autowired
	public AccountDAOImpl(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	public int insert(Account acc) {
		String sql = "INSERT INTO account(name,password) VALUES(?,?)";
		Object[] params = new Object[] { acc.getName(), acc.getPassword() };
		try {
			return this.getJdbcTemplate().update(sql, params);
		} catch (CannotGetJdbcConnectionException e) {
			e.printStackTrace();
			return -1;
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int delete(int id) {
		String sql = "DELETE FROM account WHERE account_id = ?";
		Object[] params = new Object[] { id };
		try {
			return this.getJdbcTemplate().update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Account> selectAll() {
		String sql = "SELECT * FROM account ORDER BY account_id LIMIT 5";
		AccountMapper mapper = new AccountMapper();
		try {
			return this.getJdbcTemplate().query(sql, mapper);
		} catch (CannotGetJdbcConnectionException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Account selectAccount(int id) {
		String sql = "SELECT * FROM account WHERE account_id=?";
		Object[] params = new Object[] { id };
		AccountMapper rowMapper = new AccountMapper();
		Account c = this.getJdbcTemplate().queryForObject(sql, params, rowMapper);
		return c;
	}

	public int update(Account acc) {
		String sql = "UPDATE account SET name=?,password=? WHERE account_id=?";
		Object[] params = new Object[] { acc.getName(), acc.getPassword(), acc.getId() };
		try {
			return this.getJdbcTemplate().update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Account> search(String key, int offset, int limit) {
		List<Account> list = new ArrayList<Account>();
		String sql = "select * FROM account WHERE name LIKE ('%' || ? || '%') ORDER BY (account_id) LIMIT ? OFFSET ?";
		Object[] params = new Object[] { key, limit, offset };
		AccountMapper mapper = new AccountMapper();
		try {
			list = this.getJdbcTemplate().query(sql, params, mapper);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int searchCount(String key) {
		String sql = "select count (account_id) FROM account WHERE name LIKE ('%' || ? || '%')";
		Object[] params = new Object[] { key };
		try {
			return this.getJdbcTemplate().queryForObject(sql, params, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
