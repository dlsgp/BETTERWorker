package kr.co.partTime.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;
import kr.co.partTime.beans.EmployFormBean;
import kr.co.partTime.beans.ResumeAddBean;
import kr.co.partTime.beans.ScheduleBean;
import kr.co.partTime.beans.UserBean;

@Repository
public class UserDao {

   @Autowired
   private SqlSessionTemplate sqltemp;

   // (1) 사용자 정보 추가
   public void addUserInfo(UserBean userBean) {
      sqltemp.insert("user.addUserInfo", userBean);
   }

   // (2) 로그인 사용자 정보 조회
   public UserBean getLoginUserInfo(UserBean userBean) {
      return sqltemp.selectOne("user.getLoginUserInfo", userBean);
   }

   // 사용자 ID 존재 여부 확인
   public boolean isUserIdExist(String id) {
      int count = sqltemp.selectOne("user.isUserIdExist", id);
      return count > 0;
   }

   // 사용자 이메일 존재 여부 확인
   public boolean isUserEmailExist(String email) {
      int count = sqltemp.selectOne("user.isUserEmailExist", email);
      return count > 0;
   }

   // 사용자 직업 번호 존재 여부 확인
   public boolean isUserJobNumExist(String jobNum) {
      int count = sqltemp.selectOne("user.isUserJobNumExist", jobNum);
      return count > 0;
   }

   // (3) 사용자 정보 수정
   public void modifyUserInfo(UserBean modifyUserBean) {
      sqltemp.update("user.modifyUserInfo", modifyUserBean);
      System.out.println("UserBean Values: " + modifyUserBean);
   }

   // (4) 사용자 정보 수정 시 필요한 데이터 조회
   public List<EmployFormBean> getModifyUserInfo(int reg_num) {
      System.out.println("UserDao의 수정 요청 reg_num = " + reg_num);
      return sqltemp.selectList("user.getModifyUserInfo", reg_num);
   }

   // 작업자 검색
   public UserBean getSearchWorker(String key) {
      return sqltemp.selectOne("user.getSearchWorker", key);
   }

   // 작업자 등록
   public void addRegWorker(EmployBean employBean) {
      sqltemp.insert("user.addRegWorker", employBean);
   }

   // (5) 직원 정보 수정
   public void staffmodifyUserInfo(UserBean staffmodifyUserBean) {
      sqltemp.update("user.staffmodifyUserInfo", staffmodifyUserBean);
      System.out.println("UserBean Values: " + staffmodifyUserBean);
   }

   // (6) 직원 정보 조회
   public UserBean getstaffModifyUserInfo(int reg_num) {
      System.out.println("UserDao의 조회 요청 reg_num = " + reg_num);
      return sqltemp.selectOne("user.getstaffModifyUserInfo", reg_num);
   }

   // 등록 번호로 사용자 ID 조회
   public String getNumToId(int reg_num) {
      return sqltemp.selectOne("user.getNumToId", reg_num);
   }

   // 콘텐츠 리스트 조회
   public List<UserBean> insertContentList(String id) {
      return sqltemp.selectList("user.insertContentList");
   }

   // CEO ID로 가입 콘텐츠 조회
   public List<EmployBean> getJoinContent(String ceo_id) {
      return sqltemp.selectList("user.getJoinContent", ceo_id);
   }

   // 경력 콘텐츠 조회
   public List<EmployFormBean> getExpContent(String ceo_id) {
      return sqltemp.selectList("user.getExpContent", ceo_id);
   }

   // 직원 상세보기 (form)
   public EmployFormBean getstaffFormWorkId(String work_id) {
      return sqltemp.selectOne("user.getstaffFormWorkId", work_id);
   }

   // 직원 정보 업데이트
   public void setEmployUpdate(EmployFormBean employformbean) {
      sqltemp.update("user.setEmployUpdate", employformbean);
   }

   // 출퇴근 기록 조회
   public CommuteBean getCommuteRecord(int reg_num) {
      return sqltemp.selectOne("user.getCommuteRecord", reg_num);
   }

   // 캘린더 등록
   public List<ScheduleBean> calendarRegister(int staff_number) {
      return sqltemp.selectList("user.calendarRegister", staff_number);
   }

   // QR 출퇴근 기록 추가
   public void setQrCommute(CommuteBean commuteBean) {
      sqltemp.insert("user.setQrCommute", commuteBean);
   }

   // QR 출퇴근 기록으로 직원 번호 조회
   public String getStaffNumber(CommuteBean qrCommuteBean) {
      return sqltemp.selectOne("user.getStaffNumber", qrCommuteBean);
   }

   // 출퇴근 정보 업데이트
   public void updateCommute(CommuteBean qrCommuteBean) {
      System.out.println("Updating commute in DAO with: " + qrCommuteBean);
      sqltemp.update("user.updateCommute", qrCommuteBean);
   }

   // 직원 리스트 조회
   public List<ScheduleBean> getStaffList(String ceo_id) {
      System.out.println("userdao의 mainCalendar ceo_id = " + ceo_id);
      return sqltemp.selectList("user.getStaffList", ceo_id);
   }

   // 콘텐츠 리스트 조회
   public List<ScheduleBean> getContentList(String ceo_id) {
      return sqltemp.selectList("user.getContentList", ceo_id);
   }

   // 직원 상세 정보 조회
   public ScheduleBean getStaffDetails(int reg_num) {
      return sqltemp.selectOne("user.getStaffDetails", reg_num);
   }

   // 일정 추가
   public void addSchedule(ScheduleBean scheduleBean) {
      sqltemp.insert("user.addSchedule", scheduleBean);
   }

   // 모든 일정 조회
   public List<ScheduleBean> getSchedules() {
      return sqltemp.selectList("user.getSchedules");
   }

   // 이력서 정보 조회
   public List<UserBean> getResumeInfo(int reg_num) {
      return sqltemp.selectList("user.getResumeInfo", reg_num);
   }

   // 이력서 콘텐츠 조회
   public List<ResumeAddBean> getResumeContent(String id) {
      return sqltemp.selectList("user.getResumeContent", id);
   }

   // 이력서 정보 추가
   public void addResumeInfo(ResumeAddBean resumeModifyBean) {
      sqltemp.insert("user.addResumeInfo", resumeModifyBean);
   }

   // 이력서 수정 정보 조회
   public ResumeAddBean getModifyResumeInfo(int history_num) {
      return sqltemp.selectOne("user.getModifyResumeInfo", history_num);
   }

   // 이력서 정보 업데이트
   public void updateResumeInfo(ResumeAddBean resumeUpdateBean) {
      sqltemp.update("user.updateResumeInfo", resumeUpdateBean);
   }

   // 경력 정보 조회
   public List<EmployFormBean> getExpUserInfo(String workId) {
      return sqltemp.selectList("getExpUserInfo", workId);
   }

   // 경력 업데이트
   public void setExpUpdate(EmployFormBean employformBean) {
      System.out.println("userDao.sch_workDate =" + employformBean.getSch_workDate());
      System.out.println("userDao.schedule_num =" + employformBean.getSchedule_num());
      sqltemp.update("user.setExpUpdate", employformBean);
   }

   // 직원 검색
   public ScheduleBean getSearchStaff(String key) {
      return sqltemp.selectOne("user.getSearchStaff", key);
   }

   // 직원 일정 추가
   public void addStaffSchedule(ScheduleBean scheduleBean) {
      sqltemp.insert("user.addStaffSchedule", scheduleBean);
   }

   // CEO 등록 번호로 ID 조회
   public String getCeoToId(int reg_num) {
      return sqltemp.selectOne("user.getCeoToId", reg_num);
   }

   // 근로 내용 조회
   public List<CommuteBean> getPayContent(String work_id) {
      return sqltemp.selectList("user.getPayContent", work_id);
   }
}
