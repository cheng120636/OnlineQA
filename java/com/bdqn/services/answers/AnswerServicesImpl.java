package com.bdqn.services.answers;

import com.bdqn.dao.answers.AnswersMapper;
import com.bdqn.entity.Answers;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/13.
 */
@Service
public class AnswerServicesImpl implements AnswerServices {
    @Resource
    private AnswersMapper answersMapper;
    @Override
    public PageInfo<Answers> queryAnswerByQuestionId(Integer pageNum,Integer pageSzie,Integer questionId) {
        PageHelper.startPage(pageNum,pageSzie);
        List<Answers> list = answersMapper.queryAnswerByQuestionId(questionId);
        return new PageInfo<>(list);
    }

    @Override
    public Integer addAnswer(Answers answers) {
        return answersMapper.addAnswer(answers);
    }
}
