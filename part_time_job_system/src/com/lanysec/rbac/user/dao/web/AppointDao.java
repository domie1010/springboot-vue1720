package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Appoint;

public interface AppointDao {
    public List<Appoint> getAppointList(@Param("startNum")int startNum,@Param("page")int page);
    public int addAppoint(@Param("appoint")Appoint appoint);
    public int updateAppoint(@Param("appoint")Appoint appoint);
    public int deleteAppointByIsbn(@Param("appointId")String appointId);
    public int getCount();
    public Appoint getSignalAppointById(@Param("appointId")String appointId);
    public List<Appoint> getClientAppointList(@Param("acceptAccount")String appointId,@Param("startNum")int startNum,@Param("page")int page);
    public List<Appoint> getBussinessAppointList(@Param("postAccount")String postAccount,@Param("startNum")int startNum,@Param("page")int page);
    public int updateBussinessAppointAssment(@Param("appoint")Appoint appoint);
    public int updateClientAppointAssment(@Param("appoint")Appoint appoint);
    public List<Appoint> getAppointListByStatus(@Param("appointStatus")String appointStatus,@Param("startNum")int startNum,@Param("page")int page);
    
}
