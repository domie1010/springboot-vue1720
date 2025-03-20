package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Client;

public interface ClientDao {
    public List<Client> getClientList(@Param("startNum")int startNum,@Param("page")int page);
    public int addClient(@Param("client")Client client);
    public int updateClient(@Param("client")Client client);
    public int deleteClientByIsbn(@Param("clientIsbn")String clientIsbn);
    public int getCount();
    public Client getSignalClientByIsbn(@Param("clientIsbn")String clientIsbn);
}
