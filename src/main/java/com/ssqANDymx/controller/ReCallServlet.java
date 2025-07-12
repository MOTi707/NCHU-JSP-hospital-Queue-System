package com.ssqANDymx.controller;

import com.ssqANDymx.dao.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/doctor/recall")
public class ReCallServlet extends HttpServlet {
    private RegistrationDAO registrationDAO;

    @Override
    public void init () throws ServletException {
        super.init();
        registrationDAO = new RegistrationDAO();
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerId = request.getParameter("registerId");
        String doctorId = request.getParameter("doctorId");

        try {
            // 更新挂号状态为已签到(重新回到队列)
            registrationDAO.updateRegistrationStatus(registerId, 1);
            // 添加重呼记录
            registrationDAO.addCallRecord(registerId, 2, doctorId, null);

            response.sendRedirect(request.getContextPath() + "/doctor/call");
        }
        catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}