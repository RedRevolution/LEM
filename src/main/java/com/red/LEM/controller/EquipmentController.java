package com.red.LEM.controller;

import com.red.LEM.entity.Equipment;
import com.red.LEM.service.EquipmentService;
import com.red.LEM.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    @RequestMapping("/addEquipment")
    public String addEquipment(HttpServletRequest request, HttpServletResponse response){
        Equipment equipment = new Equipment();

        String eName = request.getParameter("eName");
        String lName = request.getParameter("lName");
        String pName = request.getParameter("pName");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String createTime = dtf.format(LocalDateTime.now());

        equipment.seteName(eName);
        equipment.setlName(lName);
        equipment.setpName(pName);
        equipment.setCreateTime(createTime);

        equipmentService.addEquipment(equipment);

        return "redirect:listEquipment";
    }

    @RequestMapping("/listEquipment")
    public String listEquipment(HttpServletRequest request, HttpServletResponse response) {

        // 获取分页参数
        int start = 0;
        int count = 10;

        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
        }

        Page page = new Page(start, count);

        List<Equipment> equipments = equipmentService.list(page.getStart(), page.getCount());
        int total = equipmentService.getTotal();
        page.setTotal(total);

        request.setAttribute("equipments", equipments);
        request.setAttribute("page", page);

        return "listEquipment";
    }

}
