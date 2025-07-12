<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssqANDymx.model.Doctor" %>
<%@ page import="com.ssqANDymx.model.Registration" %>
<%@ page import="java.util.List" %>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    List<Registration> waitingPatients = (List<Registration>) request.getAttribute("waitingPatients");
%>
<!DOCTYPE html>
<html>
<head>
    <title>医生工作站</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container">
    <header class="header">
        <h1>医院门诊排队叫号系统</h1>
        <div class="doctor-info">
            <span>当前医生: <%= doctor.getDoctorName() %> (<%= doctor.getDepartment() %> - <%= doctor.getTitle() %>)</span>
            <a href="<%= request.getContextPath() %>/logout">退出</a>
        </div>
    </header>

    <div class="content">
        <div class="queue-panel">
            <h2>当前候诊患者</h2>
            <table>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>患者姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>优先级</th>
                    <th>挂号时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <% if (waitingPatients != null && !waitingPatients.isEmpty()) {
                    for (int i = 0 ; i < waitingPatients.size() ; i++) {
                        Registration patient = waitingPatients.get(i); %>
                <tr>
                    <td><%= i + 1 %>
                    </td>
                    <td><%= patient.getPatientName() %>
                    </td>
                    <td><%= patient.getGender() %>
                    </td>
                    <td><%= patient.getAge() %>
                    </td>
                    <td>
                        <% if (patient.getPriority() == 1) { %>
                        普通
                        <% }
                        else if (patient.getPriority() == 2) { %>
                        急诊
                        <% }
                        else if (patient.getPriority() == 3) { %>
                        优先
                        <% } %>
                    </td>
                    <td><%= patient.getRegisterTime() %>
                    </td>
                    <td>
                        <form action="<%= request.getContextPath() %>/doctor/call" method="post"
                              style="display: inline;">
                            <input type="hidden" name="registerId" value="<%= patient.getRegisterId() %>">
                            <input type="hidden" name="doctorId" value="<%= doctor.getDoctorId() %>">
                            <button type="submit" class="btn-call">叫号</button>
                        </form>
                        <form action="<%= request.getContextPath() %>/doctor/recall" method="post"
                              style="display: inline;">
                            <input type="hidden" name="registerId" value="<%= patient.getRegisterId() %>">
                            <input type="hidden" name="doctorId" value="<%= doctor.getDoctorId() %>">
                            <button type="submit" class="btn-recall">重呼</button>
                        </form>
                        <button onclick="showTransferDialog('<%= patient.getRegisterId() %>', '<%= patient.getPatientName() %>')"
                                class="btn-transfer">转号
                        </button>
                    </td>
                </tr>
                <% }
                }
                else { %>
                <tr>
                    <td colspan="7" style="text-align: center;">暂无候诊患者</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 转号对话框 -->
<div id="transferDialog" class="dialog">
    <div class="dialog-content">
        <span class="close" onclick="hideTransferDialog()">&times;</span>
        <h3>患者转号</h3>
        <form id="transferForm" action="<%= request.getContextPath() %>/doctor/transfer" method="post">
            <input type="hidden" id="transferRegisterId" name="registerId">
            <input type="hidden" name="fromDoctorId" value="<%= doctor.getDoctorId() %>">
            <div class="form-group">
                <label for="patientName">患者姓名:</label>
                <input type="text" id="patientName" readonly>
            </div>
            <div class="form-group">
                <label for="toDoctorId">转至医生:</label>
                <select id="toDoctorId" name="toDoctorId" required>
                    <option value="">--请选择医生--</option>
                    <!-- 这里需要通过AJAX加载其他医生列表 -->
                </select>
            </div>
            <button type="submit" class="btn-submit">确认转号</button>
        </form>
    </div>
</div>

<script src="<%= request.getContextPath() %>/js/script.js"></script>
</body>
</html>