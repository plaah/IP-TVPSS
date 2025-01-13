package com.example.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;

@Entity
@Table(name = "users")
public class User implements UserDetails, Serializable { // Tambahkan Serializable
    private static final long serialVersionUID = 1L; // Deklarasikan serialVersionUID

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @ManyToOne
    @JoinColumn(name = "authority_id", nullable = false)
    private Authority authority; // Role pengguna

    // Constructor
    public User(String username, String password, Authority authority) {
        this.username = username;
        this.password = password;
        this.authority = authority;
    }

    // Default constructor required by JPA
    public User() {
    }

    // Getter dan Setter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
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
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authority=" + authority +
                '}';
    }

    public boolean hasRole(String role) {
        return this.authority != null && this.authority.getRole().equalsIgnoreCase(role);
    }

    // Implementasi metode dari UserDetails
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Konversi role dari Authority ke GrantedAuthority
        return Collections.singleton(new SimpleGrantedAuthority(authority.getRole()));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // Sesuaikan dengan kebutuhan
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // Sesuaikan dengan kebutuhan
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // Sesuaikan dengan kebutuhan
    }

    @Override
    public boolean isEnabled() {
        return true; // Sesuaikan dengan kebutuhan
    }
}