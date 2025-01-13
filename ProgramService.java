package com.example.service;

import com.example.dao.ProgramDAO;
import com.example.model.Program;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProgramService {

    @Autowired
    private ProgramDAO programDAO;

    // Hitung total program
    public long countPrograms() {
        return programDAO.count();
    }

    // Simpan atau perbarui program
    public void save(Program program) {
        programDAO.save(program); // Simpan atau perbarui program
    }

    // Cari program berdasarkan ID
    public Program findById(Long id) {
        return programDAO.findById(id); // Ambil program berdasarkan ID
    }

    // Ambil semua program
    public List<Program> findAll() {
        return programDAO.findAll(); // Ambil semua program
    }

    // Hapus program berdasarkan ID
    public void deleteById(Long id) {
        programDAO.deleteById(id); // Hapus program berdasarkan ID
    }

    // Perbarui program
    public void update(Program program) {
        programDAO.update(program); // Perbarui program
    }
}