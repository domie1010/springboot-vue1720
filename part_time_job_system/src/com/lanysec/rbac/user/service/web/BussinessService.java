package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Bussiness;

public interface BussinessService {
    public List<Bussiness> getBussinessList(int startNum,int page);
    public int addBussiness(Bussiness bussiness);
    public int updateBussiness(Bussiness bussiness);
    public int deleteBussinessByIsbn(String bussinessId);
    public int getCount();
    public Bussiness getSignalBussinessyIsbn(String bussinessId);

}
