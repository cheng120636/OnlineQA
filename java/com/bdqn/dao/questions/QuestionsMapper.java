package com.bdqn.dao.questions;

import com.bdqn.entity.Questions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/3/12.
 */
public interface QuestionsMapper {
    public List<Questions> queryAllQuestions(@Param("title")String title);
    public Integer addNewQuestion(Questions questions);
    public Integer updateQuestion(Questions questions);
    public Integer updateQuestionByTitle(Questions questions);
    public List<Questions> queryQuestionByUserId(Integer userId);
    public Integer deleteQuestionById(Integer id);
    public Questions queryQuestionById(Integer id);

}
