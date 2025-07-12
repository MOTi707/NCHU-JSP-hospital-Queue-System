package com.ssqANDymx.controller;

import com.ssqANDymx.dao.DoctorDAO;
import com.ssqANDymx.dao.RegistrationDAO;
import com.ssqANDymx.model.Doctor;
import com.ssqANDymx.model.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/doctor/call")
public class DoctorCallServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;
    private DoctorDAO doctorDAO;

    @Override
    public void init () throws ServletException {
        super.init();
        registrationDAO = new RegistrationDAO();
        doctorDAO = new DoctorDAO();
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Doctor doctor = (Doctor) session.getAttribute("currentDoctor");

        if (doctor == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            List<Registration> waitingPatients = registrationDAO.getWaitingPatients(doctor.getDoctorId());
            request.setAttribute("waitingPatients", waitingPatients);
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("/doctor/doctorHome.jsp").forward(request, response);
        }
        catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerId = request.getParameter("registerId");
        String doctorId = request.getParameter("doctorId");

        try {
            // 更新挂号状态为已就诊
            registrationDAO.updateRegistrationStatus(registerId, 2);
            // 添加叫号记录
            registrationDAO.addCallRecord(registerId, 1, doctorId, null);

            response.sendRedirect(request.getContextPath() + "/doctor/call");
        }
        catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}