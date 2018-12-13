package oracle.java.bmw.dao;

import oracle.java.bmw.model.Member;

public interface WGMemberDao {
	
	int		insert(Member member);
	int		confirm(String memberId);
	int		mailSuccess(Member member);
}
