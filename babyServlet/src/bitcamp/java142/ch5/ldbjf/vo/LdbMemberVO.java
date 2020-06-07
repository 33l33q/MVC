package bitcamp.java142.ch5.ldbjf.vo;

public class LdbMemberVO {
	public LdbMemberVO(){}
	
	private String lmem;
	private String lname;
	private String lid;
	private String lpw;
	private String lhp;
	private String lbirth;
	private String lemail;
	private String lpostno;
	private String lloadAddr;
	private String laddr;
	private String lphoto;
	private String ldeleteYN;
	private String linsertdate;
	private String lupdatedate;
	private String checkLpw; //수정을 위한 입력용 비밀번호
	
	
	public String getCheckLpw() {
		return checkLpw;
	}
	public void setCheckLpw(String checkLpw) {
		this.checkLpw = checkLpw;
	}
	public String getLmem() {
		return lmem;
	}
	public void setLmem(String lmem) {
		this.lmem = lmem;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLpw() {
		return lpw;
	}
	public void setLpw(String lpw) {
		this.lpw = lpw;
	}
	public String getLhp() {
		return lhp;
	}
	public void setLhp(String lhp) {
		this.lhp = lhp;
	}
	public String getLbirth() {
		return lbirth;
	}
	public void setLbirth(String lbirth) {
		this.lbirth = lbirth;
	}
	public String getLemail() {
		return lemail;
	}
	public void setLemail(String lemail) {
		this.lemail = lemail;
	}
	public String getLpostno() {
		return lpostno;
	}
	public void setLpostno(String lpostno) {
		this.lpostno = lpostno;
	}
	public String getLloadAddr() {
		return lloadAddr;
	}
	public void setLloadAddr(String lloadAddr) {
		this.lloadAddr = lloadAddr;
	}
	public String getLaddr() {
		return laddr;
	}
	public void setLaddr(String laddr) {
		this.laddr = laddr;
	}
	public String getLphoto() {
		return lphoto;
	}
	public void setLphoto(String lphoto) {
		this.lphoto = lphoto;
	}
	public String getLdeleteYN() {
		return ldeleteYN;
	}
	public void setLdeleteYN(String ldeleteYN) {
		this.ldeleteYN = ldeleteYN;
	}
	public String getLinsertdate() {
		return linsertdate;
	}
	public void setLinsertdate(String linsertdate) {
		this.linsertdate = linsertdate;
	}
	public String getLupdatedate() {
		return lupdatedate;
	}
	public void setLupdatedate(String lupdatedate) {
		this.lupdatedate = lupdatedate;
	}
	
	
	
	
}