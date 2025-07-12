<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssqANDymx.model.Doctor" %>
<%@ page import="com.ssqANDymx.model.Registration" %>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    Registration patient = (Registration) request.getAttribute("patient");
%>
<!DOCTYPE html>
<html>
<head>
    <title>叫号页面</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>医院门诊排队叫号系统 - 叫号</h1>
        <div class="doctor-info">
            <span>当前医生: <%= doctor.getDoctorName() %> (<%= doctor.getDepartment() %> - <%= doctor.getTitle() %>)</span>
            <a href="<%= request.getContextPath() %>/doctor/call">返回</a>
        </div>
    </header>

    <div class="content">
        <div class="call-panel">
            <h2>正在呼叫患者</h2>
            <div class="patient-info">
                <p><strong>患者姓名:</strong> <%= patient.getPatientName() %>
                </p>
                <p><strong>性别:</strong> <%= patient.getGender() %>
                </p>
                <p><strong>年龄:</strong> <%= patient.getAge() %>
                </p>
                <p><strong>优先级:</strong>
                    <% if (patient.getPriority() == 1) { %>
                    普通
                    <% }
                    else if (patient.getPriority() == 2) { %>
                    急诊
                    <% }
                    else if (patient.getPriority() == 3) { %>
                    优先
                    <% } %>
                </p>
                <p><strong>挂号时间:</strong> <%= patient.getRegisterTime() %>
                </p>
            </div>

            <div class="call-actions">
                <form action="<%= request.getContextPath() %>/doctor/call" method="post">
                    <input type="hidden" name="registerId" value="<%= patient.getRegisterId() %>">
                    <input type="hidden" name="doctorId" value="<%= doctor.getDoctorId() %>">
                    <button type="submit" class="btn-confirm">确认就诊</button>
                </form>

                <form action="<%= request.getContextPath() %>/doctor/recall" method="post">
                    <input type="hidden" name="registerId" value="<%= patient.getRegisterId() %>">
                    <input type="hidden" name="doctorId" value="<%= doctor.getDoctorId() %>">
                    <button type="submit" class="btn-recall">重新呼叫</button>
                </form>

                <button onclick="location.href='<%= request.getContextPath() %>/doctor/transfer?registerId=<%= patient.getRegisterId() %>'"
                        class="btn-transfer">转号
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>