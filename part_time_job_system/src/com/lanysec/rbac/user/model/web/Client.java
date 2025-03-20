package com.lanysec.rbac.user.model.web;

public class Client {
    private String clientIsbn;
    private String clientName;
    private String clientSex;
    private String clientAge;
    public String getClientIsbn() {
        return this.clientIsbn;
    }
    public void setClientIsbn(String clientIsbn ) {
        this.clientIsbn = clientIsbn;
    }
    public String getClientName() {
        return this.clientName;
    }
    public void setClientName(String clientName ) {
        this.clientName = clientName;
    }
    public String getClientSex() {
        return this.clientSex;
    }
    public void setClientSex(String clientSex ) {
        this.clientSex = clientSex;
    }
    public String getClientAge() {
        return this.clientAge;
    }
    public void setClientAge(String clientAge ) {
        this.clientAge = clientAge;
    }
    @Override
    public String toString() {
        return "Client [clientIsbn=" + this.clientIsbn + ", clientName=" + this.clientName + ", clientSex="
                + this.clientSex + ", clientAge=" + this.clientAge + "]";
    }

}
