package com.bdqn.controller.answers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.bdqn.entity.Answers;
import com.bdqn.services.answers.AnswerServices;
import com.bdqn.services.questions.QuestionServices;
import com.bdqn.util.Message;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/3/13.
 */
@Controller
@RequestMapping("answers")
public class AnswersController {
    @Resource
    private AnswerServices answerServices;
    @Resource
    private QuestionServices questionServices;

    @RequestMapping(value = "queryAnswers",method = RequestMethod.GET)
    public String queryAnswers(Integer pageNum,Integer pageSize,Integer questionId, HttpSession session, Model model){
        PageInfo<Answers> pageInfo = answerServices.queryAnswerByQuestionId(pageNum,pageSize,questionId);
        for (Answers answers :pageInfo.getList() ) {
            session.setAttribute("pageInfo1",answers.getQuestions().getId());
        }
        session.setAttribute("questionId",questionId);
        model.addAttribute("pageInfo",pageInfo);
        return "answers";
    }

    @ResponseBody
    @RequestMapping(value = "addAnswer",method = RequestMethod.POST,
    produces = {"application/json;charset=utf-8"})
    public String addAnswer(Answers answers){
        int n = answerServices.addAnswer(answers);
        int n1=questionServices.updateQuestion(answers.getQuestions());
        if (n>0&&n1>0){
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    @RequestMapping("toMain")
    public String toMain(){
        return "main";
    }
}
