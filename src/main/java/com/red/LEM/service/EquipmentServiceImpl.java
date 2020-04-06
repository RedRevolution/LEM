package com.red.LEM.service;

import com.red.LEM.dao.EquipmentDao;
import com.red.LEM.entity.Equipment;
import com.red.LEM.util.Allocate;
import com.red.LEM.util.ChineseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    EquipmentDao equipmentDao;

    @Override
    public int getTotal(String type, String val) {
        String value = "%"+ val + "%";
        if(type == null)return equipmentDao.getTotal();
        else return equipmentDao.getTotalPlus(type,value);
    }

    @Override
    public void addEquipment(Equipment equipment) {
        String maxId = equipmentDao.findMaxId(equipment.getlName());
        if(maxId != null){
            equipment.seteId(Allocate.allocateId(maxId));
        } else{
            ChineseUtil cu = new ChineseUtil();
            //实验室前四个字拼音首字母大写
            String lab = cu.getAllFirstLetter(equipment.getlName(),4);
            String id = "00001";
            equipment.seteId(lab+id);
        }
        equipmentDao.addEquipment(equipment);
    }

    @Override
    public void deleteEquipment(String eId) {
        equipmentDao.deleteEquipment(eId);
    }

    @Override
    public List<Equipment> list(String type, String val, int start, int count) {
        String value = "%"+ val + "%";
        if(type == null)return equipmentDao.list(start,count);
        else return equipmentDao.listPlus(type,value,start,count);
    }

}
