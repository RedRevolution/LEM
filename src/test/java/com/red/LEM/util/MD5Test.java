package com.red.LEM.util;

import org.junit.Test;

import static com.red.LEM.util.MD5.md5;
import static org.junit.Assert.*;

public class MD5Test {

    @Test
    public void testmd5() {
        try {
            System.out.println(md5("123456"));
            System.out.println(md5("123456"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}