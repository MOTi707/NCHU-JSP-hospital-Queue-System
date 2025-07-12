package com.ssqANDymx.dao;

import com.ssqANDymx.model.Registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RegistrationDAO {
    // 获取医生当前待叫号的病人列表
    public List<Registration> getWaitingPatients (String doctorId) throws SQLException {
        List<Registration> patients = new ArrayList<>();
        String sql = "SELECT r.*, p.patient_name, p.gender, p.age " +
                "FROM Registration r JOIN Patient p ON r.patient_id = p.patient_id " +
                "WHERE r.doctor_id = ? AND r.status = 1 " +
                "ORDER BY r.priority DESC, r.register_time ASC";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Registration reg = new Registration();
                reg.setRegisterId(rs.getString("register_id"));
                reg.setPatientId(rs.getString("patient_id"));
                reg.setPatientName(rs.getString("patient_name"));
                reg.setGender(rs.getString("gender"));
                reg.setAge(rs.getInt("age"));
                reg.setPriority(rs.getInt("priority"));
                reg.setRegisterTime(rs.getTimestamp("register_time"));
                patients.add(reg);
            }
        }
        return patients;
    }

    // 更新挂号状态
    public boolean updateRegistrationStatus (String registerId, int status) throws SQLException {
        String sql = "UPDATE Registration SET status = ? WHERE register_id = ?";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setString(2, registerId);
            return stmt.executeUpdate() > 0;
        }
    }

    // 添加叫号记录
    public boolean addCallRecord (String registerId, int callType, String doctorId, String targetDoctorId) throws SQLException {
        String sql = "INSERT INTO CallRecord (register_id, call_time, call_type, call_doctor_id, target_doctor_id) " +
                "VALUES (?, GETDATE(), ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, registerId);
            stmt.setInt(2, callType);
            stmt.setString(3, doctorId);
            stmt.setString(4, targetDoctorId);
            return stmt.executeUpdate() > 0;
        }
    }

    // 转号操作
    public boolean transferPatient (String registerId, String fromDoctorId, String toDoctorId) throws SQLException {
        String sql = "UPDATE Registration SET doctor_id = ? WHERE register_id = ? AND doctor_id = ?";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, toDoctorId);
            stmt.setString(2, registerId);
            stmt.setString(3, fromDoctorId);
            return stmt.executeUpdate() > 0;
        }
    }
}