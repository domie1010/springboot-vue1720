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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Appoint;
import com.lanysec.rbac.user.service.web.AppointService;
@Controller
public class AppointController {
    @Autowired
    AppointService as;
    
    @RequestMapping("/appoint/toAppointList")
    public String toAppointList(Model model){
        List<Appoint> list=as.getAppointList(0 , 6);
        model.addAttribute("list" , list);
        return"/jsp/appoint_list.jsp";
    }
    @RequestMapping("/appoint/toTargetAppointPage")
    public void toTargetAppointPage(HttpServletRequest request,Integer Page,PrintWriter pw){
        System.out.println("信息获取");
        HttpSession session=request.getSession();
        List<Appoint> list =new ArrayList<>();
        String userAccount=(String)session.getAttribute("account");
        String userLimit=(String)session.getAttribute("userLimit");
        System.out.println("用户权限----"+userLimit);
        
        System.out.println("管理员用户");
        int startNum=(Page-1)*6;
        list=as.getAppointList(startNum , 6);
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
    @RequestMapping("/appoint/getSignalAppointByIsbn")
    public void getSignalAppointByIsbn(String appointId,PrintWriter pw){
        Appoint appoint=as.getSignalAppointById(appointId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("appoint" , appoint);
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
    @RequestMapping("/appoint/toModPage")
    public String toModPage(String appointId,Model model,HttpServletRequest request){
        Appoint appoint=as.getSignalAppointById(appointId);
        HttpSession session=request.getSession();
        String userLimit=(String)session.getAttribute("userLimit");
        model.addAttribute("appoint" , appoint);
        if(userLimit.equals("admin")){
            return "/jsp/appoint_mod.jsp";
        }else{

            return "/jsp/bussiness_appoint_mod.jsp";
        }

        
    }
    @RequestMapping("/appoint/modifyAppointByIsbn")
    public String modifyAppointByIsbn(Appoint appoint,PrintWriter pw){
        System.out.println("订单信息----"+appoint.toString());
        boolean flag=false;
        int count = as.updateAppoint(appoint);
        
        return"redirect:/appoint/toAppointList";
    }
    @RequestMapping("/appoint/delAppointByIsbn")
    public void delAppointByIsbn(String appointId,PrintWriter pw){
        boolean flag=false;
        int count=as.deleteAppointByIsbn(appointId);
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
    @RequestMapping("/appoint/addAppoint")
    public void addAppoint(Appoint appoint,HttpServletRequest request,PrintWriter pw){
        String appointId="A"+ new Date().getTime();
        appoint.setAppointId(appointId);
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
        String appointTime=d.format(new Date());
        appoint.setAppointTime(appointTime);
        appoint.setAppointStatus("已处理");
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
    
}
