package monsters.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		System.out.println(player.getPlBirth());
		System.out.println(stringToDate(player));
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
	
	//선수 이미지 업로드
	public PlayerDTO playerImgUpload(HttpServletRequest request) throws IOException {
		
		//이미지 파일 저장 경로
		//저장 경로는 서버에 이미지가 저장되는 경로로 설정해야한다. 서버에서 업로드 되어야 저장된 이미지를 서버에서 바로 불러 올 수 있기 때문이다.
		// 그렇지 않으면 저장된 이미지를 바로 불러올 수가 없다.
		String location = "C:\\Users\\User\\OneDrive\\바탕 화면\\Java_prt\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamMonstersProject\\img\\PlayerPic";
		//파일 MAX사이즈 지정
		int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트
		//파일 업로드를 수행하는 MultipartRequest객체 생성
		MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
		//브라우저로부터 받는 파일의 파라미터를 반환
		Enumeration<?> files = multi.getFileNames();
		
		String element="";
		String fileName="";
		
		//multipart 타입으로 파라미터를 전송하면 값을 getParameter로 불러올 수 없기 때문에 브라우저로부터 MultipartRequest에
		//저장된 값들을 꺼내서 일일히 PlayerDTO의 필드 값에 할당해주어야 한다.
	    String plName="";	    
	    String plPosition="";	    
	    String plBirth="";	   
	    String plBackNo="";	    
	    String plPhysical="";	    
	    String plPnH="";	   
	    String plSubject="";	    
	    String plContents="";	       
	    String plImgName="";
	    
	    PlayerDTO player = null;
		
		//파일명 반환
		if(files.hasMoreElements()) { //다음 파일 정보가 있으면,
			element = (String)files.nextElement();
			fileName = multi.getFilesystemName(element);
			
			//insertPl.jsp로부터 받아온 파라미터 값들
			plName = multi.getParameter("plName");
			plPosition = multi.getParameter("plPosition");
			plBirth = multi.getParameter("plBirth");
			plBackNo = multi.getParameter("plBackNo");
			plPhysical = multi.getParameter("plPhysical");
			plPnH = multi.getParameter("plPnH");
			plSubject = multi.getParameter("plSubject");
			plContents = multi.getParameter("plContents");
			plImgName = fileName;
			
			//브라우저로부터 받은 값으로 DTO 생성.
			player = new PlayerDTO(plName,plPosition,plBirth,plBackNo,plPhysical,
							plPnH,plSubject,plContents,plImgName);
		}
		System.out.println("fileName :: "+fileName);
		return player;
		
	}
	
	//전체 선수 리스트(selectAll)
	public ArrayList<PlayerDTO> AllPlayerSelect() throws SQLException {

		Connection conn = pool.getConnection();
		String sql = "select pl_id, pl_name, pl_position, TO_CHAR(pl_birth, 'YYYY-MM-DD') AS pl_birth, pl_backNo, pl_physical, Pl_PnH, pl_subject, \r\n"
				+ "		pl_contents, regdate, pl_imgname, pl_like, pl_memName from TBL_Player";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		// execute (sql)
		ResultSet result = pstmt.executeQuery();

		ArrayList<PlayerDTO> allPlayerList = new ArrayList(); // DB에 저장된 레코드들을 담을 리스트 생성
		PlayerDTO player = null;
		// get data
		while (result.next()) {
			player = new PlayerDTO(result.getInt("pl_id"), result.getString("pl_name"), result.getInt("pl_position"),
					result.getString("pl_birth"), result.getInt("pl_backNo"), result.getString("pl_physical"),
					result.getInt("Pl_PnH"), result.getString("pl_subject"), result.getString("pl_contents"),
					result.getDate("regdate"), result.getString("pl_imgname"), result.getInt("pl_like"), result.getString("pl_memName"));

			allPlayerList.add(player);
		}

		result.close();
		pstmt.close();
		pool.releaseConnection(conn); // 커넥션을 반환
		System.out.println(allPlayerList);
		return allPlayerList;

	}
	

}