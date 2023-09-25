package monsters.service;

import monsters.model.MemberDAO;
import monsters.model.MemberDTO;
import java.sql.SQLException;

public class MemberService {

	private int result;
	private MemberDAO db;
	private MemberDTO user;

	public int getResult() {
		return result;
	}

	public MemberDTO getUser() {
		return user;
	}

	public void setUser(MemberDTO user) {
		System.out.println("Set User : "+user);
		this.user = user;
	}


	public void setDb(MemberDAO db) {
		this.db = db;
	}

	public MemberService() {
		super();
		db = new MemberDAO();
	}
	/**
	 * @param db
	 */
	public MemberService(MemberDAO db) {
		super();
		this.db = db;
	}
	
	//register()
	public int register() throws SQLException {
		result = db.register(user);
		return result;
	}
	//login()
	public int login() throws SQLException {
		System.out.println("MemberService : " +user);
		MemberDTO DbUser = db.login(user);
		if(DbUser == null) {
			result = -1;
		}else if(DbUser.getMemId().equals(user.getMemId())) {
			if(DbUser.getMemPwd().equals(user.getMemPwd())) {
				user = DbUser;
				result = 1;
			}else {
				result = 0;
			}
		}else {
			result = -1;
		}
		System.out.println("MemberService(after) : "+user);
		return result;
	}
}
