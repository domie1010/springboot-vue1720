package com.lanysec.rbac.user.dao.web;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.User;

public interface UserDao {
    /**
     *
     * FunName: login
     * Description : 通过账号和密码获取用信息
     * @param：
     *      string account 账号
     * @param：
     *      string password 密码,需要进行加密
     * @return User对象或者null
     *
     * @Author: pangsir
     * @Create Date: 2016-10-12
     */
    public User login(@Param("account") String account,@Param("password") String password);
    public boolean modifyUserPass(@Param("account") String account,@Param("password") String password);
    public int addUser(@Param("user") User user);
    public User getSignalUser(@Param("account") String account);
}