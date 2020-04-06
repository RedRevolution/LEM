package com.red.LEM.util;

import org.junit.Test;

import static org.junit.Assert.*;

public class ChineseUtilTest {
    ChineseUtil cu = new ChineseUtil();

    @Test
    public void getAllFirstLetter() {
        System.out.println(cu.getAllFirstLetter("啊大大",2));
    }

    @Test
    public void getFirstLetter() {
    }
}