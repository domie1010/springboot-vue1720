package com.lanysec.rbac.user.dao.web;

import com.lanysec.rbac.user.service.web.ClientService;
import com.lanysec.rbac.user.service.web.ClientServiceImpl;

public class Test {

    public static void main(String[] args ) {
        // TODO Auto-generated method stub
        ClientService cs=new ClientServiceImpl();
        System.out.println(cs.getSignalClientByIsbn("C1493009075781"));
    }

}
