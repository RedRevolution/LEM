package com.red.LEM.dao;

import com.red.LEM.entity.Equipment;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
        Equipment tmp = new Equipment();
        tmp.seteName("e");
        tmp.setpName("d");
        tmp.setlName("c");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String createTime = dtf.format(LocalDateTime.now());
        tmp.setCreateTime(createTime);

        equipmentDao.addEquipment(tmp);

        System.out.println(equipmentDao.getTotal());
    }

}