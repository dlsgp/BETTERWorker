package kr.co.partTime.beans;

import java.security.Timestamp;

public class ScheduleBean {
   private int schedule_num;
   private int reg_num;
   private int type_num;
   private String ceo_id;
   private String work_id;
   private int staff_number;
   private String name;
   private String sch_workDate;
   private String sch_workTime;
   private String sch_workEndTime;
   private String sch_restTime;
   private String color;
   private String memo;
   private String restDate;
   public int getSchedule_num() {
      return schedule_num;
   }
   public void setSchedule_num(int schedule_num) {
      this.schedule_num = schedule_num;
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
   public String getCeo_id() {
      return ceo_id;
   }
   public void setCeo_id(String ceo_id) {
      this.ceo_id = ceo_id;
   }
   public String getWork_id() {
      return work_id;
   }
   public void setWork_id(String work_id) {
      this.work_id = work_id;
   }
   public int getStaff_number() {
      return staff_number;
   }
   public void setStaff_number(int staff_number) {
      this.staff_number = staff_number;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getSch_workDate() {
      return sch_workDate;
   }
   public void setSch_workDate(String sch_workDate) {
      this.sch_workDate = sch_workDate;
   }
   public String getSch_workTime() {
      return sch_workTime;
   }
   public void setSch_workTime(String sch_workTime) {
      this.sch_workTime = sch_workTime;
   }
   public String getSch_workEndTime() {
      return sch_workEndTime;
   }
   public void setSch_workEndTime(String sch_workEndTime) {
      this.sch_workEndTime = sch_workEndTime;
   }
   public String getSch_restTime() {
      return sch_restTime;
   }
   public void setSch_restTime(String sch_restTime) {
      this.sch_restTime = sch_restTime;
   }
   public String getColor() {
      return color;
   }
   public void setColor(String color) {
      this.color = color;
   }
   public String getMemo() {
      return memo;
   }
   public void setMemo(String memo) {
      this.memo = memo;
   }
   public String getRestDate() {
      return restDate;
   }
   public void setRestDate(String restDate) {
      this.restDate = restDate;
   }
   
   
}
