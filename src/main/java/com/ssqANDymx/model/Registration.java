package com.ssqANDymx.model;

import java.sql.Timestamp;

public class Registration {
    private String registerId;
    private String patientId;
    private String patientName;
    private String gender;
    private int age;
    private String doctorId;
    private Timestamp registerTime;
    private int priority;
    private int status;

    // Getters and Setters
    public String getRegisterId () {
        return registerId;
    }

    public void setRegisterId (String registerId) {
        this.registerId = registerId;
    }

    public String getPatientId () {
        return patientId;
    }

    public void setPatientId (String patientId) {
        this.patientId = patientId;
    }

    public String getPatientName () {
        return patientName;
    }

    public void setPatientName (String patientName) {
        this.patientName = patientName;
    }

    public String getGender () {
        return gender;
    }

    public void setGender (String gender) {
        this.gender = gender;
    }

    public int getAge () {
        return age;
    }

    public void setAge (int age) {
        this.age = age;
    }

    public String getDoctorId () {
        return doctorId;
    }

    public void setDoctorId (String doctorId) {
        this.doctorId = doctorId;
    }

    public Timestamp getRegisterTime () {
        return registerTime;
    }

    public void setRegisterTime (Timestamp registerTime) {
        this.registerTime = registerTime;
    }

    public int getPriority () {
        return priority;
    }

    public void setPriority (int priority) {
        this.priority = priority;
    }

    public int getStatus () {
        return status;
    }

    public void setStatus (int status) {
        this.status = status;
    }
}