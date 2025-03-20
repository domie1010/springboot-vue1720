package com.lanysec.rbac.user.model.web;

public class Bussiness {
    private int id;
    private String bussinessId;
    private String bussinessName;
    private String bussinessAddress;
    private String bussinessPhone;
    public int getId() {
        return this.id;
    }
    public void setId(int id ) {
        this.id = id;
    }
    public String getBussinessId() {
        return this.bussinessId;
    }
    public void setBussinessId(String bussinessId ) {
        this.bussinessId = bussinessId;
    }
    public String getBussinessName() {
        return this.bussinessName;
    }
    public void setBussinessName(String bussinessName ) {
        this.bussinessName = bussinessName;
    }
    public String getBussinessAddress() {
        return this.bussinessAddress;
    }
    public void setBussinessAddress(String bussinessAddress ) {
        this.bussinessAddress = bussinessAddress;
    }
    public String getBussinessPhone() {
        return this.bussinessPhone;
    }
    public void setBussinessPhone(String bussinessPhone ) {
        this.bussinessPhone = bussinessPhone;
    }
    @Override
    public String toString() {
        return "Bussiness [id=" + this.id + ", bussinessId=" + this.bussinessId + ", bussinessName="
                + this.bussinessName + ", bussinessAddress=" + this.bussinessAddress + ", bussinessPhone="
                + this.bussinessPhone + "]";
    }

}
