package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.AppointDao;
import com.lanysec.rbac.user.model.web.Appoint;
@Service
public class AppointServiceImpl implements AppointService {
    private Logger logger = Logger.getLogger(AppointServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<Appoint> getAppointList(int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Appoint> list= this.sqlSession.getMapper(AppointDao.class).getAppointList(startNum , page);//接口代理
        return list;
    }

    @Override
    public int addAppoint(Appoint appoint ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).addAppoint(appoint);//接口代理
        this.sqlSession.commit();
        return count;
    }

    @Override
    public int updateAppoint(Appoint appoint ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).updateAppoint(appoint);//接口代理
        this.sqlSession.commit();
        return count;
    }

    @Override
    public int deleteAppointByIsbn(String appointId ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).deleteAppointByIsbn(appointId);//接口代理
        this.sqlSession.commit();
        return count;
    }

    @Override
    public int getCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).getCount();//接口代理
        return count;
    }

    @Override
    public Appoint getSignalAppointById(String appointId ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Appoint appoint= this.sqlSession.getMapper(AppointDao.class).getSignalAppointById(appointId);//接口代理
        return appoint;
    }

    @Override
    public List<Appoint> getClientAppointList(String appointId , int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Appoint> list= this.sqlSession.getMapper(AppointDao.class).getClientAppointList(appointId , startNum , page);//接口代理
        return list;
    }

    @Override
    public List<Appoint> getBussinessAppointList(String postAccount , int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Appoint> list= this.sqlSession.getMapper(AppointDao.class).getBussinessAppointList(postAccount , startNum , page);//接口代理
        return list;
    }

    @Override
    public int updateBussinessAppointAssment(Appoint appoint ) {
        // TODO Auto-generated method stub
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).updateBussinessAppointAssment(appoint);//接口代理
        this.sqlSession.commit();
        return count;
    }

    @Override
    public int updateClientAppointAssment(Appoint appoint ) {
        // TODO Auto-generated method stub
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(AppointDao.class).updateClientAppointAssment(appoint);//接口代理
        this.sqlSession.commit();
        return count;
    }

    @Override
    public List<Appoint> getAppointListByStatus(String appointStatus , int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Appoint> list= this.sqlSession.getMapper(AppointDao.class).getAppointListByStatus(appointStatus , startNum , page);//接口代理
        return list;
    }

}
