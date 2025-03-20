package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Appoint;

public interface AppointService {
    public List<Appoint> getAppointList(int startNum,int page);
    public int addAppoint(Appoint appoint);
    public int updateAppoint(Appoint appoint);
    public int deleteAppointByIsbn(String appointId);
    public int getCount();
    public Appoint getSignalAppointById(String appointId);
    public List<Appoint> getClientAppointList(String appointId,int startNum,int page);
    public List<Appoint> getBussinessAppointList(String postAccount,int startNum,int page);
    public int updateBussinessAppointAssment(Appoint appoint);
    public int updateClientAppointAssment(Appoint appoint);
    public List<Appoint> getAppointListByStatus(String appointStatus,int startNum,int page);

}
