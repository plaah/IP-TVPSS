package com.example.service;

import com.example.dao.UserDAO;
import com.example.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService implements UserDetailsService { // Implementasikan UserDetailsService

    @Autowired
    private UserDAO userDAO;

    // Hitung total pengguna
    public long countUsers() {
        return userDAO.count();
    }

    // Simpan atau perbarui pengguna
    public void saveUser(User user) {
        userDAO.saveUser(user);
    }

    // Ambil semua pengguna
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    // Ambil pengguna berdasarkan username
    public User getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }

    // Perbarui pengguna
    public void updateUser(User user) {
        userDAO.updateUser(user); // Perbarui data pengguna
    }

    // Hapus pengguna
    public void deleteUser(User user) {
        userDAO.deleteUser(user); // Hapus data pengguna
    }

    // Ambil pengguna berdasarkan ID
    public User getUserById(Long id) {
        return userDAO.getUserById(id); // Ambil data pengguna berdasarkan ID
    }

    // Implementasi metode dari UserDetailsService
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.getUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        return user; // Kembalikan objek User yang mengimplementasikan UserDetails
    }
}