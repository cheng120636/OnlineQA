package com.bdqn.controller.user;

import com.bdqn.entity.User;
import com.bdqn.services.user.UserServices;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/3/13.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserServices userServices;



    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(User user, HttpSession session, Model model){
        System.out.println(user);
        User user1=userServices.queryUserByUserName(user.getUserName());
        if (user1!=null) {
            if (user.getPassword().equals(user1.getPassword())) {
                session.setAttribute("loginUser", user1);
                return "main";
            }
            model.addAttribute("message","登录失败,密码错误!");
            return "index1";
        }
        model.addAttribute("message","登录失败,用户名不存在!");
        return "index1";
    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        return "index1";
    }
    @RequestMapping("toMain")
    public String toMain(){
        return "main";
    }

}
