package com.example.model;

public class Authority {
    private String role; // Contoh: "ADMIN", "SCHOOL", "STUDENT"
    private String description; // Deskripsi peran

    // Constructor
    public Authority(String role, String description) {
        this.role = role;
        this.description = description;
    }

    // Getter dan Setter
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Method tambahan
    @Override
    public String toString() {
        return "Authority{" +
                "role='" + role + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
