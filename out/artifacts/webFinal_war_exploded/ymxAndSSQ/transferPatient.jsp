<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssqANDymx.model.Doctor" %>
<%@ page import="java.util.List" %>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    String registerId = request.getParameter("registerId");
    String patientName = request.getParameter("patientName");
    List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>转号页面</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>医院门诊排队叫号系统 - 转号</h1>
        <div class="doctor-info">
            <span>当前医生: <%= doctor.getDoctorName() %> (<%= doctor.getDepartment() %> - <%= doctor.getTitle() %>)</span>
            <a href="<%= request.getContextPath() %>/doctor/call">返回</a>
        </div>
    </header>

    <div class="content">
        <div class="transfer-panel">
            <h2>患者转号</h2>

            <% if (message != null && !message.isEmpty()) { %>
            <div class="alert success"><%= message %>
            </div>
            <% } %>

            <% if (error != null && !error.isEmpty()) { %>
            <div class="alert error"><%= error %>
            </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/doctor/transfer" method="post">
                <input type="hidden" name="registerId" value="<%= registerId %>">
                <input type="hidden" name="fromDoctorId" value="<%= doctor.getDoctorId() %>">

                <div class="form-group">
                    <label for="patientName">患者姓名:</label>
                    <input type="text" id="patientName" value="<%= patientName %>" readonly>
                </div>

                <div class="form-group">
                    <label for="toDoctorId">转至医生:</label>
                    <select id="toDoctorId" name="toDoctorId" required>
                        <option value="">--请选择医生--</option>
                        <% if (doctors != null) {
                            for (Doctor doc : doctors) { %>
                        <option value="<%= doc.getDoctorId() %>">
                            <%= doc.getDoctorName() %> (<%= doc.getDepartment() %> - <%= doc.getTitle() %>)
                        </option>
                        <% }
                        } %>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">确认转号</button>
                    <button type="button" class="btn-cancel"
                            onclick="location.href='<%= request.getContextPath() %>/doctor/call'">取消
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>