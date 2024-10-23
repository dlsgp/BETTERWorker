<%@page import="kr.co.partTime.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>관리자 헤더</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet" />
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
   rel="stylesheet" />
<link href="css/manage_header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

   <%
      UserBean userBean = (UserBean) session.getAttribute("UserBean");
   String userId = (userBean != null) ? userBean.getId() : null; // null 체크
   %>


   <nav class="navbar navbar-expand-lg navbar-light"
      style="flex-direction: row; display: flex; width: 100%;">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
         data-bs-target="#navbarNav" aria-controls="navbarNav"
         aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>

      <c:choose>
         <c:when test="${loginUserBean.userLogin == true }">
            <div class="navbar-collapse" id="navbarNav"
               style="justify-content: flex-start;">

               <%--                <c:if test="${loginUserBean.type_num == 2}"> --%>
               <%--                   <li>${loginUserBean.type_num }${loginUserBean.reg_num }</li> --%>
               <%--                      <li><a href="boardmain?type_num=${obj.type_num}">${obj.type_name}</a> --%>
               <!--                      </li> -->


               <ul class="nav nav-pills lg-row"
                  style="display: flex; justify-content: space-evenly; width: 100%;">
                  <li class="nav-item"><a class="nav-link"
                     href="staffManagement?&work_id=${ContentBean.work_id}"><span>직원관리</span></a></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="schedule" role="button"
                     data-bs-toggle="dropdown" aria-expanded="true" style="color: black">급여관리 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                           href="boardmain?reg_num=${loginUserBean.reg_num }&type_num=${loginUserBean.type_num}">리스트</a></li>
                        <li>
                           <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item"
                           href="pay_modify?reg_num=${loginUserBean.reg_num }&type_num=${loginUserBean.type_num}">급여상세</a></li>
                     </ul></li>
                  <li class="nav-item"><a class="nav-link"
                     href="mainCalendar?id=${UserBean.id}"><span>스케쥴관리</span></a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="generateQRCode?id=${UserBean.id}"><span>QR코드</span></a></li>
               </ul>

               <ul
                  style="display: flex; align-items: center; margin: 0; padding: 0">
                  <li class="nav-item"><a class="nav-link" href="logout"><i
                        class="fa-solid fa-right-from-bracket"></i></a></li>
               </ul>
            </div>
         </c:when>
         <c:otherwise>
         </c:otherwise>
      </c:choose>

   </nav>
</body>