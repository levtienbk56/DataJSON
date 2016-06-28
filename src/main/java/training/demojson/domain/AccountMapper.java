package training.demojson.domain;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class AccountMapper implements RowMapper<Account> {

	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		return new Account(rs.getInt("account_id"), rs.getString("name"), rs.getString("password"));
	}

}
