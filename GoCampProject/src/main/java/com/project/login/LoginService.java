package com.project.login;

import java.util.List;

public interface LoginService {

	List<LoginVO> getLoginList(LoginVO vo);
	LoginVO getLogin(LoginVO vo);
	
	LoginVO loginOK(LoginVO vo);
	
	void memberInsert(LoginVO vo);
	void memberUpdate(LoginVO vo);
	void memberDelete();
	
	// 회원가입 시 ID 중복여부 체크
	int checkID(LoginVO vo);
}
