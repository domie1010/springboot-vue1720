package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Bussiness;
import com.lanysec.rbac.user.model.web.Client;
import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.BussinessService;
import com.lanysec.rbac.user.service.web.ClientService;
import com.lanysec.rbac.user.service.web.UserService;

@Controller
public class UserController {

    @Autowired
    UserService us;
    @Autowired
    BussinessService bs;
    @Autowired
    ClientService cs;
    @RequestMapping("/user/login")
    public String toLoginPage(){
        return"/jsp/login.jsp";
    }
    @RequestMapping("/user/addUser")
    public void addUser(User user,String name,PrintWriter pw){
        String userLimit=user.getUserLimit();
        if(userLimit.equals("client")){
            Client client=new Client();
            String Id="C"+ new Date().getTime();
            user.setAccount(Id);
            client.setClientIsbn(Id);
            client.setClientName(name);
            client.setClientSex("未填写");
            client.setClientAge("未填写");
            cs.addClient(client);
            us.addUser(user);

        }
        else{
            String Id="B"+ new Date().getTime();
            Bussiness bussiness=new Bussiness();
            user.setAccount(Id);
            bussiness.setBussinessId(Id);
            bussiness.setBussinessAddress("未填写");
            bussiness.setBussinessName(name);
            bussiness.setBussinessPhone("未填写");
            bs.addBussiness(bussiness);
            us.addUser(user);
        }
        boolean flag=false;
        System.out.println("用户信息---==="+user.getAccount().toString());
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("user" , user);
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
    @RequestMapping("/user/main")
    public String Login(Model model,String account,String password,HttpServletRequest request){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        System.out.println(account+"-----"+password);
        User user = null;
        try{
            user = us.login(account , password);
            System.out.println("----->>>"+user.toString());
            System.out.println(user.toString());
            if(account.equals(user.getAccount())&&password.equals(user.getPassword()))
            {    System.out.println("等铁路成功");
            session.setAttribute("account" , account);
            session.setAttribute("userLimit" , user.getUserLimit());
            System.out.println("权限"+user.getUserLimit());
            if(user.getUserLimit().equals("admin")){
                return"/jsp/main.jsp";
            }if(user.getUserLimit().equals("bussiness")){
                return"/jsp/bussiness_main.jsp";
            }
            else{
                return"/jsp/client_main.jsp";
            }
            }
            else{
                model.addAttribute("account" , account);
                model.addAttribute("error_message" , "用户名或密码错误!");
                return"/jsp/login.jsp";
            }
        }catch(RuntimeException ex){
            model.addAttribute("account" , account);
            model.addAttribute("error_message" , ex.getMessage());
            return"/sjsp/login.jsp";
        }

    }
    @RequestMapping("/user/loginOut")
    public String loginOut(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        return "/jsp/login.jsp";
    }
    @RequestMapping("/user/toModifPassPage")
    public String toModifPassPage()
    {
        return"/jsp/modifyPass.jsp";
    }
    @RequestMapping("/user/modifyUserPass")
    public void  modifyUserPass(String account,String password,String newPassword,PrintWriter pw){
        System.out.println(newPassword+"进入密码修改"+password);
        boolean flag=false;
        try{
            User user=us.login(account , password);
            flag=us.modifyUserPass(account , newPassword);
        }catch(Exception e1){
            // TODO Auto-generated catch block
            flag=false;
            System.out.println("出现异常");
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
}
