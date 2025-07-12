package com.ssqANDymx.controller;

import com.ssqANDymx.dao.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/doctor/transfer")
public class        TransferServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;

    @Override
    public void init () throws ServletException {
        super.init();
        registrationDAO = new RegistrationDAO();
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerId = request.getParameter("registerId");
        String fromDoctorId = request.getParameter("fromDoctorId");
        String toDoctorId = request.getParameter("toDoctorId");

        try {
            // 转号操作
            if (registrationDAO.transferPatient(registerId, fromDoctorId, toDoctorId)) {
                // 添加转号记录
                registrationDAO.addCallRecord(registerId, 3, fromDoctorId, toDoctorId);

                request.getSession().setAttribute("message", "患者转号成功");
            }
            else {
                request.getSession().setAttribute("error", "患者转号失败");
            }

            response.sendRedirect(request.getContextPath() + "/doctor/call");
        }
        catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}