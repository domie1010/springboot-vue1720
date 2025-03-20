package com.lanysec.rbac.user.model.web;

public class Appoint {
    private int id;
    private String appointId;
    private String appointContent;
    private String appointTime;
    private String appointStatus;
    private String acceptAccount;
    private String postAccount;
    private String clientAssment;
    private String businessAssment;
    public int getId() {
        return this.id;
    }
    public void setId(int id ) {
        this.id = id;
    }
    public String getAppointId() {
        return this.appointId;
    }
    public void setAppointId(String appointId ) {
        this.appointId = appointId;
    }
    public String getAppointContent() {
        return this.appointContent;
    }
    public void setAppointContent(String appointContent ) {
        this.appointContent = appointContent;
    }
    public String getAppointTime() {
        return this.appointTime;
    }
    public void setAppointTime(String appointTime ) {
        this.appointTime = appointTime;
    }
    public String getAppointStatus() {
        return this.appointStatus;
    }
    public void setAppointStatus(String appointStatus ) {
        this.appointStatus = appointStatus;
    }
    public String getAcceptAccount() {
        return this.acceptAccount;
    }
    public void setAcceptAccount(String acceptAccount ) {
        this.acceptAccount = acceptAccount;
    }
    public String getPostAccount() {
        return this.postAccount;
    }
    public void setPostAccount(String postAccount ) {
        this.postAccount = postAccount;
    }
    public String getClientAssment() {
        return this.clientAssment;
    }
    public void setClientAssment(String clientAssment ) {
        this.clientAssment = clientAssment;
    }
    public String getBusinessAssment() {
        return this.businessAssment;
    }
    public void setBusinessAssment(String businessAssment ) {
        this.businessAssment = businessAssment;
    }
    @Override
    public String toString() {
        return "Appoint [id=" + this.id + ", appointId=" + this.appointId + ", appointContent=" + this.appointContent
                + ", appointTime=" + this.appointTime + ", appointStatus=" + this.appointStatus + ", acceptAccount="
                + this.acceptAccount + ", postAccount=" + this.postAccount + ", clientAssment=" + this.clientAssment
                + ", businessAssment=" + this.businessAssment + "]";
    }

}
