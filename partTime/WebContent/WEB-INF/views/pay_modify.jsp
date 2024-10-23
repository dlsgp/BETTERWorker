<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>급여 상세보기</title>
<link rel="stylesheet" href="css/mypage_pay.css" />
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet" />
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
   rel="stylesheet" />

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <div class="container d-flex justify-content-center">
      <div class="col-md-8">
         <div class="text-left mb-4 mt-2">
            <h1>급여 상세보기</h1>
         </div>

         <div class="row">

            <div class="col-md-12">
               <form action="pay_key" method="post">
                  <div class="form-group search-container text-right">
                     <input name="key" class="form-search" type="text"
                        placeholder="아이디 검색" />
                     <button class="btn btn-outline-dark" type="submit">Search</button>
                  </div>
               </form>

            </div>
            <div class="col-md-12">
               <form action="payModify_pro" method="post">
                  <c:forEach var="commutePay" items="${commutePayList}">
                     <div class="form-group">
                        <label for="pay">근무 시간</label>
                        <div class="d-flex align-items-center">
                           <input type="text" class="form-control" name="workIn"
                              value="${commutePay.workIn}" /> ~ <input type="text"
                              class="form-control" name="workOut"
                              value="${commutePay.workOut}" /> <input type="hidden"
                              class="form-control" name="commute_num"
                              value="${commutePay.commute_num}" />
                 
                        </div>
                     </div>
                     <button type="submit" class="btn btn-primary">수정하기</button>
                  </c:forEach>


               </form>

            </div>



         </div>
      </div>
   </div>
</body>
</html>