package com.red.LEM.service;

import com.red.LEM.entity.Equipment;

import java.util.List;

public interface EquipmentService {
    /**
     * 获取得到 equipment 的总数
     * @return
     */
    int getTotal(String type,String val);

    /**
     * 增加一条数据
     * @param equipment
     */
    void addEquipment(Equipment equipment);

    /**
     * 删除一条数据
     * @param eId
     */
    void deleteEquipment(String eId);

    /**
     * 列举出从 start 位置开始的 count 条数据
     * @param start
     * @param count
     * @return
     */
    List<Equipment> list(String type,String val,int start,int count);
}
