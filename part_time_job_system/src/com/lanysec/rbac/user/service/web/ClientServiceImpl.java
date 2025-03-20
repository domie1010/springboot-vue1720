package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.ClientDao;
import com.lanysec.rbac.user.model.web.Client;
@Service
public class ClientServiceImpl implements ClientService{
    private Logger logger = Logger.getLogger(ClientServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<Client> getClientList(int startNum , int page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Client> list= this.sqlSession.getMapper(ClientDao.class).getClientList(startNum , page);//接口代理
        return list;
    }
    
    @Override
    public int addClient(Client client ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(ClientDao.class).addClient(client);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int updateClient(Client client ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(ClientDao.class).updateClient(client);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int deleteClientByIsbn(String clientIsbn ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(ClientDao.class).deleteClientByIsbn(clientIsbn);//接口代理
        this.sqlSession.commit();
        return count;
    }
    
    @Override
    public int getCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count= this.sqlSession.getMapper(ClientDao.class).getCount();//接口代理
        return count;
    }
    
    @Override
    public Client getSignalClientByIsbn(String clientIsbn ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Client client= this.sqlSession.getMapper(ClientDao.class).getSignalClientByIsbn(clientIsbn);//接口代理
        return client;
    }
    
}
