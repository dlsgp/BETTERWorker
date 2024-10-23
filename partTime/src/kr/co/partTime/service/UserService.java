package kr.co.partTime.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;
import kr.co.partTime.beans.EmployFormBean;
import kr.co.partTime.beans.ResumeAddBean;
import kr.co.partTime.beans.ScheduleBean;
import kr.co.partTime.beans.UserBean;
import kr.co.partTime.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	// (1) 사용자 정보 추가 - 사용자 정보를 데이터베이스에 저장
	public void addUserInfo(UserBean userBean) {
	    userDao.addUserInfo(userBean);
	}

	// (2) 로그인 사용자 정보 조회 - 사용자 정보를 조회하여 로그인 상태를 설정
	public void getLoginUserInfo(UserBean userBean) {
	    UserBean serviceLoginBean = userDao.getLoginUserInfo(userBean);
	    if (serviceLoginBean != null) {
	        loginUserBean.setReg_num(serviceLoginBean.getReg_num()); // 등록 번호를 로그인 사용자 정보에 설정
	        loginUserBean.setName(serviceLoginBean.getName()); // 이름을 로그인 사용자 정보에 설정
	        loginUserBean.setUserLogin(true); // 로그인 성공 상태를 true로 설정
	        loginUserBean.setType_num(serviceLoginBean.getType_num());
	        loginUserBean.setReg_num(serviceLoginBean.getReg_num());

	        System.out.println("service login reg_num=" + loginUserBean.getReg_num() + ",");
	    }
	}

	// 사용자 ID 존재 여부 확인
	public boolean isUserIdExist(String id) {
		return userDao.isUserIdExist(id);
	}

	public boolean isUserEmailExist(String email) {
		return userDao.isUserEmailExist(email);
	}

	public boolean isUserJobNumExist(String jobNum) {
		return userDao.isUserJobNumExist(jobNum);
	}

	// (3) 사용자 정보 수정 - 수정된 사용자 정보를 데이터베이스에 업데이트
	public void modifyUserInfo(UserBean modifyUserBean) {
	    userDao.modifyUserInfo(modifyUserBean);
	    System.out.println("name: " + modifyUserBean.getName());
	    System.out.println("id: " + modifyUserBean.getId());
	    System.out.println("pwd: " + modifyUserBean.getPwd());
	    System.out.println("tel: " + modifyUserBean.getTel());
	    System.out.println("email: " + modifyUserBean.getEmail());
	    System.out.println("add1: " + modifyUserBean.getAdd1());
	    System.out.println("reg_num: " + modifyUserBean.getReg_num());
	}

	// (4) 사용자 정보 조회 - 특정 조건에 맞는 사용자 정보를 검색
	public EmployFormBean getModifyUserInfo(EmployFormBean modifyUserBean) {
		// 로그인 사용자 정보가 없을 경우 예외 발생
		if (loginUserBean == null) {
			throw new IllegalStateException("로그인 사용자 정보가 없습니다.");
		}

		// 등록 번호가 유효하지 않을 경우 예외 발생
		int regNum = loginUserBean.getReg_num();
		if (regNum <= 0) {
			throw new IllegalArgumentException("유효하지 않은 등록 번호입니다.");
		}
		System.out.println("UserService에서 regNum = " + regNum);

		// 사용자 정보를 수정하기 위해 데이터베이스에서 정보 가져오기
		List<EmployFormBean> tempModifyUserBeans = userDao.getModifyUserInfo(regNum);

		// 사용자 정보가 존재하지 않을 경우 예외 발생
		if (tempModifyUserBeans != null && !tempModifyUserBeans.isEmpty()) {
			EmployFormBean tempModifyUserBean = tempModifyUserBeans.get(0);

			modifyUserBean.setReg_num(regNum);
			modifyUserBean.setName(tempModifyUserBean.getName());
			modifyUserBean.setId(tempModifyUserBean.getId());
			modifyUserBean.setPwd(tempModifyUserBean.getPwd());
			modifyUserBean.setTel(tempModifyUserBean.getTel());
			modifyUserBean.setEmail(tempModifyUserBean.getEmail());
			modifyUserBean.setAdd1(tempModifyUserBean.getAdd1());
			modifyUserBean.setAdd2(tempModifyUserBean.getAdd2());

			// 고용 관련 정보 설정
			modifyUserBean.setHourWage(tempModifyUserBean.getHourWage());
			modifyUserBean.setEmploy_date(
					tempModifyUserBean.getEmploy_date() != null ? tempModifyUserBean.getEmploy_date() : "");
			modifyUserBean.setExp_periodstart(
					tempModifyUserBean.getExp_periodstart() != null ? tempModifyUserBean.getExp_periodstart() : "");
			modifyUserBean.setExp_periodend(
					tempModifyUserBean.getExp_periodend() != null ? tempModifyUserBean.getExp_periodend() : "");
			modifyUserBean.setInsurance(tempModifyUserBean.getInsurance());

			System.out.println("UserService modifyUserBean reg_num = " + regNum);
			System.out.println("UserService modifyUserBean getName = " + tempModifyUserBean.getName());
			System.out.println("UserService modifyUserBean getId = " + tempModifyUserBean.getId());
			System.out.println("UserService modifyUserBean getPwd = " + tempModifyUserBean.getPwd());
			System.out.println("UserService modifyUserBean getEmail = " + tempModifyUserBean.getEmail());
			System.out.println("UserService modifyUserBean getAdd1 = " + tempModifyUserBean.getAdd1());
			System.out.println("UserService modifyUserBean getAdd2 = " + tempModifyUserBean.getAdd2());
			System.out.println("UserService modifyUserBean getHourWage = " + tempModifyUserBean.getHourWage());
			System.out.println("UserService modifyUserBean getEmploy_date = " + tempModifyUserBean.getEmploy_date());
			System.out.println(
					"UserService modifyUserBean getExp_periodstart = " + tempModifyUserBean.getExp_periodstart());
			System.out
					.println("UserService modifyUserBean getExp_periodend = " + tempModifyUserBean.getExp_periodend());
			System.out.println("UserService modifyUserBean getInsurance = " + tempModifyUserBean.getInsurance());
		} else {
			throw new IllegalArgumentException("사용자 정보가 존재하지 않습니다.");
		}

		return modifyUserBean;
	}

	// (5) 직원 정보 수정 - 수정된 직원 정보를 데이터베이스에 업데이트
	public void staffmodifyUserInfo(UserBean staffmodifyUserBean) {
	    userDao.modifyUserInfo(staffmodifyUserBean);

	    // 수정된 직원 정보 출력
	    System.out.println("name: " + staffmodifyUserBean.getName());
	    System.out.println("tel: " + staffmodifyUserBean.getTel());
	    System.out.println("email: " + staffmodifyUserBean.getEmail());
	    System.out.println("add1: " + staffmodifyUserBean.getAdd1());
	    System.out.println("add2: " + staffmodifyUserBean.getAdd2());
	    System.out.println("reg_num: " + staffmodifyUserBean.getReg_num());
	}

	// (6) 직원 정보 조회 - 로그인된 직원의 정보를 가져옴
	public UserBean getstaffModifyUserInfo(UserBean staffmodifyUserBean) {
	    // 로그인된 사용자가 없는 경우 예외 처리
	    if (loginUserBean == null) {
	        throw new IllegalStateException("로그인된 사용자가 없습니다.");
	    }

	    // 로그인된 사용자의 등록 번호를 가져옴
	    int regNum = loginUserBean.getReg_num();
	    if (regNum <= 0) {
	        throw new IllegalArgumentException("유효하지 않은 등록 번호입니다.");
	    }


	 // 로그인된 사용자의 등록 번호 출력
	    System.out.println("loginUserBean reg_num = " + loginUserBean.getReg_num());

	    // 직원 등록 번호 출력
	    System.out.println("UserService regNum = " + regNum);

	    // 등록 번호에 해당하는 직원 정보 조회
	    UserBean tempModifyUserBean = userDao.getstaffModifyUserInfo(regNum);

	    // 조회된 직원 정보가 있는 경우 처리
	    if (tempModifyUserBean != null) {
	        // staffmodifyUserBean에 조회된 직원 정보 설정
	        staffmodifyUserBean.setReg_num(regNum); // 등록 번호 설정
	        staffmodifyUserBean.setName(tempModifyUserBean.getName()); // 이름 설정
	        staffmodifyUserBean.setTel(tempModifyUserBean.getTel()); // 전화번호 설정
	        staffmodifyUserBean.setEmail(tempModifyUserBean.getEmail()); // 이메일 설정
	        staffmodifyUserBean.setAdd1(tempModifyUserBean.getAdd1()); // 주소 1 설정
	        staffmodifyUserBean.setAdd2(tempModifyUserBean.getAdd2()); // 주소 2 설정

	        // 수정된 직원 정보 출력
			System.out.println("UserService reg_num = " + regNum);
			System.out.println("UserService getName = " + tempModifyUserBean.getName());
			System.out.println("UserService getEmail = " + tempModifyUserBean.getEmail());
			System.out.println("UserService getAdd1 = " + tempModifyUserBean.getAdd1());

			System.out.println("UserService staffmodifyUserBean reg_num = " + staffmodifyUserBean.getReg_num());
			System.out.println("UserService staffmodifyUserBean getName = " + staffmodifyUserBean.getName());
			System.out.println("UserService staffmodifyUserBean getEmail = " + staffmodifyUserBean.getEmail());
			System.out.println("UserService staffmodifyUserBean getAdd1 = " + staffmodifyUserBean.getAdd1());
		} else {
			// 조회된 직원 정보가 없는 경우 예외 처리
			throw new IllegalArgumentException(" 닔 젙 븷  궗 슜 옄  젙蹂닿   뾾 뒿 땲 떎.");
		}

	    // 수정된 직원 정보 반환
		return staffmodifyUserBean; // 수정된 직원 정보를 반환

	}

	public UserBean getSearchWorker(String key) {
		return userDao.getSearchWorker(key);
	}

	public void addRegWorker(EmployBean employBean) {
		userDao.addRegWorker(employBean);
	}

	public String getNumToId(int reg_num) {
		return userDao.getNumToId(reg_num);
	}

	public List<EmployBean> getJoinContent(String ceo_id) {
		return userDao.getJoinContent(ceo_id);
	}

	public List<EmployFormBean> getExpContent(String ceo_id) {
		return userDao.getExpContent(ceo_id);
	}

	// 직원 상세보기(form)
	public EmployFormBean getstaffFormWorkId(String work_id) {
		return userDao.getstaffFormWorkId(work_id);
	}

	public void setEmployUpdate(EmployFormBean employformbean) {
		userDao.setEmployUpdate(employformbean);
	}

	public CommuteBean getCommuteRecord(int reg_num) {
		return userDao.getCommuteRecord(reg_num);
	}

	public List<ScheduleBean> calendarRegister(int staff_number) {
		return userDao.calendarRegister(staff_number);
	}

	public List<ScheduleBean> getStaffList(String ceo_id) {
		System.out.println("userService  벥 mainCaledar ceo_id = " + ceo_id);
		return userDao.getStaffList(ceo_id);
	}

	public ScheduleBean getStaffDetails(int reg_num) {
		return userDao.getStaffDetails(reg_num);
	}

	// 떖 젰 뒪耳 以 젙蹂 쓣 슦湲
	public List<ScheduleBean> getContentList(String ceo_id) {
		return userDao.getContentList(ceo_id);
	}

	public void addSchedule(ScheduleBean scheduleBean) {
		userDao.addSchedule(scheduleBean);
	}

	public List<ScheduleBean> getSchedules() {
		return userDao.getSchedules();
	}

	public void setQrCommute(CommuteBean commuteBean) {
		userDao.setQrCommute(commuteBean);
	}

	public String getStaffNumber(CommuteBean qrCommuteBean) {
		return userDao.getStaffNumber(qrCommuteBean);
	}

	public void updateCommute(CommuteBean qrCommuteBean) {
		userDao.updateCommute(qrCommuteBean);

	}

	public ResumeAddBean getModifyResumeInfo(int history_num) {
		return userDao.getModifyResumeInfo(history_num);
	}

	public void updateResumeInfo(ResumeAddBean resumeaddbean) {
		userDao.updateResumeInfo(resumeaddbean);
	}

	public List<UserBean> getResumeInfo(int reg_num) {
		return userDao.getResumeInfo(reg_num);
	}

	public List<ResumeAddBean> getResumeContent(String id) {
		return userDao.getResumeContent(id);
	}

	public void addResumeInfo(ResumeAddBean resumeModifyBean) {
		userDao.addResumeInfo(resumeModifyBean);
	}

	public EmployFormBean getExpUserInfo(String workId) {
		List<EmployFormBean> results = userDao.getExpUserInfo(workId);
		if (results != null && !results.isEmpty()) {
			return results.get(0); // 泥 踰덉㎏ 寃곌낵瑜 諛섑솚
		}
		return null;
	}

	@Transactional
	public void setExpUpdate(EmployFormBean employformBean) {
		System.out.println("userService.sch_workdate =" + employformBean.getSch_workDate());
		userDao.setExpUpdate(employformBean);
	}

	public ScheduleBean getSearchStaff(String key) {
		return userDao.getSearchStaff(key);
	}

	public String getCeoToId(int reg_num) {
		return userDao.getCeoToId(reg_num);
	}

	public void addStaffSchedule(ScheduleBean scheduleBean) {
		userDao.addStaffSchedule(scheduleBean);
	}

	public List<CommuteBean> getPayContent(String work_id) {
		return userDao.getPayContent(work_id);
	}

	public boolean isValidJobNum(String jobNum) {
		if (jobNum == null || jobNum.length() != 10) {
			return false;
		}
		if (!jobNum.matches("\\d+")) {
			return false;
		}

		return isValidJobNumCheckDigit(jobNum);
	}

	private boolean isValidJobNumCheckDigit(String jobNum) {
		int[] weights = { 1, 3, 7, 1, 3, 7, 1, 3, 7, 1 };
		int sum = 0;

		for (int i = 0; i < 10; i++) {
			int digit = Character.getNumericValue(jobNum.charAt(i));
			sum += digit * weights[i];
		}

		return sum % 10 == 0;
	}

}
