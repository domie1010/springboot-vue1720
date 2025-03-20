package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Appoint;
import com.lanysec.rbac.user.model.web.Client;
import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.AppointService;
import com.lanysec.rbac.user.service.web.ClientService;
import com.lanysec.rbac.user.service.web.UserService;

@Controller
public class ClientController {
    @Autowired
    ClientService cs;
    @Autowired
    AppointService as;
    @Autowired
    UserService us;
    @RequestMapping("/client/toClientList")
    public String toDogList(Model model){
        List<Client> list=cs.getClientList(0 , 4);
        model.addAttribute("list" , list);
        return"/jsp/client_list.jsp";
    }
    @RequestMapping("/client/addClient")
    public void addDogType(Client client,String password,HttpServletRequest request,PrintWriter pw){
        String clientIsbn="C"+ new Date().getTime();
        client.setClientIsbn(clientIsbn);
        boolean flag=false;
        int count =cs.addClient(client);
        User user=new User();
        user.setAccount(client.getClientIsbn());
        if(password==null){
            user.setPassword("123");
        }
        else{
            user.setPassword(password);
        }
        user.setUserLimit("client");
        us.addUser(user);
        if(count>0){flag=true;}
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flag" , flag);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping("/client/toTargetClientPage")
    public void toTargetDogTypePage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*8;
        List<Client> list=cs.getClientList(startNum , 8);
        int count=cs.getCount();
        System.out.println(Page+"数量----->>"+count);
        System.out.println("异步获取"+list.toString());
        if(count<=8){
            count=2;
        }
        if(count%8!=0){
            count=count/8+2;
        }
        System.out.println("条数"+count);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("list" , list);
        map.put("count" , count);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping("/client/getSignalClientByIsbn")
    public void getSignalDogByIsbn(String clientIsbn,PrintWriter pw){
        Client client =cs.getSignalClientByIsbn(clientIsbn);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("client" , client);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping("/client/toModPage")
    public String toModPage(String clientIsbn,Model model){
        System.out.println("进入下载数据-----");
        Client client =cs.getSignalClientByIsbn(clientIsbn);
        //System.out.println("信息----"+client.toString());
        model.addAttribute("client" , client);
        return "/jsp/client_mod.jsp";
    }
    @RequestMapping("/client/modifyClientByIsbn")
    public String modifyDogByIsbn(Client client,PrintWriter pw){
        boolean flag=false;
        int count = cs.updateClient(client);

        return"redirect:/client/toClientList";
    }
    @RequestMapping("/client/delClientByIsbn")
    public void delDogByIsbn(String clientIsbn,PrintWriter pw){
        boolean flag=false;
        int count=cs.deleteClientByIsbn(clientIsbn);
        if(count>0){flag=true;}
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flag" , flag);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    @RequestMapping("client/toClientAppointList")
    public String toClientAppointList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<Appoint> list=as.getAppointListByStatus("未接单" , 0 , 6);
        model.addAttribute("list" , list);
        return"/jsp/client_appoint_list.jsp";
    }
    @RequestMapping("/client/toClientTargetAppointPage")
    public void toClientTargetAppointPage(HttpServletRequest request,Integer Page,PrintWriter pw){
        System.out.println("信息获取");
        HttpSession session=request.getSession();
        List<Appoint> list =new ArrayList<>();
        String userAccount=(String)session.getAttribute("account");
        String userLimit=(String)session.getAttribute("userLimit");
        System.out.println("用户权限----"+userLimit);
        list=as.getAppointListByStatus("未接单" , 0 , 6);
        System.out.println(userAccount+"----123----"+list.toString());
        int count=as.getCount();
        if(count<=6){
            count=2;
        }
        if(count%6!=0){
            count=count/6+2;
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("list" , list);
        map.put("count" , count);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping("/client/getAppoint")
    public void getAppoint(HttpServletRequest request,String appointId,PrintWriter pw){
        boolean flag=false;
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        Appoint appoint =as.getSignalAppointById(appointId);
        appoint.setAcceptAccount(userAccount);
        appoint.setAppointStatus("已接单");
        int count= as.updateAppoint(appoint);
        if(count>0){
            flag=true;
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flag" , flag);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping(path="/client/toAddClientAssment",method={RequestMethod.GET})
    public String  toAddClientAssment(String appointId,Model model){
        Appoint appoint=as.getSignalAppointById(appointId);
        model.addAttribute("appoint" , appoint);

        return"/jsp/client_assment_add.jsp";
    }
    @RequestMapping("/client/addAssment")
    public String addAssment(Appoint appoint){
        as.updateClientAppointAssment(appoint);
        System.out.println("跳转到指定");
        return"redirect:/client/toClientOwnAppointList";
        
        
    }
    @RequestMapping("/client/toClientOwnAppointList")
    public String toClientOwnAppointList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<Appoint> list=as.getBussinessAppointList(userAccount, 0 , 6);
        model.addAttribute("list" , list);
        return "/jsp/client_own_appoint_list.jsp";
    }
    @RequestMapping("/client/toClientOwnTargetAppointPage")
    public void toClientOwnTargetAppointPage(HttpServletRequest request,Integer Page,PrintWriter pw){
        int startNum=(Page-1)*6;
        System.out.println("信息获取");
        HttpSession session=request.getSession();
        List<Appoint> list =new ArrayList<>();
        String userAccount=(String)session.getAttribute("account");
        System.out.println("用户权限----"+userAccount);
        list=as.getBussinessAppointList(userAccount ,startNum , 6);
        System.out.println(userAccount+"----123----"+list.toString());
        int count=as.getCount();
        if(count<=6){
            count=2;
        }
        if(count%6!=0){
            count=count/6+2;
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("list" , list);
        map.put("count" , count);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
}
