package monsters.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.omg.PortableInterceptor.USER_EXCEPTION;

public class MemberDAO {

	private String DBUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String DBId = "hr";
	private String DBPwd = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";   
	private ConnectionPool pool;
	private int result;
	private MemberDTO user; // 웹 브라우저로부터 받은 값을 가지고 만들어진 MemberDTO의 객체를 할당.
	
	//생성자
	public MemberDAO() {
		super();
		
		try {
			Class.forName(jdbcclass); 
		} catch (Exception e) {
			e.printStackTrace(); // 발생한 오류가 무엇인지 출력해줌.
		}
		
		try {
			pool = ConnectionPool.getInstance(DBUrl,DBId,DBPwd,3,5,true,500);
		} catch (Exception e) {
			// throws를 하면 웹쪽에서 처리해야하기 때문에 데이터 모델 단인 Service에서 처리해야함.
			e.printStackTrace();
		}
	}
	
	public MemberDTO getUser() {
		return user;
	}
	//MemberDTO 객체를 생성하는 set메서드
	public void setUser(MemberDTO user) {
		this.user = user;
	}
	
	//로그인 기능(select)
	public MemberDTO login(MemberDTO user) throws SQLException {
		// 커넥션 생성 (pool로부터 connection을 가져옴.
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "SELECT * FROM TBL_MEMBER WHERE mem_id = ?";
		//Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//sql ? 값에 MemberDTO 객체의 id 집어넣음.
		pstmt.setString(1, user.getMemId());
		System.out.println("DAO : "+user);
		
		//ResultSet에 쿼리 실행 값을 할당
		ResultSet rs = pstmt.executeQuery();
		
		//데이터 베이스 오류 시, -2 반환
		int result = -2; 
		//rs.next()를 통해 sql을 통한 값이 저장되었는지 확인
		if(rs.next()) {
			user = new MemberDTO(rs.getString("mem_id"), rs.getString("mem_role"), rs.getString("mem_pwd"),
					rs.getString("mem_name"), rs.getString("mem_email"), rs.getString("mem_phone"),
					rs.getInt("mem_plid"));  
				System.out.println("DTO 생성 직후 : " + user);
			}else {
			user = null;
		}
		
		rs.close(); // ResultSet close
		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return user;
		
	}
	
	//회원가입 기능(insert)
	public int register(MemberDTO user) throws SQLException {
		// 커넥션 생성 (pool로부터 connection을 가져옴.
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "INSERT INTO TBL_MEMBER\r\n"
				+ "    (mem_id, mem_role, mem_pwd, mem_name, mem_email, mem_phone, mem_plid)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?, 0)";
		//Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//sql ? 값에 MemberDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, user.getMemId());
		pstmt.setString(2, user.getMemRole());
		pstmt.setString(3, user.getMemPwd());
		pstmt.setString(4, user.getMemName());
		pstmt.setString(5, user.getMemEmail());
		pstmt.setString(6, user.getMemPhone());
		
		//result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();
		
		
		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}
	
	//id 중복체크 기능
	public int regDupCheck(String id) throws SQLException {
		//result가 -1이면 에러 발생
		result = -1;
		// 커넥션 생성 (pool로부터 connection을 가져옴.
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "SELECT * FROM TBL_MEMBER WHERE mem_id = ?";
		//Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//sql ? 값에 MemberDTO 객체의 id 집어넣음.
		pstmt.setString(1, id);
			
		//ResultSet에 쿼리 실행 값을 할당
		ResultSet rs = pstmt.executeQuery();
			
		//rs.next()를 통해 sql을 통한 값이 저장되었는지 확인
		if(rs.next()) {
			//result가 0이면 사용 불가능한 ID
			result = 0;
		}else { //result가 1이면 사용 가능한 ID
			result = 1;
		}
		System.out.println("아이디 중복체크결과 : "+result);
			
		rs.close(); // ResultSet close
		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
			
		return result;
			
	}
	
	//멤버관리의 전체 user 불러오기
	public ArrayList<MemberDTO> selectMember() throws SQLException {

		Connection conn = pool.getConnection();
		String sql = "select * from TBL_Member where mem_role IN ('bplayer', 'guest') order by mem_role, mem_name";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		// execute (sql)
		ResultSet result = pstmt.executeQuery();

		ArrayList<MemberDTO> memberList = new ArrayList(); // DB에 저장된 레코드들을 담을 리스트 생성
		MemberDTO user = null;
		
		// get data
		while (result.next()) {
			user = new MemberDTO(result.getString("mem_id"), result.getString("mem_role"), result.getString("mem_pwd"),
					result.getString("mem_name"), result.getString("mem_email"), result.getString("mem_phone"),
					result.getInt("mem_plid"));

			memberList.add(user);
		}

		result.close();
		pstmt.close();
		pool.releaseConnection(conn); // 커넥션을 반환
		System.out.println(memberList);
		return memberList;

	}
	
	// 멤버 삭제 (Delete)
	public int memberDelete(String memId) throws SQLException {
		Connection conn = pool.getConnection();

		String sql = "DELETE FROM TBL_MEMBER WHERE mem_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		// result에 쿼리 실행 값을 할당

		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}
	
	//멤버 디테일(Select)
	public MemberDTO memberDetail(String memId) throws SQLException {
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "SELECT mem_id, mem_role, mem_pwd, mem_name, mem_email, mem_phone, mem_plid\r\n"
				+ "FROM TBL_MEMBER WHERE mem_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, memId);

		// result에 쿼리 실행 값을 할당
		ResultSet result = pstmt.executeQuery();

		PlayerDTO player = null;

		while (result.next()) {
			user = new MemberDTO(result.getString("mem_id"), result.getString("mem_role"), result.getString("mem_pwd"),
					result.getString("mem_name"), result.getString("mem_email"), result.getString("mem_phone"),
					result.getInt("mem_plid"));
		}
		// 멤버 정보 출력(Console)
		System.out.println(user);

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납

		return user;
	}
	
	public int memberUpdate(MemberDTO user) throws SQLException {

		Connection conn = pool.getConnection();
		// sql문 작성

		System.out.println("DAO.memberUpdate (user) : "  + user);
		
		String sql = "UPDATE TBL_MEMBER SET\r\n" 
				+ "    mem_role = ?, mem_PlId = ? \r\n" 
				+ "    WHERE mem_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, user.getMemRole());
		pstmt.setInt(2, user.getMemPlId());
		pstmt.setString(3, user.getMemId());

		// result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();

		System.out.println("DAO.memberUpdate : "  + user);
		
		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;

	}
}
