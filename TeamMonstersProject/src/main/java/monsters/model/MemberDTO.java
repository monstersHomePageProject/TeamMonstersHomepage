package monsters.model;

public class MemberDTO {
	private String memId;
	private String memRole;
	private String memPwd;
	private String memName;
	private String memEmail;
	private String memPhone;
	private int memPlId;
	
	public MemberDTO() {
		super();
	}

	/**
	 * @param memId
	 * @param memRole
	 * @param memPwd
	 * @param memName
	 * @param memEmail
	 * @param memPhone
	 */
	public MemberDTO(String memId, String memRole, String memPwd, String memName, String memEmail,
			String memPhone) {
		super();
		this.memId = memId;
		this.memRole = memRole;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
	}
	
	public String getMemId() {
		return memId;
	}
	public String getMemRole() {
		return memRole;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public int getMemPlId() {
		return memPlId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public void setMemRole(String memRole) {
		this.memRole = memRole;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public void setMemPlId(int memPlId) {
		this.memPlId = memPlId;
	}

	@Override
	public String toString() {
		return "MemberDTO [memId=" + memId + ", memRole=" + memRole + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memEmail=" + memEmail + ", memPhone=" + memPhone + ", memPlId=" + memPlId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((memPwd == null) ? 0 : memPwd.hashCode());
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
		MemberDTO other = (MemberDTO) obj;
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
			return false;
		if (memPwd == null) {
			if (other.memPwd != null)
				return false;
		} else if (!memPwd.equals(other.memPwd))
			return false;
		return true;
	}
	
}
