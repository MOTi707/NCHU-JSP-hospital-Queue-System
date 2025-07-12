package com.ssqANDymx.model;

public class Patient {
    private String patientId;
    private String patientName;
    private String gender;
    private int age;
    private String phone;

    // Getters and Setters
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

    public String getPhone () {
        return phone;
    }

    public void setPhone (String phone) {
        this.phone = phone;
    }
}