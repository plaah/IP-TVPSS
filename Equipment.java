package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "equipment")
public class Equipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "equipment_id", nullable = false, unique = true)
    private String equipmentId;

    @Column(name = "equipment_name", nullable = false)
    private String equipmentName;

    @Column(name = "amount", nullable = false)
    private int amount;

    @Column(name = "brand", nullable = false)
    private String brand;

    @Column(name = "school_name", nullable = false)
    private String schoolName;

    // Default constructor (required by JPA)
    public Equipment() {
    }

    // Constructor with parameters
    public Equipment(String equipmentId, String equipmentName, int amount, String brand, String schoolName) {
        this.equipmentId = equipmentId;
        this.equipmentName = equipmentName;
        this.amount = amount;
        this.brand = brand;
        this.schoolName = schoolName;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(String equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    // Override toString() for debugging purposes
    @Override
    public String toString() {
        return "Equipment{" +
                "id=" + id +
                ", equipmentId='" + equipmentId + '\'' +
                ", equipmentName='" + equipmentName + '\'' +
                ", amount=" + amount +
                ", brand='" + brand + '\'' +
                ", schoolName='" + schoolName + '\'' +
                '}';
    }
}