package com.red.LEM.dao;

import com.red.LEM.entity.Equipment;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class EquipmentDaoTest extends BaseTest  {
    @Autowired
    private EquipmentDao equipmentDao;

    @Test
    public void testgetTotal(){
        System.out.println(equipmentDao.getTotal());
    }

//    int getTotal();
//    void addEquipment(Equipment equipment);
//    List<Equipment> list(int start,int count);

    @Test
    public void testaddEquipment(){
//        System.out.println(equipmentDao.findMaxId("d"));
//        Equipment tmp = new Equipment();
//        tmp.seteId("XXX10001");
//        tmp.seteName("e");
//        tmp.setpName("d");
//        tmp.setlName("c");
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
//        String createTime = dtf.format(LocalDateTime.now());
//        tmp.setCreateTime(createTime);
//
//        equipmentDao.addEquipment(tmp);
//
//        System.out.println(equipmentDao.getTotal());
        List<Equipment> equipments = equipmentDao.listPlus("e_id","RJKF%",0,5);
        System.out.println(equipments.size());
        System.out.println(equipmentDao.getTotalPlus("e_id","RJKF%"));
    }

}