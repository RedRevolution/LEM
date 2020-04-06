package com.red.LEM.controller;

import com.red.LEM.entity.Equipment;
import com.red.LEM.entity.User;
import com.red.LEM.service.EquipmentService;
import com.red.LEM.util.ChineseUtil;
import com.red.LEM.util.MD5;
import com.red.LEM.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    @RequestMapping("/addEquipment")
    public String toAddEquipment() {
        return "addEquipment";
    }

    @RequestMapping(value = "action_addEquipment", method = RequestMethod.POST)
    @ResponseBody
    public int addEquipment(String eName, String lName, String pName) {
        Equipment equipment = new Equipment();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String createTime = dtf.format(LocalDateTime.now());
        equipment.seteName(eName);
        equipment.setlName(lName);
        equipment.setpName(pName);
        equipment.setCreateTime(createTime);
        equipmentService.addEquipment(equipment);
        return 1;
    }

    @RequestMapping("/deleteEquipment")
    public String deleteEquipment(String eId) {
        equipmentService.deleteEquipment(eId);
        return "redirect:listEquipment";
    }

    @RequestMapping("/listEquipment")
    public String listEquipment(HttpServletRequest request) {
        String type = request.getParameter("type");
        String val = request.getParameter("val");
        if (type == null||type == "") {
            type = "0";
            val = "0";
        }

        // 获取分页参数
        int start = 0;
        int count = 10;

        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
        }

        Page page = new Page(start, count);

        List<Equipment> equipments;
        equipments = equipmentService.list(type, val, page.getStart(), page.getCount());
        int total = equipmentService.getTotal(type, val);
        page.setTotal(total);

        request.setAttribute("type", type);
        request.setAttribute("val", val);
        request.setAttribute("equipments", equipments);
        request.setAttribute("page", page);

        return "listEquipment";
    }
}
