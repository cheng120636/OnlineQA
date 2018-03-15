package com.bdqn.dao.answers;

import com.bdqn.entity.Answers;

import java.util.List;

/**
 * Created by Administrator on 2018/3/12.
 */
public interface AnswersMapper {
    public List<Answers> queryAnswerByQuestionId(Integer questionId);
    public Integer addAnswer(Answers answers);

}
