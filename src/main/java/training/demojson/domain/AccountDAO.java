package training.demojson.domain;

import java.util.List;

public interface AccountDAO {
	int insert(Account acc);

	int delete(int id);

	int update(Account acc);

	List<Account> selectAll();

	Account selectAccount(int id);

	List<Account> search(String key, int offset, int limit);

	int searchCount(String key);

}
