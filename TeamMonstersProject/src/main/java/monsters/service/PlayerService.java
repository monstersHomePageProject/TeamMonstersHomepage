package monsters.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import monsters.model.MemberDTO;
import monsters.model.PlayerDAO;
import monsters.model.PlayerDTO;

public class PlayerService {

	private int result;
	private PlayerDAO db;
	private PlayerDTO player;
	private MemberDTO member;
	
	//생성자
	public PlayerService(PlayerDAO db) {
		super();
		this.db = db;
	}
	
	

	public PlayerService() {
		super();
		db = new PlayerDAO();
	}

	public int getResult() {
		return result;
	}

	public PlayerDTO getPlayer() {
		return player;
	}

	public void setDb(PlayerDAO db) {
		this.db = db;
	}

	public void setPlayer(PlayerDTO player) {
		this.player = player;
	}
	
	
	public void setMember(MemberDTO member) {
		this.member = member;
	}


	// 포지션별 선수 리스트 (Select)
	public ArrayList<PlayerDTO> selectPosition() throws SQLException {
			int position = player.getPlPosition();
			ArrayList<PlayerDTO> result = db.selectPosition(position);
			return result;
	}
	
	// 선수 디테일 (Select)
		public PlayerDTO playerDetail() throws SQLException {
			PlayerDTO result = db.playerDetail(player.getPlId());
			return result;
		}
		
	// 선수 등록 (Insert)
	public int playerInsert(HttpServletRequest request) throws SQLException, IOException {
		PlayerDTO player = db.playerImgUpload(request); 
		result = db.playerInsert(player, member);
		return result;
	}
	
	// 선수정보변경 (Update)
	public int playerUpdate(HttpServletRequest request) throws SQLException, IOException {
		PlayerDTO player = db.updatePlayerImgUpload(request);
		this.player = player;
		result = db.playerUpdate(player, member);
		return result;
	}
	
	// 선수 삭제 (Delete)
	public int playerDelete() throws SQLException {
		result = db.playerDelete(player.getPlId());
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
