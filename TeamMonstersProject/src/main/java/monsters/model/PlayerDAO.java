package monsters.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
	public ArrayList<PlayerDTO> selectPosition(int position) throws SQLException {

		Connection conn = pool.getConnection();
		String sql = "select * from TBL_Player where pl_position= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		// sql ? 값에 PlayerDTO 객체의 id 집어넣음.
		pstmt.setInt(1, position);

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
		System.out.println(playerList);
		return playerList;

	}

	// 선수 디테일 (Select)
	public PlayerDTO playerDetail(int plId) throws SQLException {
		Connection conn = pool.getConnection();
		// sql문 작성
		String sql = "SELECT pl_id, pl_name, pl_position, TO_CHAR(pl_birth, 'YYYY-MM-DD') AS pl_birth, pl_backNo, pl_physical, Pl_PnH, pl_subject, pl_contents, regdate, pl_imgname, pl_like, pl_memName\r\n"
				+ "FROM TBL_PLAYER WHERE pl_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setInt(1, plId);

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
        String pl_birth = player.getPlBirth();
        Date birthday = Date.valueOf(pl_birth);
        
        return birthday;
 
    }
	
	// 선수 등록 (Insert)
	public int playerInsert(PlayerDTO player, MemberDTO member) throws SQLException {
		Connection conn = pool.getConnection();
		// sql문 작성

		String sql = "INSERT INTO TBL_Player\r\n"
				+ "VALUES (TBL_Player_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, 0, ?)";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 MemberDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, player.getPlName());
		pstmt.setInt(2, player.getPlPosition());
		pstmt.setDate(3, stringToDate(player));
		pstmt.setInt(4, player.getPlBackNo());
		pstmt.setString(5, player.getPlPhysical());
		pstmt.setInt(6, player.getPlPnH());
		pstmt.setString(7, player.getPlSubject());
		pstmt.setString(8, player.getPlContents());
		pstmt.setString(9, player.getPlImgName());
		pstmt.setString(10, member.getMemName());
		
		
		
		System.out.println(sql);
		System.out.println(player);

		// result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}

	// 선수정보변경 (Update)
	public int playerUpdate(PlayerDTO player, MemberDTO member) throws SQLException {

		Connection conn = pool.getConnection();
		// sql문 작성
		
		String sql = "UPDATE TBL_Player SET\r\n" 
				+ "    pl_name = ?, pl_position = ?, pl_birth = ?, \r\n" 
				+ "    pl_backNo = ?, pl_physical = ?, Pl_PnH = ?, pl_subject = ?, pl_contents = ?, \r\n" 
				+ "    regdate = sysdate, pl_imgname = ?, pl_like = ?, pl_memName = ? WHERE pl_id = ?";
		// Statement 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// sql ? 값에 PlayerDTO 객체의 필드 값을 집어넣음.
		pstmt.setString(1, player.getPlName());
		pstmt.setInt(2, player.getPlPosition());
		pstmt.setDate(3, stringToDate(player));
		pstmt.setInt(4, player.getPlBackNo());
		pstmt.setString(5, player.getPlPhysical());
		pstmt.setInt(6, player.getPlPnH());
		pstmt.setString(7, player.getPlSubject());
		pstmt.setString(8, player.getPlContents());
		pstmt.setString(9, player.getPlImgName());
		pstmt.setInt(10, player.getPlLike());
		pstmt.setString(11, member.getMemName());
		pstmt.setInt(12, player.getPlId());

		System.out.println(player.getPlName()+"/"+player.getPlPosition()+"/"+stringToDate(player)+"/"+player.getPlBackNo()+"/"+player.getPlPhysical()+"/"
		+player.getPlPnH()+"/"+player.getPlSubject()+"/"+player.getPlContents()+"/"+player.getPlImgName()+"/"+player.getPlLike()+"/"+member.getMemName()+"/"+player.getPlId());
		
		// result에 쿼리 실행 값을 할당
		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;

	}

	// 선수 삭제 (Delete)
	public int playerDelete(int plId) throws SQLException {
		Connection conn = pool.getConnection();

		String sql = "DELETE FROM TBL_PLAYER WHERE pl_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, plId);
		// result에 쿼리 실행 값을 할당

		result = pstmt.executeUpdate();

		pstmt.close(); // Statement close
		pool.releaseConnection(conn); // 커넥션 반납
		return result;
	}
	

}