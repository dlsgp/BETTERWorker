package kr.co.partTime.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;
import kr.co.partTime.beans.UserBean;
import kr.co.partTime.dao.BoardDao;

@Service
public class BoardService {

   @Value("${path.upload}")
   private String path_upload;

   @Value("${page.listcnt}")
   private int page_listcnt;

   @Value("${page.paginationcnt}")
   private int page_paginationcnt;

   @Autowired
   private BoardDao boardDao;

   @Resource(name = "loginUserBean")
   @Lazy
   private UserBean loginUserBean;

   private String saveUploadFile(MultipartFile upload_file) {

      String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

      try {
         upload_file.transferTo(new File(path_upload + "/" + file_name));
      } catch (Exception e) {
         e.printStackTrace();
      }

      return file_name;
   }


   public String getBoardInfoName(int board_info_idx) {
      return boardDao.getBoardInfoName(board_info_idx);
   }

   public List<ContentBean> getContentList(int reg_num, int page) {

      int start = (page - 1) * page_listcnt;
      RowBounds rowBounds = new RowBounds(start, page_listcnt);

      return boardDao.getContentList(reg_num, rowBounds);
   }

   public ContentBean getContentInfo(int content_idx) {
      return boardDao.getContentInfo(content_idx);
   }



   public int getSalaryFormBoard(String id, CommuteBean salaryFormBean) {
      CommuteBean tempContentBean = boardDao.getSalaryFormBoard(id);
      salaryFormBean.setName(tempContentBean.getName());
      salaryFormBean.setHourWage(tempContentBean.getHourWage());
      salaryFormBean.setInsurance(tempContentBean.getInsurance());
      salaryFormBean.setHoliday_pay(tempContentBean.getHoliday_pay());
      salaryFormBean.setEtc(tempContentBean.getEtc());
      salaryFormBean.setWorkTime1(tempContentBean.getWorkTime1());
      salaryFormBean.setWorkTime2(tempContentBean.getWorkTime2());
      salaryFormBean.setWorkTime3(tempContentBean.getWorkTime3());
      salaryFormBean.setWorkTime4(tempContentBean.getWorkTime4());
      salaryFormBean.setWorkTime5(tempContentBean.getWorkTime5());
      salaryFormBean.setWorkTime(tempContentBean.getWorkTime());
      salaryFormBean.setPay1(tempContentBean.getPay1());
      salaryFormBean.setPay2(tempContentBean.getPay2());
      salaryFormBean.setPay3(tempContentBean.getPay3());
      salaryFormBean.setPay4(tempContentBean.getPay4());
      salaryFormBean.setPay5(tempContentBean.getPay5());
      salaryFormBean.setPay(tempContentBean.getPay());

      return 0;
   }

   public void salaryFormBoard(ContentBean salaryFormBean) {
      salaryFormBean.setWork_id(salaryFormBean.getId());
      boardDao.salaryFormBoard(salaryFormBean);
   }


   public void deleteContentInfo(int content_idx) {
      boardDao.deleteContentInfo(content_idx);
   }


   public List<CommuteBean> getSearchWorker(String key) {
      return boardDao.getSearchWorker(key);
   }

   public void addUpdatePay(CommuteBean updatePaycommuteBean) {
      System.out.println("updatePaycommuteBean = " + updatePaycommuteBean.getWorkIn());
      System.out.println("updatePaycommuteBean = " + updatePaycommuteBean.getWorkOut());
      System.out.println("updatePaycommuteBean = " + updatePaycommuteBean.getCommute_num());
      boardDao.addUpdatePay(updatePaycommuteBean);
   }

   public String getNumToId(int reg_num) {
      return boardDao.getNumToId(reg_num);
   }

   public List<CommuteBean> getJoinContent(String ceo_id) {
      return boardDao.getJoinContent(ceo_id);
   }

}
