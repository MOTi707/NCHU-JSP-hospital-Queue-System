package com.ssqANDymx.model;

public class Doctor {
    private String doctorId;
    private String doctorName;
    private String department;
    private String title;

    // Getters and Setters
    public String getDoctorId () {
        return doctorId;
    }

    public void setDoctorId (String doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName () {
        return doctorName;
    }

    public void setDoctorName (String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDepartment () {
        return department;
    }

    public void setDepartment (String department) {
        this.department = department;
    }

    public String getTitle () {
        return title;
    }

    public void setTitle (String title) {
        this.title = title;
    }
}