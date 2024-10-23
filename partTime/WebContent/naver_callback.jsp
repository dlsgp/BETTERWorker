<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %> <!-- JSON 처리 라이브러리 추가 -->

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>네이버 로그인</title>
</head>
<body>
<%
    String clientId = "o6s2ePpRDhsOFtMBao23"; // 본인의 클라이언트 ID
    String clientSecret = "IV5ZX3bLpZ"; // 본인의 클라이언트 시크릿
    String code = request.getParameter("code");
    String state = request.getParameter("state");

    // 액세스 토큰 요청 URL
    StringBuffer apiURL = new StringBuffer();
    apiURL.append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&");
    apiURL.append("client_id=" + clientId);
    apiURL.append("&client_secret=" + clientSecret);
    apiURL.append("&code=" + code);
    apiURL.append("&state=" + state);

    String access_token = "";
    String refresh_token = "";

    try {
        URL url = new URL(apiURL.toString()); // apiURL.toString()으로 수정
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();

        BufferedReader br;
        if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        String inputLine;
        StringBuffer res = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            res.append(inputLine);
        }
        br.close();

        if (responseCode == 200) {
            JSONObject jsonObj = new JSONObject(res.toString()); // JSON 파싱
            access_token = jsonObj.getString("access_token");
            refresh_token = jsonObj.getString("refresh_token");

            // 여기서 access_token을 사용하여 사용자 정보를 요청할 수 있습니다.
            // 사용자 정보 요청 코드 추가 가능
        } else {
            // 에러 처리 추가 가능
            out.println("<h3>인증 실패: " + res.toString() + "</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>오류 발생: " + e.getMessage() + "</h3>");
    }
%>
</body>
</html>
