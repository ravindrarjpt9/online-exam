package co.edureka.quiz;

public class ResultModel {

	private String id;
	private String userId;
	private String userName;
	private String examType;
	private String noOfQos;
	private String status;
	private String corAns;
	private String sTime;
	
	
	public ResultModel(String id, String userId, String userName,
			String examType, String noOfQos, String status, String corAns,String stime) {
		
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.examType = examType;
		this.noOfQos = noOfQos;
		this.status = status;
		this.corAns = corAns;
		this.sTime = stime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public String getNoOfQos() {
		return noOfQos;
	}
	public void setNoOfQos(String noOfQos) {
		this.noOfQos = noOfQos;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCorAns() {
		return corAns;
	}
	public void setCorAns(String corAns) {
		this.corAns = corAns;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
}
