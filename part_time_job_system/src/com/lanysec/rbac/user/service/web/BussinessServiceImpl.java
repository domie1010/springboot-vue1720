package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.BussinessDao;
import com.lanysec.rbac.user.model.web.Bussiness;
@Service
public class BussinessServiceImpl implements BussinessService {
    private Logger logger = Logger.getLogger(BussinessServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<Bussiness> getBussinessList(int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Bussiness> list= this.sqlSession.getMapper(BussinessDao.class).getBussinessList(startNum , page);//接口代理
        return list;
    }
    
    @Override
    public int addBussiness(Bussiness bussiness ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(BussinessDao.class).addBussiness(bussiness);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int updateBussiness(Bussiness bussiness ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(BussinessDao.class).updateBussiness(bussiness);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int deleteBussinessByIsbn(String bussinessId ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(BussinessDao.class).deleteBussinessByIsbn(bussinessId);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int getCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(BussinessDao.class).getCount();//接口代理
        return count;
    }
    
    @Override
    public Bussiness getSignalBussinessyIsbn(String bussinessId ) {
        System.out.println("id------>"+bussinessId);
        this.sqlSession = MyBatisUtils.getSqlSession();
        Bussiness bussiness= this.sqlSession.getMapper(BussinessDao.class).getSignalBussinessyIsbn(bussinessId);//接口代理
        return bussiness;
    }
    
}
