package com.example.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "programs")
public class Program {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "school_id", nullable = false)
    private String schoolId;

    @Column(name = "school_name", nullable = false)
    private String schoolName;

    @Column(name = "program_name", nullable = false)
    private String programName;

    @Column(name = "program_description", nullable = false)
    private String programDescription;

    @Column(name = "program_date")
    @Temporal(TemporalType.DATE)
    private Date programDate;

    // Default constructor (required by JPA)
    public Program() {
    }

    // Constructor with parameters
    public Program(String schoolId, String schoolName, String programName, String programDescription) {
        this.schoolId = schoolId;
        this.schoolName = schoolName;
        this.programName = programName;
        this.programDescription = programDescription;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramDescription() {
        return programDescription;
    }

    public void setProgramDescription(String programDescription) {
        this.programDescription = programDescription;
    }

    public Date getProgramDate() {
        return programDate;
    }

    public void setProgramDate(Date programDate) {
        this.programDate = programDate;
    }

    // Override toString() for debugging purposes
    @Override
    public String toString() {
        return "Program{" +
                "id=" + id +
                ", schoolId='" + schoolId + '\'' +
                ", schoolName='" + schoolName + '\'' +
                ", programName='" + programName + '\'' +
                ", programDescription='" + programDescription + '\'' +
                ", programDate=" + programDate +
                '}';
    }
}