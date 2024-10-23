package kr.co.partTime.beans;

public class UserBean {
   private int reg_num;
   private int type_num;
   private String type_name;
   private String name;
   private String id;
   private String ceo_id;
   private String pwd;
   private String pwd2;
   private String position;
   private String tel;
   private String phoneNum;
   private String birthNum;
   private String birth;
   private String jobNum;
   private String email;
   private String add1;
   private String add2;
   private String work_id;
   private String reg_date;
   private int hourWage;
   private String employ_date;
   private String exp_periodstart;
   private String exp_periodend;
   private String staff_number;
   private int insurance;
   


   private boolean userIdExist;
   private boolean userLogin;

   public UserBean() {
      this.userIdExist = false;
      this.userLogin = false;
      this.type_num = 1;

   }

   public UserBean(int type_num) {
      this.userIdExist = false;
      this.userLogin = false;
      this.type_num = type_num;
   }

public int getReg_num() {
	return reg_num;
}

public void setReg_num(int reg_num) {
	this.reg_num = reg_num;
}

public int getType_num() {
	return type_num;
}

public void setType_num(int type_num) {
	this.type_num = type_num;
}

public String getType_name() {
	return type_name;
}

public void setType_name(String type_name) {
	this.type_name = type_name;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getCeo_id() {
	return ceo_id;
}

public void setCeo_id(String ceo_id) {
	this.ceo_id = ceo_id;
}

public String getPwd() {
	return pwd;
}

public void setPwd(String pwd) {
	this.pwd = pwd;
}

public String getPwd2() {
	return pwd2;
}

public void setPwd2(String pwd2) {
	this.pwd2 = pwd2;
}

public String getPosition() {
	return position;
}

public void setPosition(String position) {
	this.position = position;
}

public String getTel() {
	return tel;
}

public void setTel(String tel) {
	this.tel = tel;
}

public String getPhoneNum() {
	return phoneNum;
}

public void setPhoneNum(String phoneNum) {
	this.phoneNum = phoneNum;
}

public String getBirthNum() {
	return birthNum;
}

public void setBirthNum(String birthNum) {
	this.birthNum = birthNum;
}

public String getBirth() {
	return birth;
}

public void setBirth(String birth) {
	this.birth = birth;
}

public String getJobNum() {
	return jobNum;
}

public void setJobNum(String jobNum) {
	this.jobNum = jobNum;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getAdd1() {
	return add1;
}

public void setAdd1(String add1) {
	this.add1 = add1;
}

public String getAdd2() {
	return add2;
}

public void setAdd2(String add2) {
	this.add2 = add2;
}

public String getWork_id() {
	return work_id;
}

public void setWork_id(String work_id) {
	this.work_id = work_id;
}

public String getReg_date() {
	return reg_date;
}

public void setReg_date(String reg_date) {
	this.reg_date = reg_date;
}

public int getHourWage() {
	return hourWage;
}

public void setHourWage(int hourWage) {
	this.hourWage = hourWage;
}

public String getEmploy_date() {
	return employ_date;
}

public void setEmploy_date(String employ_date) {
	this.employ_date = employ_date;
}

public String getExp_periodstart() {
	return exp_periodstart;
}

public void setExp_periodstart(String exp_periodstart) {
	this.exp_periodstart = exp_periodstart;
}

public String getExp_periodend() {
	return exp_periodend;
}

public void setExp_periodend(String exp_periodend) {
	this.exp_periodend = exp_periodend;
}

public int getInsurance() {
	return insurance;
}

public void setInsurance(int insurance) {
	this.insurance = insurance;
}

public boolean isUserIdExist() {
	return userIdExist;
}

public void setUserIdExist(boolean userIdExist) {
	this.userIdExist = userIdExist;
}

public String getStaff_number() {
	return staff_number;
}

public void setStaff_number(String staff_number) {
	this.staff_number = staff_number;
}

public boolean isUserLogin() {
	return userLogin;
}

public void setUserLogin(boolean userLogin) {
	this.userLogin = userLogin;
}

   

}
