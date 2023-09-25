package monsters.model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PlayerDTO {
	 // num 
    private int plId;
    // name 
    private String plName;
    // position 
    private int plPosition;
    // birth 
    private String plBirth;
    // backNo 
    private int plBackNo;
    // phys 
    private String plPhysical;
    // PnH 
    private int plPnH;
    // subject 
    private String plSubject;
    // contents 
    private String plContents;
    // regdate 
    private Date regdate;
    // img 
    private String plImgName;
    // like 
    private int plLike;
    // pl_memId
    private String plMemName;
	
    /**
	 * @param plId
	 * @param plName
	 * @param plPosition
	 * @param plBirth
	 * @param plBackNo
	 * @param plPhysical
	 * @param plPnH
	 * @param plSubject
	 * @param plContents
	 * @param regdate
	 * @param plImgName
	 * @param plLike
	 * @param plMemName
	 */
	

	//생성자
    public PlayerDTO() {
		super();
	}

    public PlayerDTO(int pl_id, String pl_name, int pl_position, String pl_birth, int pl_backNo, String pl_physical,
			int pl_PnH, String pl_subject, String pl_contents, Date regdate, String pl_imgName, int pl_like,
			String pl_memName) {
		super();
		this.plId = pl_id;
		this.plName = pl_name;
		this.plPosition = pl_position;
		this.plBirth = pl_birth;
		this.plBackNo = pl_backNo;
		this.plPhysical = pl_physical;
		this.plPnH = pl_PnH;
		this.plSubject = pl_subject;
		this.plContents = pl_contents;
		this.regdate = regdate;
		this.plImgName = pl_imgName;
		this.plLike = pl_like;
		this.plMemName = pl_memName;
	}

	//getter
	public int getPlId() {
		return plId;
	}
	public String getPlName() {
		return plName;
	}
	public int getPlPosition() {
		return plPosition;
	}
	public String getPlBirth() {
		return plBirth;
	}
	public int getPlBackNo() {
		return plBackNo;
	}
	public String getPlPhysical() {
		return plPhysical;
	}
	public int getPlPnH() {
		return plPnH;
	}
	public String getPlSubject() {
		return plSubject;
	}
	public String getPlContents() {
		return plContents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public String getPlImgName() {
		return plImgName;
	}
	public int getPlLike() {
		return plLike;
	}
	public String getPlMemName() {
		return plMemName;
	}
	

	//setter
	public void setPlId(int pl_id) {
		this.plId = pl_id;
	}
	public void setPlName(String pl_name) {
		this.plName = pl_name;
	}
	public void setPlPosition(int pl_position) {
		this.plPosition = pl_position;
	}
	public void setPlBirth(String pl_birth){
		this.plBirth = pl_birth;
	}
	public void setPlBackNo(int pl_backNo) {
		this.plBackNo = pl_backNo;
	}
	public void setPlPhysical(String pl_physical) {
		this.plPhysical = pl_physical;
	}
	public void setPlPnH(int pl_PnH) {
		this.plPnH = pl_PnH;
	}
	public void setPlSubject(String pl_subject) {
		this.plSubject = pl_subject;
	}
	public void setPlContents(String pl_contents) {
		this.plContents = pl_contents;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void setPlImgName(String pl_imgName) {
		this.plImgName = pl_imgName;
	}
	public void setPlLike(int pl_like) {
		this.plLike = pl_like;
	}
	public void setPlMemName(String pl_memName) {
		this.plMemName = pl_memName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + plId;
		result = prime * result + ((plName == null) ? 0 : plName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlayerDTO other = (PlayerDTO) obj;
		if (plId != other.plId)
			return false;
		if (plName == null) {
			if (other.plName != null)
				return false;
		} else if (!plName.equals(other.plName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PlayerDTO [pl_id=" + plId + ", pl_name=" + plName + ", pl_position=" + plPosition + ", pl_birth="
				+ plBirth + ", pl_backNo=" + plBackNo + ", pl_physical=" + plPhysical + ", pl_PnH=" + plPnH
				+ ", pl_subject=" + plSubject + ", pl_contents=" + plContents + ", regdate=" + regdate
				+ ", pl_imgName=" + plImgName + ", pl_like=" + plLike + ", pl_memName=" + plMemName + "]";
	}


	
    
    
}