package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Client;

public interface ClientService {
    public List<Client> getClientList(int startNum,int page);
    public int addClient(Client client);
    public int updateClient(Client client);
    public int deleteClientByIsbn(String clientIsbn);
    public int getCount();
    public Client getSignalClientByIsbn(String clientIsbn);

}
