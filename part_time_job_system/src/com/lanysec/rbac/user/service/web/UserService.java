package com.lanysec.rbac.user.service.web;

import com.lanysec.rbac.user.model.web.User;

public interface UserService {
    public User login( String account,String password);
    public boolean modifyUserPass(String account, String password);
    public int addUser(User user);
    public User getSignalUser(String account);

}
