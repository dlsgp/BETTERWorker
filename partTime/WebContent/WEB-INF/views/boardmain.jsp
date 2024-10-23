<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>급여 리스트</title>
<link href="css/payManagement.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
   <!-- top -->
   <c:import url="/WEB-INF/views/include/manage_header.jsp"></c:import>

   <!-- 메인비주얼  -->
   <!-- 게시글 리스트 -->
   <div class="container" style="margin-top: 100px">
      <div class="card shadow">
         <div class="card-body">
            <h4 class="card-title">${boardmain }</h4>

            <table class="table table-hover" id='board_list'>
               <thead>
                  <tr>
                     <th class="text-center d-none d-md-table-cell">글번호</th>
                     <th class="text-center d-none d-md-table-cell">사원번호</th>
                     <th class="text-center d-none d-md-table-cell">이름</th>
                     <th class="text-center d-none d-md-table-cell">시급</th>
                     <th class="text-center d-none d-md-table-cell">주휴수당</th>
                     <th class="text-center d-none d-md-table-cell">기타</th>
                     <th class="text-center d-none d-md-table-cell">근무시간</th> 
                     <th class="text-center d-none d-md-table-cell">전체급여</th>
                  </tr>
               </thead>
               <tbody>


                  <c:forEach var='obj' items="${contentList }">
                     <c:set var="i" value="${i+1 }" />


                     <tr>
                        <td class="text-center d-none d-md-table-cell">${i }</td>
                        <td class="text-center d-none d-md-table-cell">${obj.staff_number }</td>
                        <td class="text-center d-none d-md-table-cell"><a
                           href="salary_form?id=${obj.id }">${obj.name }</a></td>
                        <td class="text-center d-none d-md-table-cell">${obj.hourWage }</td>
                        <td class="text-center d-none d-md-table-cell">${obj.holiday_pay }</td>
                        <td class="text-center d-none d-md-table-cell">${obj.etc }</td>
                        <td class="text-center d-none d-md-table-cell">${obj.workTime }</td>
                        <td class="text-center d-none d-md-table-cell">${obj.pay }</td>

                     </tr>
                  </c:forEach>
               </tbody>
            </table>

            <!-- 페이지네이션 -->

            <div class="paginationButton">

               <nav aria-label="Page navigation example">
                  <ul class="pagination">
                     <li class="page-item"><a class="page-link" href="#"
                        aria-label="Previous"> <span aria-hidden="true">«</span></a></li>
                     <li class="page-item active" aria-current="page"><span
                        class="page-link">1</span></li>
                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                     <li class="page-item"><a class="page-link" href="#">...</a></li>
                     <li class="page-item"><a class="page-link" href="#">5</a></li>
                     <li class="page-item"><a class="page-link" href="#"
                        aria-label="Next"> <span aria-hidden="true">»</span></a></li>
                  </ul>
               </nav>
            </div>

<!--             <div class="d-none d-md-block"> -->
<!--                <ul class="pagination justify-content-center"> -->
<%--                   <c:choose> --%>
<%--                      <c:when test="${pageBean.prevPage <= 0 }"> --%>
<!--                         <li class="page-item disabled"><a href="#" -->
<!--                            class="page-link">이전</a></li> -->
<%--                      </c:when> --%>
<%--                      <c:otherwise> --%>
<!--                         <li class="page-item"><a -->
<%--                            href="boardmain?type_num=${type_num}&page=${pageBean.prevPage}" --%>
<!--                            class="page-link">이전</a></li> -->
<%--                      </c:otherwise> --%>
<%--                   </c:choose> --%>


<%--                   <c:forEach var='idx' begin="${pageBean.min }" --%>
<%--                      end='${pageBean.max }'> --%>
<%--                      <c:choose> --%>
<%--                         <c:when test="${idx == pageBean.currentPage }"> --%>
<!--                            <li class="page-item active"><a -->
<%--                               href="boardmain?type_num=${type_num}&page=${idx}" --%>
<%--                               class="page-link">${idx }</a></li> --%>
<%--                         </c:when> --%>
<%--                         <c:otherwise> --%>
<!--                            <li class="page-item"><a -->
<%--                               href="boardmain?type_num=${type_num}&page=${idx}" --%>
<%--                               class="page-link">${idx}</a></li> --%>
<%--                         </c:otherwise> --%>
<%--                      </c:choose> --%>

<%--                   </c:forEach> --%>

<%--                   <c:choose> --%>
<%--                      <c:when test="${pageBean.max >= pageBean.pageCnt }"> --%>
<!--                         <li class="page-item disabled"><a href="#" -->
<!--                            class="page-link">다음</a></li> -->
<%--                      </c:when> --%>
<%--                      <c:otherwise> --%>
<!--                         <li class="page-item"><a -->
<%--                            href="boardmain?type_num=${type_num}&page=${pageBean.nextPage}" --%>
<!--                            class="page-link">다음</a></li> -->
<%--                      </c:otherwise> --%>
<%--                   </c:choose> --%>

<!--                </ul> -->
<!--             </div> -->


<!--          </div> -->
<!--       </div> -->
<!--    </div> -->

   <!-- bottom  -->
   <%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>

</body>
</html>




