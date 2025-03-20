package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Bussiness;

public interface BussinessDao {
    public List<Bussiness> getBussinessList(@Param("startNum")int startNum,@Param("page")int page);
    public int addBussiness(@Param("bussiness")Bussiness bussiness);
    public int updateBussiness(@Param("bussiness")Bussiness bussiness);
    public int deleteBussinessByIsbn(@Param("bussinessId")String bussinessId);
    public int getCount();
    public Bussiness getSignalBussinessyIsbn(@Param("bussinessId")String bussinessId);

}
