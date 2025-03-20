package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.lanysec.rbac.user.model.web.Bussiness;
import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.AppointService;
import com.lanysec.rbac.user.service.web.BussinessService;
import com.lanysec.rbac.user.service.web.UserService;

@Controller
public class BussinessController {
    @Autowired
    BussinessService bs;
    @Autowired
    AppointService as;
    /***/
    @Autowired
    UserService us;
    @RequestMapping("/bussiness/toBussinessList")
    public String toBussinessList(Model model){
        System.out.println("进入商家处理----");
        List<Bussiness> list=bs.getBussinessList(0 , 4);
        model.addAttribute("list" , list);
        return"/jsp/bussiness_list.jsp";
    }
    @RequestMapping("/bussiness/addBussiness")
    public void addBussiness(Bussiness bussiness,String password,HttpServletRequest request,PrintWriter pw){
        String bussinessId="B"+ new Date().getTime();
        bussiness.setBussinessId(bussinessId);
        boolean flag=false;
        int count =bs.addBussiness(bussiness);
        User user=new User();
        user.setAccount(bussinessId);
        if(password==null){
            user.setPassword("123");
        }
        else{
            user.setPassword(password);
        }
        user.setUserLimit("bussiness");
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
    @RequestMapping("/bussiness/toTargetBussinessPage")
    public void toTargetBussinessPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*4;
        List<Bussiness> list=bs.getBussinessList(startNum , 4);
        int count=bs.getCount();
        System.out.println(Page+"数量----->>"+count);
        System.out.println("异步获取"+list.toString());
        if(count<=4){
            count=2;
        }
        if(count%4!=0){
            count=count/4+2;
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
    @RequestMapping("/bussiness/getSignalBussinessByIsbn")
    public void getSignalBussinessByIsbn(String bussinessId,PrintWriter pw){
        System.out.println("编号----->>"+bussinessId);
        Bussiness bussiness =bs.getSignalBussinessyIsbn(bussinessId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("bussiness" , bussiness);
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
    @RequestMapping("/bussiness/toModPage")
    public String toModPage(String bussinessId,Model model){
        Bussiness bussiness =bs.getSignalBussinessyIsbn(bussinessId);
        model.addAttribute("bussiness" , bussiness);
        return "/jsp/bussiness_mod.jsp";
    }
    @RequestMapping("/bussiness/modifyBussinessByIsbn")
    public String modifyBussinessByIsbn(HttpServletRequest request,Bussiness bussiness,PrintWriter pw){
        boolean flag=false;
        HttpSession session=request.getSession();
        String userLimit=(String)session.getAttribute("userLimit");
        int count = bs.updateBussiness(bussiness);
        if(userLimit.equals("admin")){
            return"/jsp/bussiness_list.jsp";
        }else{
            return"/jsp/bussiness_main.jsp";
        }
        
        

    }
    @RequestMapping("/bussiness/delBussinessById")
    public void delBussinessById(String bussinessId,PrintWriter pw){
        boolean flag=false;
        int count=bs.deleteBussinessByIsbn(bussinessId);
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
    @RequestMapping("/bussiness/addBussinessAppoint")
    public void addAppoint(Appoint appoint,HttpServletRequest request,PrintWriter pw){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        String appointId="A"+ new Date().getTime();
        appoint.setAppointId(appointId);
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
        String appointTime=d.format(new Date());
        appoint.setAppointTime(appointTime);
        appoint.setAppointStatus("未接单");
        appoint.setPostAccount(userAccount);
        appoint.setAcceptAccount("暂无");
        appoint.setBusinessAssment("暂无评价");
        appoint.setClientAssment("暂无评价");
        boolean flag=false;
        int count =as.addAppoint(appoint);
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
    @RequestMapping("/bussiness/toModBussiness")
    public String toModBussiness(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        Bussiness bussiness=bs.getSignalBussinessyIsbn(userAccount);
        model.addAttribute("bussiness" , bussiness);
        return "/jsp/bussiness_info_mod.jsp";
    }
    @RequestMapping(path="/bussiness/toAddBussinessAssmen",method={RequestMethod.GET})
    public String  toAddBussinessAssmen(String appointId,Model model){
        Appoint appoint=as.getSignalAppointById(appointId);
        model.addAttribute("appoint" , appoint);
        
        return"/jsp/bussinesss_assment_add.jsp";
    }
    @RequestMapping("/bussiness/addAssment")
    public String addAssment(Appoint appoint){
        System.out.println("评价"+appoint.toString());
        as.updateBussinessAppointAssment(appoint);
        return"redirect:/appoint/toAppointList";
        
        
    }
    @RequestMapping("/bussiness/toBussinessOwnAppointList")
    public String toBussinessOwnAppointList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<Appoint> list=as.getBussinessAppointList(userAccount, 0 , 6);
        model.addAttribute("list" , list);
        return "/jsp/bussiness_appoint_list.jsp";
    }
    @RequestMapping("/bussiness/toBussinessOwnTargetAppointPage")
    public void toBussinessOwnTargetAppointPage(HttpServletRequest request,Integer Page,PrintWriter pw){
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
