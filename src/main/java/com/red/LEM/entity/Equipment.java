package com.red.LEM.entity;

public class Equipment {
    private int id;
    private String eName;
    private String lName;
    private String pName;
    private String createTime;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getId() {
        return id;
    }

    public String geteName() {
        return eName;
    }

    public String getlName() {
        return lName;
    }

    public String getpName() {
        return pName;
    }

}
