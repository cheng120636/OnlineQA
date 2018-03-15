package com.bdqn.services.answers;

import com.bdqn.entity.Answers;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/3/13.
 */
public interface AnswerServices {
    public PageInfo<Answers> queryAnswerByQuestionId(Integer pageNum, Integer pageSzie, Integer questionId);
    public Integer addAnswer(Answers answers);
}
