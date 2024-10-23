package kr.co.partTime.beans;

/*import java.sql.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;*/

public class ContentBean {

	private int reg_num;
	private int staff_number;
	private String id;
	private String name;
	private int type_num;
	private String type_name;
	private int hourWage;
	private int insurance;
	private int holiday_pay;
	private int etc;
	private int workTime;
	private int weekPay;
	private int pay;
	private String work_id;
	private String ceo_id;
	private Integer workTimeselect;
	
	
	public Integer  getWorkTimeselect() {
		return workTimeselect;
	}
	public void setWorkTimeselect(Integer  workTimeselect) {
		this.workTimeselect = workTimeselect;
	}
	public int getReg_num() {
		return reg_num;
	}
	public void setReg_num(int reg_num) {
		this.reg_num = reg_num;
	}
	
	public int getStaff_number() {
		return staff_number;
	}
	public void setStaff_number(int staff_number) {
		this.staff_number = staff_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}
	public int getHourWage() {
		return hourWage;
	}
	public void setHourWage(int hourWage) {
		this.hourWage = hourWage;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getHoliday_pay() {
		return holiday_pay;
	}
	public void setHoliday_pay(int holiday_pay) {
		this.holiday_pay = holiday_pay;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public int getWorkTime() {
		return workTime;
	}
	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}
	
	public int getWeekPay() {
		return weekPay;
	}
	public void setWeekPay(int weekPay) {
		this.weekPay = weekPay;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getWork_id() {
		return work_id;
	}
	public void setWork_id(String work_id) {
		this.work_id = work_id;
	}
	public String getCeo_id() {
		return ceo_id;
	}
	public void setCeo_id(String ceo_id) {
		this.ceo_id = ceo_id;
	}
	
	
		
}
