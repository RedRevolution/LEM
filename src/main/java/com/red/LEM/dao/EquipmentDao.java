package com.red.LEM.dao;

import com.red.LEM.entity.Equipment;

import java.util.List;

public interface EquipmentDao {
    int getTotal();
    void addEquipment(Equipment equipment);
    void deleteEquipment(String eId);
    List<Equipment> list(int start,int count);
    String findMaxId(String lName);
    int getTotalPlus(String type,String val);
    List<Equipment> listPlus(String type,String val,int start,int count);
}
