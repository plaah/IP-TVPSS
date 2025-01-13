package com.example.service;

import com.example.dao.EquipmentDAO;
import com.example.model.Equipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EquipmentService {

    @Autowired
    private EquipmentDAO equipmentDAO;

    // Hitung total equipment
    public long countEquipment() {
        return equipmentDAO.count();
    }

    // Simpan atau perbarui equipment
    public void save(Equipment equipment) {
        equipmentDAO.save(equipment); // Simpan atau perbarui equipment
    }

    // Cari equipment berdasarkan ID
    public Equipment findById(Long id) {
        return equipmentDAO.findById(id); // Ambil equipment berdasarkan ID
    }

    // Ambil semua equipment
    public List<Equipment> findAll() {
        return equipmentDAO.findAll(); // Ambil semua equipment
    }

    // Hapus equipment berdasarkan ID
    public void deleteById(Long id) {
        equipmentDAO.deleteById(id); // Hapus equipment berdasarkan ID
    }

    // Perbarui equipment
    public void update(Equipment equipment) {
        equipmentDAO.update(equipment); // Perbarui equipment
    }
}