package com.red.LEM.dao;

import com.red.LEM.entity.Equipment;

import java.util.List;

public interface EquipmentDao {
    int getTotal();
    void addEquipment(Equipment equipment);
    List<Equipment> list(int start,int count);
}
