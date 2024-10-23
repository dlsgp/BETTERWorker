package kr.co.partTime.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;
import kr.co.partTime.beans.EmployFormBean;
import kr.co.partTime.beans.KeyValue;
import kr.co.partTime.beans.ResumeAddBean;
import kr.co.partTime.beans.ScheduleBean;
import kr.co.partTime.beans.UserBean;
import kr.co.partTime.service.UserService;

@Controller
public class UserController {

	@Autowired
	@Lazy
	private UserService userService;
	@Resource(name = "loginUserBean") 
	// id="loginUserBean" />

	@Lazy
	private UserBean loginUserBean;

	
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			@RequestParam(value = "logcheck", defaultValue = "true") boolean logcheck, Model model) {
		model.addAttribute("logcheck", logcheck);
		return "/WEB-INF/views/login.jsp";
	}

	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean, HttpSession session,
			BindingResult result) {

		if (result.hasErrors()) {
			return "/WEB-INF/views/login.jsp";
		}

		userService.getLoginUserInfo(tempLoginUserBean);

		System.out.println("UserController:Type=" + loginUserBean.getType_num());
		if (loginUserBean.isUserLogin() == true) {
			session.setAttribute("UserBean", tempLoginUserBean);
			return "/WEB-INF/views/login_success.jsp";
		} else {
			return "/WEB-INF/views/login_fail.jsp";
		}
	}

	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "/WEB-INF/views/join.jsp";
	}

	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		if (result.hasErrors()) {
			return "/WEB-INF/views/join.jsp";
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = dateFormat.format(new java.util.Date());
		joinUserBean.setReg_date(currentDate);
		userService.addUserInfo(joinUserBean);

//       session.setAttribute("userId", joinUserBean.getId());

		return "/WEB-INF/views/join_success.jsp";
	}

	@GetMapping("/checkUserIdExist/{id}")
	@ResponseBody
	public Map<String, Boolean> checkUserIdExist(@PathVariable String id) {
		boolean duplicated = userService.isUserIdExist(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("duplicated", duplicated);
		return response;
	}

	@GetMapping("/checkUserjobNumExist/{jobNum}")
	@ResponseBody
	public Map<String, Boolean> checkUserJobNumExist(@PathVariable String jobNum) {
		boolean duplicated = userService.isUserJobNumExist(jobNum);
		Map<String, Boolean> response = new HashMap<>();
		response.put("duplicated", duplicated);
		return response;
	}

	@GetMapping("/checkUserEmailExist/{email}")
	@ResponseBody
	public Map<String, Boolean> checkUserEmailExist(@PathVariable String email) {
		System.out.println("Checking email: " + email); // 濡쒓렇 異붽�
		boolean duplicated = userService.isUserEmailExist(email);
		Map<String, Boolean> response = new HashMap<>();
		response.put("duplicated", duplicated);
		return response;
	}

	// 3) 정보 수정
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") EmployFormBean modifyUserBean) {
		EmployFormBean tempUserBean = userService.getModifyUserInfo(modifyUserBean);
		modifyUserBean.setName(tempUserBean.getName());
		modifyUserBean.setId(tempUserBean.getId());
		modifyUserBean.setPwd(tempUserBean.getPwd());
		modifyUserBean.setTel(tempUserBean.getTel());
		modifyUserBean.setEmail(tempUserBean.getEmail());
		modifyUserBean.setAdd1(tempUserBean.getAdd1());
		modifyUserBean.setAdd2(tempUserBean.getAdd2()); //
		modifyUserBean.setHourWage(tempUserBean.getHourWage());
		modifyUserBean.setEmploy_date(tempUserBean.getEmploy_date());
		modifyUserBean.setExp_periodstart(tempUserBean.getExp_periodstart());
		modifyUserBean.setExp_periodend(tempUserBean.getExp_periodend());
		modifyUserBean.setInsurance(tempUserBean.getInsurance());
		System.out.println("controller 肉� reg_num :" + modifyUserBean.getReg_num());
		return "/WEB-INF/views/modify.jsp";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {

		if (result.hasErrors()) {
			return "/WEB-INF/views/modify.jsp";
		}
		System.out.println("UserController modify_pro reg_num = " + modifyUserBean.getReg_num());
		userService.modifyUserInfo(modifyUserBean);
		return "/WEB-INF/views/modify_success.jsp";
	}

	// 4) 로그아웃
	@GetMapping("logout")
	public String logout() {
	    loginUserBean.setUserLogin(false);
	    return "/WEB-INF/views/logout.jsp";
	}

	@GetMapping("/not_login")
	public String not_login() {
	    return "/WEB-INF/views/not_login.jsp";
	}

	// 직원 등록 폼을 보여주는 GET 요청 처리
	@GetMapping("/staffForm")
	public String staffForm(@ModelAttribute("searchBean") UserBean XX) {
	    return "/WEB-INF/views/staffForm.jsp"; 
	}


	@PostMapping("staffForm_key")
	public String staffForm_key(@ModelAttribute("searchBean") UserBean searchBean, HttpServletRequest request) {
		String key = request.getParameter("key");

		UserBean tempUserBean = userService.getSearchWorker(key);

		searchBean.setId(tempUserBean.getId());
		searchBean.setReg_num(tempUserBean.getReg_num());
		searchBean.setType_num(tempUserBean.getType_num());
		searchBean.setName(tempUserBean.getName());
		searchBean.setTel(tempUserBean.getTel());
		searchBean.setEmail(tempUserBean.getEmail());
		searchBean.setAdd1(tempUserBean.getAdd1());
		searchBean.setAdd2(tempUserBean.getAdd2());

		return "/WEB-INF/views/staffForm.jsp";
	}

	@PostMapping("/staffForm_pro")
	public String staffForm_pro(@Valid @ModelAttribute("employBean") EmployBean employBean, BindingResult result) {
		if (result.hasErrors()) {
			return "/WEB-INF/views/staffForm.jsp";
		}

		String ceo_id = userService.getNumToId(loginUserBean.getReg_num());
		employBean.setCeo_id(ceo_id);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = dateFormat.format(new java.util.Date());
		employBean.setEmploy_date(currentDate);
		userService.addRegWorker(employBean);
		return "/WEB-INF/views/mainpage.jsp";
	}

	@GetMapping("/staffManagement")
	public String staffManagement(EmployFormBean employformbean, Model model) {

		String ceo_id = userService.getNumToId(loginUserBean.getReg_num());

		List<EmployFormBean> employFormlist = userService.getExpContent(ceo_id);
		List<EmployBean> employlist = userService.getJoinContent(ceo_id);

		model.addAttribute("employlist", employlist);
		model.addAttribute("employFormlist", employFormlist);

		System.out.println(employlist);
		System.out.println("employformlist" + employFormlist);

		return "/WEB-INF/views/staffManagement.jsp";
	}

	@GetMapping("/staffFormDetail")
	public String staffFormDetail(@ModelAttribute("staffmodifyUserBean") EmployFormBean staffmodifyUserBean,
			Model model) {
		String work_id = staffmodifyUserBean.getId();
		EmployFormBean tempUserBean = userService.getstaffFormWorkId(work_id);

		if (tempUserBean == null) {

			model.addAttribute("error", "No staff found with ID: " + work_id);
			return "/WEB-INF/views/error.jsp";
		}

		staffmodifyUserBean.setId(work_id);
		staffmodifyUserBean.setWork_id(work_id); 

		KeyValue inradio1 = new KeyValue();
		inradio1.setKey("예");
		inradio1.setValue("1");

		KeyValue inradio2 = new KeyValue();
		inradio2.setKey("아니오");
		inradio2.setValue("0");

		ArrayList<KeyValue> inradio = new ArrayList<KeyValue>();
		inradio.add(inradio1);
		inradio.add(inradio2);

		model.addAttribute("inradio", inradio);

		// 직원 정보 수정 시 staffmodifyUserBean에 값을 설정
		staffmodifyUserBean.setName(tempUserBean.getName()); 
		staffmodifyUserBean.setTel(tempUserBean.getTel()); 
		staffmodifyUserBean.setEmail(tempUserBean.getEmail());
		staffmodifyUserBean.setAdd1(tempUserBean.getAdd1()); 
		staffmodifyUserBean.setAdd2(tempUserBean.getAdd2()); 
		staffmodifyUserBean.setHourWage(tempUserBean.getHourWage());
		staffmodifyUserBean.setEmploy_date(tempUserBean.getEmploy_date());
		staffmodifyUserBean.setExp_periodstart(tempUserBean.getExp_periodstart());
		staffmodifyUserBean.setExp_periodend(tempUserBean.getExp_periodend());
		staffmodifyUserBean.setInsurance(tempUserBean.getInsurance());

		return "/WEB-INF/views/staffFormDetail.jsp";

	}


	   @PostMapping("/staffmodify_pro")
	   public String staffmodify_pro(@Valid @ModelAttribute("staffmodifyUserBean") EmployFormBean staffmodifyUserBean,
	         BindingResult result) {
	      // work_id 값 로그로 확인
	      System.out.println("Updating work_id=" + staffmodifyUserBean.getWork_id());

	      if (result.hasErrors()) {
	         return "/WEB-INF/views/staffFormDetail.jsp";
	      }

	      userService.setEmployUpdate(staffmodifyUserBean);

	      return "/WEB-INF/views/staffmodify_success.jsp";
	   }


	@RequestMapping("/mypagePay")
	public String mypagePay(@ModelAttribute CommuteBean commuteBean, Model model) {
		CommuteBean tempUserBean = userService.getCommuteRecord(commuteBean.getReg_num());
		model.addAttribute("commuteRecord", tempUserBean);
		return "/WEB-INF/views/mypage_pay.jsp";
	}

	@GetMapping("/mainCalendar")
	public String mainCalendar(ScheduleBean schedulebean, Model model) {
		String ceo_id = userService.getNumToId(loginUserBean.getReg_num());

		List<ScheduleBean> stafflist = userService.getStaffList(ceo_id);
		if (stafflist == null || stafflist.isEmpty()) {
			
		}
		model.addAttribute("stafflist", stafflist);

		List<ScheduleBean> contentlist = userService.getContentList(ceo_id);
		model.addAttribute("contentlist", contentlist);

		return "/WEB-INF/views/mainCalendar.jsp";
	}

	@PostMapping("/getStaffDetails")
	public String getStaffDetails(@RequestParam("reg_num") int reg_num,
			@ModelAttribute("detailScheduleBean") ScheduleBean detailScheduleBean) {
		ScheduleBean tempScheduleBean = userService.getStaffDetails(reg_num);
		detailScheduleBean.setReg_num(tempScheduleBean.getReg_num());
		detailScheduleBean.setType_num(tempScheduleBean.getType_num());
		detailScheduleBean.setWork_id(tempScheduleBean.getWork_id());
		detailScheduleBean.setStaff_number(tempScheduleBean.getStaff_number());

		return "/WEB-INF/views/getStaffDetails.jsp";
	}

	// 일정 등록 처리
	@PostMapping("/mainCalendar_pro")
	public String staffForm_pro(@Valid @ModelAttribute("scheduleBean") ScheduleBean scheduleBean,
			BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("error");
			return "/WEB-INF/views/mainCalendar.jsp";
		}

		String ceo_id = userService.getNumToId(loginUserBean.getReg_num());
		scheduleBean.setCeo_id(ceo_id);
		userService.addSchedule(scheduleBean);
		return "/WEB-INF/views/mainCalendar.jsp";
	}

	@GetMapping("/mainCalendar/getSchedules")
	@ResponseBody
	public List<Map<String, Object>> getSchedules() {
		List<ScheduleBean> schedules = userService.getSchedules();

		List<Map<String, Object>> events = new ArrayList<>();
		for (ScheduleBean schedule : schedules) {
			Map<String, Object> event = new HashMap<>();
			event.put("title", schedule.getName());
			event.put("start", schedule.getSch_workDate() + "T" + schedule.getSch_workTime());
			event.put("end", schedule.getSch_workDate() + "T" + schedule.getSch_workEndTime());
			event.put("color", schedule.getColor()); // 而щ윭 �꽕�젙
			events.add(event);
		}
		return events;
	}

	@GetMapping("/qr")
	public String qr(UserBean qruserBean, Model model) {
		System.out.println("UserController의 login QR의 Type_num = " + qruserBean.getType_num());
		System.out.println("UserController의 login QR의 Reg_num = " + qruserBean.getReg_num());



		String id = userService.getNumToId(qruserBean.getReg_num());

		System.out.println("UserController의 login QR의 id = " + id);

		model.addAttribute("reg_num", qruserBean.getReg_num());
		model.addAttribute("type_num", qruserBean.getType_num());
		model.addAttribute("id", id);

		return "/WEB-INF/views/qr.jsp";

	}

	@Transactional
	@PostMapping("/qr_pro")
	public String qr_pro(@Valid @ModelAttribute("qrCommuteBean") CommuteBean qrCommuteBean, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("BindingResult Errors: " + result.getAllErrors());
			return "/WEB-INF/views/error.jsp";
		}

		// `qrCommuteBean`의 `staff_number` 값을 설정
//      String uuid = qrCommuteBean.getUuid();
		String staffNum = userService.getStaffNumber(qrCommuteBean);
		System.out.println("UserController의 getStaffNumber = " + staffNum);
		qrCommuteBean.setStaff_number(staffNum);

		if (qrCommuteBean.getWorkOut() != null && !qrCommuteBean.getWorkOut().isEmpty()) {

			userService.updateCommute(qrCommuteBean);

			return "/WEB-INF/views/workOut_success.jsp";
		}

		// 출근 기록을 삽입
		System.out.println("Inserting commute record for work_id: " + qrCommuteBean.getWork_id());
		userService.setQrCommute(qrCommuteBean); // insert into commute

		return "/WEB-INF/views/workIn_success.jsp";
	}

	@GetMapping("/generateQRCode")
	public String generateQRCode(@Valid @ModelAttribute("generateBean") UserBean generateBean, BindingResult result,
			HttpSession session) {
		UserBean userBean = (UserBean) session.getAttribute("UserBean");
		if (userBean == null) {
			return "/WEB-INF/views/login.jsp";
		}

		String ceo_id = userBean.getCeo_id();
		generateBean.setCeo_id(ceo_id);

		if (result.hasErrors()) {
			return "/WEB-INF/views/qr.jsp";
		}

		return "/WEB-INF/views/generateQRCode.jsp";
	}

	// 미리보기(선택된 항목 + 이동 방식에 따른 처리)
	@GetMapping("/resume_write")
	public String resume_write(ResumeAddBean resumeaddbean, Model model) {

		String id = userService.getNumToId(loginUserBean.getReg_num());

		List<ResumeAddBean> resumelist = userService.getResumeContent(id);

		model.addAttribute("resumelist", resumelist);

		return "/WEB-INF/views/resume_write.jsp";

	}

	
	@GetMapping("/resumeForm")
	public String resumeForm(@ModelAttribute("resumeBean") ResumeAddBean resumeBean) {
		if (resumeBean == null) {
			return "error_page";
		}

		int reg_num = resumeBean.getReg_num();
		List<UserBean> userBeanList = userService.getResumeInfo(reg_num);

		if (userBeanList == null || userBeanList.isEmpty()) {
			return "error_page"; 
		}

		UserBean tempUserBean = userBeanList.get(0); // 선택한 항목에 따라 이동 처리가 필요한 리스트 


		resumeBean.setName(tempUserBean.getName());

		return "WEB-INF/views/resumeForm.jsp";
	}

	// 입력된 데이터 등록
	@PostMapping("/resume_pro")
	public String resume_pro(@Valid @ModelAttribute("resumeModifyBean") ResumeAddBean resumeModifyBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return "/WEB-INF/views/resumeForm.jsp";
		}

		userService.addResumeInfo(resumeModifyBean);

		return "/WEB-INF/views/resume_success.jsp";
	}

	@GetMapping("/resumeModify")
	public String resumeModify(@ModelAttribute("modifyResumeBean") ResumeAddBean modifyResumeBean) {

		int history_num = modifyResumeBean.getHistory_num();

		ResumeAddBean tempResumeBean = userService.getModifyResumeInfo(history_num);

		if (tempResumeBean != null) {
			modifyResumeBean.setName(tempResumeBean.getName());
			modifyResumeBean.setComName(tempResumeBean.getComName());
			modifyResumeBean.setTodo(tempResumeBean.getTodo());
			modifyResumeBean.setPast_join_date(tempResumeBean.getPast_join_date());
			modifyResumeBean.setPast_leaveDate(tempResumeBean.getPast_leaveDate());
		} else {

			return "redirect:/errorPage";
		}

		return "/WEB-INF/views/resumeModify.jsp";
	}

	// 입력된 데이터 수정
	@Transactional
	@PostMapping("/resumemodify_pro")
	public String resumemodify_pro(@Valid @ModelAttribute("resumeUpdateBean") ResumeAddBean resumeUpdateBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "/WEB-INF/views/resumeModify.jsp";
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			if (resumeUpdateBean.getPast_join_date() != null && !resumeUpdateBean.getPast_join_date().isEmpty()) {
				resumeUpdateBean
						.setPast_join_date(dateFormat.format(dateFormat.parse(resumeUpdateBean.getPast_join_date())));
			}
			if (resumeUpdateBean.getPast_leaveDate() != null && !resumeUpdateBean.getPast_leaveDate().isEmpty()) {
				resumeUpdateBean
						.setPast_leaveDate(dateFormat.format(dateFormat.parse(resumeUpdateBean.getPast_leaveDate())));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		userService.updateResumeInfo(resumeUpdateBean);

		return "/WEB-INF/views/resume_update.jsp";
	}

	@GetMapping("/expForm")
	public String expForm(@ModelAttribute("modifyUserBean") EmployFormBean modifyUserBean) {
		String work_id = modifyUserBean.getWork_id();
		EmployFormBean tempUserBean = userService.getExpUserInfo(work_id);

		if (tempUserBean != null) {
			modifyUserBean.setName(tempUserBean.getName());
			modifyUserBean.setEmploy_date(tempUserBean.getEmploy_date());
			modifyUserBean.setExp_periodstart(tempUserBean.getExp_periodstart());
			modifyUserBean.setExp_periodend(tempUserBean.getExp_periodend());
			modifyUserBean.setSch_workDate(tempUserBean.getSch_workDate());
			modifyUserBean.setSchedule_num(tempUserBean.getSchedule_num());
		}

		return "/WEB-INF/views/expForm.jsp";
	}

	@Transactional
	@PostMapping("/expForm_pro")
	public String expForm_pro(@Valid @ModelAttribute("employformBean") EmployFormBean employformBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return "/WEB-INF/views/expForm.jsp";
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			if (employformBean.getEmploy_date() != null && !employformBean.getEmploy_date().isEmpty()) {
				employformBean.setEmploy_date(dateFormat.format(dateFormat.parse(employformBean.getEmploy_date())));
			}
			if (employformBean.getExp_periodstart() != null && !employformBean.getExp_periodstart().isEmpty()) {
				employformBean
						.setExp_periodstart(dateFormat.format(dateFormat.parse(employformBean.getExp_periodstart())));
			}
			if (employformBean.getSch_workDate() != null && !employformBean.getSch_workDate().isEmpty()) {
				employformBean.setSch_workDate(dateFormat.format(dateFormat.parse(employformBean.getSch_workDate())));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		userService.setExpUpdate(employformBean);
		return "/WEB-INF/views/exp_success.jsp";
	}

	@PostMapping("dateForm_key")
	public String dateForm_key(@ModelAttribute("searchBean") ScheduleBean searchBean, HttpServletRequest request) {
		String key = request.getParameter("key");

		ScheduleBean tempUserBean = userService.getSearchStaff(key);

		// tempUserBean이 null인지 확인
		if (tempUserBean == null) {
		    // 적절하지 않은 접근을 감지 (참고: 비정상 요청으로 인해 발생할 수 있음)
		    System.out.println("반드시 필요한 사용자 정보가 존재하지 않습니다.");
		    return "redirect:/errorPage"; // 비정상 요청으로 인해 발생할 수 있음
		}

		// tempUserBean이 null이 아닐 경우 처리
		searchBean.setWork_id(tempUserBean.getWork_id());
		searchBean.setReg_num(tempUserBean.getReg_num());
		searchBean.setType_num(tempUserBean.getType_num());
		searchBean.setStaff_number(tempUserBean.getStaff_number());

		System.out.println("UserController의 searchBean = " + searchBean.getType_num());
		System.out.println("UserController의 searchBean = " + searchBean.getStaff_number());

		return "/WEB-INF/views/calendarForm.jsp";
		}

	@PostMapping("/dateForm_pro")
	public String dateForm_pro(@Valid @ModelAttribute("scheduleBean") ScheduleBean scheduleBean, BindingResult result) {
		if (result.hasErrors()) {
			return "/WEB-INF/views/main.jsp";

		}

		String ceo_id = userService.getCeoToId(loginUserBean.getReg_num());
		scheduleBean.setCeo_id(ceo_id);

		userService.addStaffSchedule(scheduleBean);

		return "/WEB-INF/views/mainCalender.jsp";

	}

	@GetMapping("/mypage_pay")
	public String mypage_pay(CommuteBean commutebean, Model model) {
		System.out.println("mypage_pay 硫붿냼�뱶 �샇異쒕맖");

		String work_id = userService.getNumToId(loginUserBean.getReg_num());
		System.out.println("work_id: " + work_id);

		List<CommuteBean> payList = userService.getPayContent(work_id);
		System.out.println("payList size: " + (payList != null ? payList.size() : 0));

		model.addAttribute("payList", payList);

		return "/WEB-INF/views/mypage_pay.jsp";
	}

	// 사용자 요청 수집 후 처리
	@GetMapping("/checkUserJobNum")
	@ResponseBody
	public Map<String, String> checkUserJobNum(@RequestParam String jobNum) {
		Map<String, String> response = new HashMap<>();

		if (!userService.isValidJobNum(jobNum)) {
			response.put("valid", "false");
			response.put("message", "�쑀�슚�븯吏� �븡�� �궗�뾽�옄踰덊샇�엯�땲�떎.");
			return response;
		}

		boolean duplicated = userService.isUserJobNumExist(jobNum);
		if (duplicated) {
			response.put("valid", "true");
			response.put("message", "�궗�슜�븷 �닔 �뾾�뒗 �궗�뾽�옄踰덊샇�엯�땲�떎.");
		} else {
			response.put("valid", "true");
			response.put("message", "�궗�슜�븷 �닔 �엳�뒗 �궗�뾽�옄踰덊샇�엯�땲�떎.");
		}
		return response;
	}

}
