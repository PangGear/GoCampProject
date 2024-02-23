package com.project.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao  dao;

	@Override
	public LoginVO loginOK(LoginVO vo) {
		return dao.loginOK(vo);
	}

	@Override
	public List<LoginVO> getLoginList(LoginVO vo) {
		
		return dao.getLoginList(vo);
	}
	
	@Override
	public LoginVO getLogin(LoginVO vo) {
		
		return dao.getLogin(vo);
	}

	@Override
	public void memberInsert(LoginVO vo) {
		
		dao.memberInsert(vo);
	}
	
	@Override
	public void memberUpdate(LoginVO vo) {
		
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete() {
		
		dao.memberDelete();
	}
	
	// 회원가입 시 ID 중복여부 체크
	@Override
	public int checkID(LoginVO vo) {
		return dao.checkID(vo);
	}

}
