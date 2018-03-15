package com.bdqn.controller.questions;

import com.alibaba.fastjson.JSON;
import com.bdqn.entity.Questions;
import com.bdqn.services.questions.QuestionServices;
import com.bdqn.util.Message;
import com.github.pagehelper.PageInfo;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/3/13.
 */
@Controller
@RequestMapping(value = "question")
public class QuestionController {
    @Autowired
    private QuestionServices questionServices;

    @RequestMapping(value = "queryAll",method = RequestMethod.GET)
    public String queryAll(Integer pageNum, Integer pageSize,String title,HttpSession session, Model model){
        System.out.println(title);
        PageInfo<Questions> pageInfo = questionServices.queryAllQuestions(pageNum, pageSize,title);
        model.addAttribute("pageInfo",pageInfo);
        return "questions";
    }
    @ResponseBody
    @RequestMapping(value = "addQuestions",method = RequestMethod.POST,
    produces = {"application/json;charset=utf-8"})
    public String addQuestions(Questions questions){
        int n = questionServices.addNewQuestion(questions);
        if (n>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }


    @RequestMapping("queryQuestion")
    public String queryQuestion(Integer pageNum, Integer pageSize,Integer userId, Model model){
        PageInfo<Questions> pageInfo = questionServices.queryQuestionByUserId(userId,pageNum, pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "myQuestions";
    }
    @ResponseBody
    @RequestMapping(value = "queryQuestionById",method = RequestMethod.GET,
    produces = {"application/json;charset=utf-8"})
  public String queryQuestionById(Integer id){
        Questions questions = questionServices.queryQuestionById(id);
        return JSON.toJSONString(questions);
  }

    @ResponseBody
    @RequestMapping(value = "updateQuestionByTitle",method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    public String updateQuestionByTitle(Questions questions){
      int n = questionServices.updateQuestionByTitle(questions);
      if (n>0){
          return JSON.toJSONString(Message.success());
      }
      return JSON.toJSONString(Message.error());
    }
    @ResponseBody
    @RequestMapping(value = "deleteQuestion",method = RequestMethod.GET,
            produces = {"application/json;charset=utf-8"})
    public String deleteQuestin(Integer id){
        int n = questionServices.deleteQuestionById(id);
        if (n>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }
}


