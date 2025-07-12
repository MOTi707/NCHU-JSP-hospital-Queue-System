package com.ssqANDymx.dao;

import com.ssqANDymx.model.Doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {
    // 根据ID获取医生信息
    public Doctor getDoctorById (String doctorId) throws SQLException {
        String sql = "SELECT * FROM Doctor WHERE doctor_id = ?";
        Doctor doctor = null;

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                doctor = new Doctor();
                doctor.setDoctorId(rs.getString("doctor_id"));
                doctor.setDoctorName(rs.getString("doctor_name"));
                doctor.setDepartment(rs.getString("department"));
                doctor.setTitle(rs.getString("title"));
            }
        }
        return doctor;
    }

    // 获取所有医生列表（除当前医生外）
    public List<Doctor> getAllDoctorsExcept (String excludeDoctorId) throws SQLException {
        List<Doctor> doctors = new ArrayList<>();
        String sql = "SELECT * FROM Doctor WHERE doctor_id != ? ORDER BY department, doctor_name";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, excludeDoctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorId(rs.getString("doctor_id"));
                doctor.setDoctorName(rs.getString("doctor_name"));
                doctor.setDepartment(rs.getString("department"));
                doctor.setTitle(rs.getString("title"));
                doctors.add(doctor);
            }
        }
        return doctors;
    }

    // 获取科室医生列表
    public List<Doctor> getDoctorsByDepartment (String department) throws SQLException {
        List<Doctor> doctors = new ArrayList<>();
        String sql = "SELECT * FROM Doctor WHERE department = ? ORDER BY doctor_name";

        try (Connection conn = DBConnection.getConnection() ;
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, department);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorId(rs.getString("doctor_id"));
                doctor.setDoctorName(rs.getString("doctor_name"));
                doctor.setDepartment(rs.getString("department"));
                doctor.setTitle(rs.getString("title"));
                doctors.add(doctor);
            }
        }
        return doctors;
    }
}