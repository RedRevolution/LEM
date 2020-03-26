package com.red.LEM.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Base64;

public class MD5 {
    public static String md5(String str) throws Exception{
        //获取MD5加密器（该加密器还有SHA加密）
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] input = str.getBytes();
        byte[] output = md.digest(input);

        //将md5处理的output字节数组基于Base64位编码转换为字符串
        String strMD5 = Base64.getEncoder().encodeToString(output);
        return strMD5;
    }
}
