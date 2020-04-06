package com.red.LEM.util;

import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Allocate {
    public static String allocateId(String maxId) {
        Pattern p = Pattern.compile("([A-Z]*)([0-9]*)");
        Matcher m = p.matcher(maxId);
        m.find();

        String dp = "";
        int size = m.group(2).length();
        for (int i = 0; i < size; i++) dp += "0";

        DecimalFormat df = new DecimalFormat(dp);
        String newId = df.format(Integer.parseInt(m.group(2)) + 1);
        return m.group(1) + newId;
    }
}
