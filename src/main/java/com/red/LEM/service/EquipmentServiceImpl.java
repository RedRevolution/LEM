package com.red.LEM.service;

import com.red.LEM.dao.EquipmentDao;
import com.red.LEM.entity.Equipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    EquipmentDao equipmentDao;

    @Override
    public int getTotal() {
        return equipmentDao.getTotal();
    }

    @Override
    public void addEquipment(Equipment equipment) {
        equipmentDao.addEquipment(equipment);
    }

    @Override
    public List<Equipment> list(int start, int count) {
        return equipmentDao.list(start, count);
    }
}
