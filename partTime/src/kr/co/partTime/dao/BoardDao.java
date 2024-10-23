package kr.co.partTime.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.partTime.beans.CommuteBean;
import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.EmployBean;

@Repository
public class BoardDao {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;

   public void addContentInfo(ContentBean writeContentBean) {
      sqlSessionTemplate.insert("board.addContentInfo", writeContentBean);
   }

   public String getBoardInfoName(int board_info_idx) {
      return sqlSessionTemplate.selectOne("board.getBoardInfoName", board_info_idx);
   }

   public List<ContentBean> getContentList(int reg_num, RowBounds rowBounds) {
      return sqlSessionTemplate.selectList("board.getContentList", reg_num, rowBounds);
   }

   public ContentBean getContentInfo(int content_idx) {
      return sqlSessionTemplate.selectOne("board.getContentInfo", content_idx);
   }

//   public ContentBean getSalarySearch (String id) {
//      return sqlSessionTemplate.selectOne("board.getSalarySearch", id);
//   }

   public void modifyContentInfo(ContentBean modifyContentBean) {
      sqlSessionTemplate.selectOne("board.modifyContentInfo", modifyContentBean);
   }

   public void deleteContentInfo(int content_idx) {
      sqlSessionTemplate.delete("board.deleteContentInfo", content_idx);
   }

   public int getContentCnt(int content_board_idx) {
      return sqlSessionTemplate.selectOne("board.getContentCnt", content_board_idx);
   }

   public CommuteBean getSalaryFormBoard(String id) {
      return sqlSessionTemplate.selectOne("board.getSalaryFormBoard", id);
   }

   public void salaryFormBoard(ContentBean salaryFormBean) {
      sqlSessionTemplate.selectOne("board.salaryFormBoard", salaryFormBean);
   }

   public List<CommuteBean> getSearchWorker(String key) {
      return sqlSessionTemplate.selectList("board.getSearchWorker", key);
   }

   // 급여상세보기 업데이트
   public void addUpdatePay(CommuteBean updatePaycommuteBean) {
      sqlSessionTemplate.update("board.updatePaycommuteBean", updatePaycommuteBean);
   }

   public String getNumToId(int reg_num) {
      return sqlSessionTemplate.selectOne("board.getNumToId", reg_num);
   }

   public List<CommuteBean> getJoinContent(String ceo_id) {
      return sqlSessionTemplate.selectList("user.getJoinContent", ceo_id);
   }

}
