package monsters.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PlayerDAO {

	private String DBUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String DBId = "hr";
	private String DBPwd = "hr";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";
	private ConnectionPool pool;
	private int result;
	private PlayerDTO player; // 웹 브라우저로부터 받은 값을 가지고 만들어진 MemberDTO의 객체를 할당.
	private MemberDTO member;

	public PlayerDAO() {
		super();

		try {
			Class.forName(jdbcclass);
		} catch (Exception e) {
			e.printStackTrace(); // 발생한 오류가 무엇인지 출력해줌.
		}

		try {
			pool = ConnectionPool.getInstance(DBUrl, DBId, DBPwd, 3, 5, true, 500);
		} catch (Exception e) {
			// throws를 하면 웹쪽에서 처리해야하기 때문에 데이터 모델 단인 Service에서 처리해야함.
			e.printStackTrace();
		}
	}

	public PlayerDTO getPlayer() {
		return player;
	}

	public void setPlayer(PlayerDTO player) {
		this.player = player;
	}

	
	public MemberDTO getMember() {
		return member;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}

	// 포지션별 선수 리스트 (Select)
	public ArrayList<PlayerDTO> selectPosition() throws SQLException {

		Connection conn = pool.getConnection();
		String sql = "select * from TBL_Player where pl_position= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		// sql ? 값에 PlayerDTO 객체의 id 집어넣음.
		pstmt.setInt(1, player.getPl_position());

		// execute (sql)
		ResultSet result = pstmt.executeQuery();

		ArrayList<PlayerDTO> playerList = new ArrayList(); // DB에 저장된 레코드들을 담을 리스트 생성
		PlayerDTO player = null;
		// get data
		while (result.next()) {
			player = new PlayerDTO(result.getInt("pl_id"), result.getString("pl_name"), result.getInt("pl_position"),
					result.getString("pl_birth"), result.getInt("pl_backNo"), result.getString("pl_physical"),
					result.getInt("Pl_PnH"), result.getString("pl_subject"), result.getString("pl_contents"),
					result.getDate("regdate"), result.getString("pl_imgname"), result.getInt("pl_like"), result.getString("pl_memName"));

			playerList.add(player);
		}

		result.close();
		pstmt.close();
		pool.releaseConnection(conn); // 커넥션을 반환

		return playerList;

	}

	// 선수 디테일 (Select)
	public PlayerDTO playerDetail() throws SQLException {
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "SELECT * FROM TBL_PLAYER WHERE pl_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setInt(1, player.getPl_id());

		// result에 쿼리 실행 값을 할당
		ResultSet result = pstmt.executeQuery();

		PlayerDTO player = null;

		while (result.next()) {
			player = new PlayerDTO(result.getInt("pl_id"), result.getString("pl_name"), result.getInt("pl_position"),
					result.getString("pl_birth"), result.getInt("pl_backNo"), result.getString("pl_physical"),
					result.getInt("Pl_PnH"), result.getString("pl_subject"), result.getString("pl_contents"),
					result.getDate("regdate"), result.getString("pl_imgname"), result.getInt("pl_like"), result.getString("pl_memName"));
		}
		// 선수 정보 출력(Console)
		System.out.println(player);

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납

		return player;
	}

	public Date stringToDate(PlayerDTO player)
    {
        String pl_birth = player.getPl_birth();
        
        Date birthday = Date.valueOf(pl_birth);
        
        return birthday;
 
    }
	
	// 선수 등록 (Insert)
	public int playerInsert() throws SQLException {
		Connection conn = pool.getConnection();
		// sql문 작성

		String sql = "INSERT INTO TBL_Player\r\n"
				+ "VALUES (TBL_Player_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, 0, ?)";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 MemberDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, player.getPl_name());
		pstmt.setInt(2, player.getPl_position());
		pstmt.setDate(3, stringToDate(player));
		pstmt.setInt(4, player.getPl_backNo());
		pstmt.setString(5, player.getPl_physical());
		pstmt.setInt(6, player.getPl_PnH());
		pstmt.setString(7, player.getPl_subject());
		pstmt.setString(8, player.getPl_contents());
		pstmt.setString(9, player.getPl_imgName());
		pstmt.setString(10, member.getMem_name());
		
		
		
		System.out.println(sql);
		System.out.println(player);

		// result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}

	// 선수정보변경 (Update)
	public int playerUpdate() throws SQLException {

		Connection conn = pool.getConnection();
		// sql문 작성
		
		String sql = "UPDATE TBL_Player SET\r\n" + "    pl_name = ?, \r\n" + "    pl_position = ?, \r\n"
				+ "    pl_birth = ?, \r\n" + "    pl_backNo = ?, \r\n" + "    pl_physical = ?, \r\n"
				+ "    Pl_PnH = ?, \r\n" + "    pl_subject = ?, \r\n" + "    pl_contents = ?, \r\n"
				+ "    pl_imgname = ?, \r\n" + "    pl_like = ?\r\n" + "WHERE pl_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, player.getPl_name());
		pstmt.setInt(2, player.getPl_position());
		pstmt.setDate(3, stringToDate(player));
		pstmt.setInt(4, player.getPl_backNo());
		pstmt.setString(5, player.getPl_physical());
		pstmt.setInt(6, player.getPl_PnH());
		pstmt.setString(7, player.getPl_subject());
		pstmt.setString(8, player.getPl_contents());
		pstmt.setDate(9, player.getRegdate());
		pstmt.setString(10, player.getPl_imgName());
		pstmt.setInt(11, player.getPl_like());
		pstmt.setInt(12, player.getPl_id());

		// result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;

	}

	// 선수 삭제 (Delete)
	public int playerDelete() throws SQLException {
		Connection conn = pool.getConnection();

		String sql = "DELETE FROM TBL_PLAYER WHERE pl_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, player.getPl_id());
		// result에 쿼리 실행 값을 할당

		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}
	
	//포지션 int -> String으로 변경
	public String changePositionType(int pl_position) {
		String position = null;
		
		switch (pl_position) {
		case 1:
			position="외야수";
			break;
		case 2:
			position="내야수";
			break;
		case 3:
			position="투수";
			break;
		case 4:
			position="포수";
			break;
		case 5:
			position="감독 & 코치";
			break;
		case 6:
			position="취업선수";
			break;
		default:
			break;
		}
		
		return position;
	}
	
	//PnH 값을 int -> String으로 변경
		public String changePnHType(int pl_PnH) {
			String PnH = null;
			
			switch (pl_PnH) {
			case 1:
				PnH="우투우타";
				break;
			case 2:
				PnH="우투좌타";
				break;
			case 3:
				PnH="좌투우타";
				break;
			case 4:
				PnH="좌투좌타";
				break;
			case 5:
				PnH="우투";
				break;
			case 6:
				PnH="좌투";
				break;
			case 7:
				PnH="우타";
				break;
			case 8:
				PnH="좌타";
				break;
			default:
				break;
			}
			
			return PnH;
		}
}