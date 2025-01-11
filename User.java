package com.example.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String username;
    private String password;
    private Authority authority; // Role pengguna

    // Constructor
    public User(String username, String password, Authority authority) {
        this.username = username;
        this.password = password;
        this.authority = authority;
    }

    // Getter dan Setter
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Authority getAuthority() {
        return authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

    // Method tambahan
    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authority=" + authority +
                '}';
    }

    public boolean hasRole(String role) {
        return this.authority != null && this.authority.getRole().equalsIgnoreCase(role);
    }

    // Static method to initialize example users
    public static List<User> initializeUsers() {
        // Authority Definitions
        Authority adminAuthority = new Authority("ADMIN", "Administrator of the system");
        Authority schoolAuthority = new Authority("SCHOOL", "School management user");
        Authority studentAuthority = new Authority("STUDENT", "Regular student user");

        // User Definitions
        List<User> users = new ArrayList<>();
        users.add(new User("admin", "admin123", adminAuthority));
        users.add(new User("school", "school123", schoolAuthority));
        users.add(new User("student", "student123", studentAuthority));

        return users;
    }

    // Main method for testing
    public static void main(String[] args) {
        // Initialize users
        List<User> users = User.initializeUsers();

        // Print all users
        System.out.println("Initialized Users:");
        for (User user : users) {
            System.out.println(user);
        }

        // Role Verification
        System.out.println("\nRole Verifications:");
        for (User user : users) {
            System.out.println(user.getUsername() + " is " + user.getAuthority().getRole() + ": " +
                    user.hasRole(user.getAuthority().getRole()));
        }
    }
}
