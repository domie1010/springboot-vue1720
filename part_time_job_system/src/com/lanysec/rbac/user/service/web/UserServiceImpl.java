package com.lanysec.rbac.user.service.web;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.UserDao;
import com.lanysec.rbac.user.model.web.User;
@Service
public class UserServiceImpl implements UserService  {
    private Logger logger = Logger.getLogger(UserServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public User login(String account , String password ) {
        try{
            this.sqlSession = MyBatisUtils.getSqlSession();
            System.out.println();
            User user = this.sqlSession.getMapper(UserDao.class).login(account , password);//接口代理
            if(user==null){
                throw new RuntimeException("账号或者密码错误,请重新输入");
            }else{
                return user;
            }
        }catch(Exception e){
            System.out.println("信息异常");
            this.logger.error("登录异常,原因为:"+e.getMessage());
            throw new RuntimeException("登录异常,原因为:"+e.getMessage());
            
        }
    }
    @Override
    public boolean modifyUserPass(String account , String password ) {
        boolean tag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        tag = this.sqlSession.getMapper(UserDao.class).modifyUserPass(account , password);
        this.sqlSession.commit();
        this.sqlSession.close();
        return tag;
    }
    @Override
    public int addUser(User user ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int tag = this.sqlSession.getMapper(UserDao.class).addUser(user);
        this.sqlSession.commit();
        this.sqlSession.close();
        return tag;
    }
    @Override
    public User getSignalUser(String account ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        System.out.println();
        User user = this.sqlSession.getMapper(UserDao.class).getSignalUser(account);//接口代理
        return user;
    }
    
}
