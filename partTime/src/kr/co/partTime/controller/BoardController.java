package kr.co.partTime.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;
import kr.co.partTime.beans.KeyValue;
import kr.co.partTime.beans.UserBean;
import kr.co.partTime.service.BoardService;

@Controller
public class BoardController {

   @Autowired
   @Lazy
   private BoardService boardService;

   @Resource(name = "loginUserBean")

   @Lazy
   private UserBean loginUserBean;

   @GetMapping("/boardmain")
   public String boardmain(@RequestParam("type_num") int type_num, @RequestParam("reg_num") int reg_num,

         @RequestParam(value = "page", defaultValue = "1") int page, Model model) {


      model.addAttribute("type_num", type_num);

      List<ContentBean> contentList = boardService.getContentList(reg_num, page);
      model.addAttribute("contentList", contentList);

      return "/WEB-INF/views/boardmain.jsp";
   }

   @GetMapping("/salary_form")
   public String salary_form(@RequestParam("id") String id,
         @ModelAttribute("salaryFormBean") CommuteBean salaryFormBean, Model model) {
      boardService.getSalaryFormBoard(id, salaryFormBean);
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
      return "/WEB-INF/views/salary_form.jsp";
   }

   @PostMapping("/salaryForm_pro")
   public String salary_form(@Valid @ModelAttribute("salaryFormBean") ContentBean salaryFormBean,
         BindingResult result) {
      System.out.println("BoardController salaryForm_pro 쓽 id = " + salaryFormBean.getId());
      if (result.hasErrors()) {
         return "/WEB-INF/views/salary_form.jsp";
      }

      boardService.salaryFormBoard(salaryFormBean);
      return "\"/WEB-INF/views/salary_form.jsp";
   }


   @GetMapping("/read")
   public String read(@RequestParam("board_info_idx") int board_info_idx, @RequestParam("content_idx") int content_idx,
         Model model) {

      model.addAttribute("board_info_idx", board_info_idx);
      model.addAttribute("content_idx", content_idx);

      ContentBean readContentBean = boardService.getContentInfo(content_idx);
      model.addAttribute("readContentBean", readContentBean);

      model.addAttribute("loginUserBean", loginUserBean);

      return "/WEB-INF/views/read.jsp";
   }


   @GetMapping("/delete")
   public String delete(@RequestParam("board_info_idx") int board_info_idx,
         @RequestParam("content_idx") int content_idx, Model model) {

      boardService.deleteContentInfo(content_idx);

      model.addAttribute("board_info_idx", board_info_idx);

      return "/WEB-INF/views/delete.jsp";
   }

   @GetMapping("/not_writer")
   public String not_writer() {
      return "/WEB-INF/views/not_writer.jsp";
   }

   // 급여 상세보기
   @GetMapping("/pay_modify")
   public String salary_form(CommuteBean listcommutebean, Model model) {
      
      String ceo_id = boardService.getNumToId(loginUserBean.getReg_num());
      
      List<CommuteBean> commutelist = boardService.getJoinContent(ceo_id);
      
      model.addAttribute("commutelist", commutelist);
      
      return "/WEB-INF/views/pay_modify.jsp";
   }

   // 급여 상세보기 이름 key로 값 불러오기
   @PostMapping("pay_key")
   public String pay_key(@ModelAttribute("searchCommuteBean") CommuteBean searchCommuteBean,
         HttpServletRequest request, Model model) {
      String key = request.getParameter("key");

      List<CommuteBean> commutePayList = boardService.getSearchWorker(key);

      model.addAttribute("commutePayList", commutePayList);

      return "/WEB-INF/views/pay_modify.jsp";
   }

   @Transactional
   @PostMapping("payModify_pro")
   public String payModify_pro(@Valid @ModelAttribute("updatePaycommuteBean") CommuteBean updatePaycommuteBean,
         BindingResult result) {
      
      boardService.addUpdatePay(updatePaycommuteBean);
      return "/WEB-INF/views/pay_modify.jsp";
   }

}
