package com.bdqn.services.questions;

import com.bdqn.entity.Questions;
import com.github.pagehelper.PageInfo;

/**
 * Created by Administrator on 2018/3/13.
 */
public interface QuestionServices {
    public PageInfo<Questions> queryAllQuestions(Integer pageNum, Integer pageSize);
    public Integer addNewQuestion(Questions questions);
    public Integer updateQuestion(Questions questions);
    public PageInfo<Questions> queryQuestionByUserId(Integer userId, Integer pageNum, Integer pageSize);
    public Integer deleteQuestionById(Integer id);
    public Questions queryQuestionById(Integer id);
    public Integer updateQuestionByTitle(Questions questions);


}
